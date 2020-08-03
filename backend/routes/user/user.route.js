const express = require('express');
const userModels = require('../../models/user/user.models');
const jwt = require('jsonwebtoken');

//private key for token
const privateKey = require('../../config/default.json').secret;
var bcrypt = require('bcryptjs');
var Cookies = require('js-cookie');
const router = express.Router();


router.post('/profile',verifyToken, async (req, res) => {
    jwt.verify(req.token,privateKey,async (err,authData)=>{
        if (err){
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

router.post('/profile/update',verifyToken, async (req, res) => {
    jwt.verify(req.token,privateKey,async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            const row = await userModels.updateUser(req.body,authData.user.id);
            if (row.insertId!==null && row.insertId!== undefined)
            {
                res.send('oke');
            }
            else res.sendStatus(400);
        }
    });
});

router.post('/login', async (req, res) => {
    if (req.body){
        // check is user or admin
        const row = await userModels.singleUsername(req.body.username);
        if (!row){
            res.sendStatus(404);
        }
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
                    res.send({token,id:row.id,ten:row.ten,email:row.email,sdt:row.sdt,avt:row.avatar});
                });
            } 
        else res.sendStatus(403);
    }
    else {
        res.sendStatus(403);
    }
    
});

router.post('/loginAgain',verifyToken, async (req, res) => {
    jwt.verify(req.token,privateKey,(err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            res.send({id:authData.user.id,ten:authData.user.ten,email:authData.user.email,sdt:authData.user.sdt,avt:authData.user.avt});
        }
    });
});

router.post('/forgotpassword', async (req, res) => {
    const row = await userModels.getUserByEmail(req.body.email);
    if (row){
        const currentDate = new Date();
        const countDownTime = new Date(currentDate.getTime()+5*60000);
        const randomnumber = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;
        const result = await userModels.addRecoveryKey( {user:row.id,keyRecovery:randomnumber});
        const x = setTimeout(async() => {
            await userModels.removeRecoveryKey({id:result.insertId});
        }, 4*60000);
        res.send({time:countDownTime,id:row.id});
    }
    else res.sendStatus(404);
});

router.post('/confirmkey', async (req, res) => {
    if (isNaN(req.body.key))
    {
        res.sendStatus(400);
    }
    else {
        const row = await userModels.getRecoveryKey(req.body.id,req.body.key);
        if (row.length>0){
            userModels.removeRecoveryKey({user:req.body.id});
            jwt.sign({id:req.body.id}, privateKey, {expiresIn: '1h'},function(err, token) {
                if (err){
                    res.send(500);
                }
                else {
                    res.send({token});
                }
            });
        }
        else res.sendStatus(404);
    }
});

router.post('/changepassword', async (req, res) => {
    jwt.verify(req.body.token,privateKey,async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            const hash = bcrypt.hashSync(req.body.password);
            const row = await userModels.updateUser({pass:hash},authData.id);
            if (row.affectedRows>0){
                res.sendStatus(200);
            }
            else {
                res.sendStatus(503);
            }
        }
    });
});

//verify the token
function verifyToken(req,res,next){
    //Get token in cookies
    if(req.cookies)
    {
        req.token = req.cookies.token;
        next();
    }
    else {
        res.sendStatus(403);
    }
}

module.exports = router;