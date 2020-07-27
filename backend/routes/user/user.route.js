const express = require('express');
const userModels = require('../../models/user/user.models');
const jwt = require('jsonwebtoken');
const nodeMailer = require('../../models/user/sendMail.models')


//private key for token
const privateKey = require('../../config/default.json').secret;
var bcrypt = require('bcryptjs');
var Cookies = require('js-cookie');
const router = express.Router();


router.get('/profile', (req, res) => {
    res.send('aaaaaaab');
});

router.post('/login', async (req, res) => {
    if (req.body){
        
        const row = await userModels.singleUsername(req.body.username);
        if (!row){
            res.sendStatus(404);
        }
        const rs = bcrypt.compareSync(req.body.password, row.pass);
        if (rs)
            {
                delete row.sdt;
                delete row.pass;
                delete row.avatar;
                delete row.gioitinh;
                delete row.diachi;
                delete row.timeCreate;
                jwt.sign({user:row}, privateKey, function(err, token) {
                    res.send({token,id:row.id});
                });
            } 
        else res.sendStatus(403);
    }
    else {
        res.sendStatus(403);
    }
    
});


router.post('/signup', async (req, res) =>{
if (req.body) {
   
    const row = await userModels.singleUsername(req.body.email);
   
    if(row){
        res.sendStatus(404);
    }

    else{
        const entity = req.body;
        entity.pass = bcrypt.hashSync(req.body.pass, 10);
        
        const add = await userModels.addUser(entity);
        if(add){
            const row2 = await userModels.singleUsername(req.body.email);
            const data = {id:row2.id}
            jwt.sign({user:data}, privateKey, function(err, token) {
                res.send({token,id:data.id});
            });     
        }
        else{
            res.sendStatus(403);
        }
    }
}
else  res.sendStatus(403);

});

router.post('/forgotpw', async (req, res) =>{
    if (req.body) {
      
        const row = await userModels.singleUsername(req.body.email);
       
        if(!row){
            res.sendStatus(404);
        }
    
        else{
            const data = nodeMailer.sendOTP(req.body.email);

            res.send({otp:data.otp});

        }
    }
    else  res.sendStatus(403);
    
    });



    router.post('/resetpw', async (req, res) =>{
        if (req.body) {
          console.log(req.body);
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

router.post('/loginAgain',verifyToken, async (req, res) => {
    jwt.verify(req.token,privateKey,(err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            res.send({id:authData.user.id});
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

router.get('/mybooking/:id', async (req, res,next) => {
    let id =req.params.id;
   
        const row =  await userModels.allBooking(req.params.id);
        console.log(row);
        res.send(row);

});












module.exports = router;