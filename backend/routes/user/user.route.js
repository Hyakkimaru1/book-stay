const express = require('express');
const userModels = require('../../models/user/user.models');
const adminModels = require('../../models/admin/admin.models');
const roomModels = require('../../models/room/room.models');
const jwt = require('jsonwebtoken');
const nodeMailer = require('../../models/user/sendMail.models')
const dayByDay = require('../../public/js/getDayByDay');
const momoModels = require('../../models/momo/momo.models');

//private key for token
const privateKey = require('../../config/default.json').secret;
var bcrypt = require('bcryptjs');
var Cookies = require('js-cookie');
const router = express.Router();


router.post('/profile', verifyToken, async(req, res) => {
    jwt.verify(req.token, privateKey, async(err, authData) => {
        if (err) {
            res.sendStatus(404);
        } else {
            const row = await userModels.single(authData.user.id);
            delete row.pass;
            delete row.id;
            delete row.timeCreate;
            res.send(row);
        }
    });
});

router.post('/profile/update', verifyToken, async(req, res) => {
    jwt.verify(req.token, privateKey, async(err, authData) => {
        if (err) {
            res.sendStatus(404);
        } else {
            const row = await userModels.updateUser(req.body, authData.user.id);
            if (row.insertId !== null && row.insertId !== undefined) {
                res.send('oke');
            } else res.sendStatus(400);
        }
    });
});

router.post('/login', async(req, res) => {



    if (req.body) {
        // check is user or admin
        
        const rowAdmin = await adminModels.singleUsername(req.body.username);
        if (rowAdmin){
            const rs = bcrypt.compareSync(req.body.password, rowAdmin.pass);
            if (rs)
                {
                    delete rowAdmin.pass;
                    //if admin will send token admin
                    //jwt.sign({user:row,admin:true}, privateKey, function(err, token)
    
                    jwt.sign({user:rowAdmin,admin:true}, privateKey, function(err, token) {
                        if (err){
                            res.send(500);
                        }
                        res.send({token,id:rowAdmin.id,ten:rowAdmin.email,email:rowAdmin.email,avt:"https://cdn.luxstay.com/users_avatar_default/default-avatar.png",admin:true});
                    });
                } 
            else res.sendStatus(403);
        }
        else {
            const row = await userModels.singleUsername(req.body.username);
        
            if (!row){
                res.sendStatus(404);
            }
            else {
                const rs = bcrypt.compareSync(req.body.password, row.pass);
                if (rs)
                    {
                        delete row.pass;
                        delete row.gioitinh;
                        delete row.diachi;
                        delete row.timeCreate;
                        //if admin will send token admin
                        //jwt.sign({user:row,admin:true}, privateKey, function(err, token)
        
                        jwt.sign({user:row}, privateKey, function(err, token) {
                            if (err){
                                res.send(500);
                            }
                            res.send({token,id:row.id,ten:row.ten,email:row.email,sdt:row.sdt,avt:row.avatar,admin:false});
                        });
                    } 
                else res.sendStatus(403);
            }
        }
    }
    else {
        res.sendStatus(403);
    }

});


router.post('/signup', async(req, res) => {
    if (req.body) {

        const row = await userModels.singleUsername(req.body.email);

        if (row) {
            res.sendStatus(404);
        } else {
            const entity = req.body;
            entity.pass = bcrypt.hashSync(req.body.pass, 10);

            const add = await userModels.addUser(entity);
            if (add) {
                const row2 = await userModels.singleUsername(req.body.email);
                const data = { id: row2.id }
                jwt.sign({ user: data }, privateKey, function(err, token) {
                    res.send({ token, id: data.id });
                });
            } else {
                res.sendStatus(403);
            }
        }
    } else res.sendStatus(403);

});

router.post('/forgotpw', async(req, res) => {
    if (req.body) {

        const row = await userModels.singleUsername(req.body.email);

        if (!row) {
            res.sendStatus(404);
        } else {
            const data = nodeMailer.sendOTP(req.body.email);

            res.send({ otp: data.otp });

        }
    } else res.sendStatus(403);

});

router.post('/resetpw', async (req, res) =>{
    if (req.body) {
        
        const entity = req.body;
        entity.pass = bcrypt.hashSync(req.body.pass, 10);
        const row = await userModels.patchByEmail(entity);
        
        if(!row){
            res.sendStatus(404);
        }
        else{
            
            res.send({id:1});
            
        }
    }
    else  res.sendStatus(403);
    
    });


router.post('/loginAgain', verifyToken, async(req, res) => {
    jwt.verify(req.token, privateKey, (err, authData) => {
        if (err) {
            res.sendStatus(404);
        } else {
            if (authData.admin){
                res.send({id:authData.user.id,ten:authData.user.email,sdt:'',avt:'https://cdn.luxstay.com/users_avatar_default/default-avatar.png',admin:true});
            }
            else {
                res.send({id:authData.user.id,ten:authData.user.ten,email:authData.user.email,sdt:authData.user.sdt,avt:authData.user.avatar,admin:false});
            }
            
        }
    });
});

router.post('/forgotpassword', async(req, res) => {
    const row = await userModels.getUserByEmail(req.body.email);
    if (row) {
        const currentDate = new Date();
        const countDownTime = new Date(currentDate.getTime() + 5 * 60000);
        const randomnumber = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;

        const [result,resultSendMail] = await Promise.all([userModels.addRecoveryKey( {user:row.id,keyRecovery:randomnumber}),
        nodeMailer.sendKeyToEmail(row.email,randomnumber)]);
        if (resultSendMail){
            const x = setTimeout(async() => {
                await userModels.removeRecoveryKey({id:result.insertId});
            }, 4*60000);
        }
        res.send({time:countDownTime,id:row.id});
    }
    else res.sendStatus(404);
});

router.post('/confirmkey', async(req, res) => {
    if (isNaN(req.body.key)) {
        res.sendStatus(400);
    } else {
        const row = await userModels.getRecoveryKey(req.body.id, req.body.key);
        if (row.length > 0) {
            userModels.removeRecoveryKey({ user: req.body.id });
            jwt.sign({ id: req.body.id }, privateKey, { expiresIn: '1h' }, function(err, token) {
                if (err) {
                    res.send(500);
                } else {
                    res.send({ token });
                }
            });
        } else res.sendStatus(404);
    }
});

router.post('/changepassword', async(req, res) => {
    jwt.verify(req.body.token, privateKey, async(err, authData) => {
        if (err) {
            res.sendStatus(404);
        } else {
            const hash = bcrypt.hashSync(req.body.password);
            const row = await userModels.updateUser({ pass: hash }, authData.id);
            if (row.affectedRows > 0) {
                res.sendStatus(200);
            } else {
                res.sendStatus(503);
            }
        }
    });
});






//verify the token
function verifyToken(req, res, next) {
    //Get token in cookies
    if (req.cookies) {
        req.token = req.cookies.token;
        next();
    } else {
        res.sendStatus(403);
    }
}

router.get('/mybooking/:id', verifyToken, async(req, res) => {
    let id = req.params.id;
    jwt.verify(req.token, privateKey, async(err, authData) => {
        if (err) {
            res.sendStatus(404);
            console.log(err);
        } else {
            const row = await userModels.allBooking(req.params.id);


            if (row) {
                res.send(row);
            } else res.sendStatus(400);
        }
    });


});


router.post('/mybooking/feedback', verifyToken, async(req, res) => {
    console.log(req.body)
    jwt.verify(req.token, privateKey, async(err, authData) => {

        if (err) {
            //console.log(req.body)
            res.sendStatus(404);
            console.log(err);
        } else {

            const row = await userModels.sendFeedback(req.body);
            if (row) {
                res.send('oke');
            } else res.sendStatus(400);
        }
    });
});

router.post('/cancelbooking',verifyToken,(req,res)=>{
    jwt.verify(req.token, privateKey, async(err, authData) => {
        if (err) {
            //console.log(req.body)
            res.sendStatus(404);
            console.log(err);
        } else {
            //body need id book
            //
            const row = await userModels.getDetailCancel(79);
            if (row.length===0){
                res.sendStatus(404);
            }
            else {
                if (row[0].nguoidat==authData.user.id){
                    const arrayDay = dayByDay(row[0].ngaycheckin,row[0].ngaycheckout);
                    //adding short term out of room to table hetphong 
                    let arrayIdOutOfRoom = [];
                   
                    arrayDay.map( async (val) => {
                        const resultOFR = await roomModels.getOutOffRoom(row[0].phong,val);
                        if (resultOFR.length>0){
                            arrayIdOutOfRoom.push(resultOFR[0].id);
                        }
                    });
                    const resultOFD = await roomModels.updateNguoiDatPhong({trangthai:-1},row[0].id);
                    if (resultOFD.affectedRows===0){
                        res.sendStatus(503);
                    }
                    else {
                        //call momo to refund cast
                        // const resultRefund = await momoModels.sendRequestRefund(row[0].id+"rf",row[0].id,row[0].gia,row[0].transId);
                        arrayIdOutOfRoom.map( async (val) => {
                            await roomModels.removeOutOfRoom({id:val});
                        });
                        res.sendStatus(200);
                    }
                   
                }
                else {
                    res.sendStatus(403);
                }
            }
        }
    });
})









module.exports = router;