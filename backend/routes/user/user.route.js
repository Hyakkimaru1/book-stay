const express = require('express');
const userModels = require('../../models/user/user.models');
const jwt = require('jsonwebtoken');

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

module.exports = router;