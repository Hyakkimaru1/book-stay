const express = require('express');
const hostModel = require('../../models/user/host.models');
const roomModel = require('../../models/room/room.models');
const multer = require('multer');
const mkdirp = require('mkdirp');
const jwt = require('jsonwebtoken');
const hostModels = require('../../models/user/host.models');
const router = express.Router();

//private key for token
const privateKey = require('../../config/default.json').secret;

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const dir = './public/imgs/'+req.params.id;
        mkdirp(dir, err => cb(err, dir))
    },
    filename: async function (req, file, cb) {
        var newFileName = file.fieldname + '-' + Date.now();
        await hostModels.addImgRoom({'phong':req.params.id,'img':`http://localhost:3300/imgs/${req.params.id}/${newFileName}`});
        cb(null,newFileName);
      }
});

var upload = multer({ storage: storage }).array('file');

router.post('/upload',verifyToken,async(req, res) => {
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            req.body.nguoiDang = authData.user.id;
            const tiennghicuaphong = [...req.body.tiennghicuaphong];
            delete req.body.tiennghicuaphong;
            const entity = req.body;
            const result = await hostModel.addRoom(entity);
            if (result.insertId > 0) {
                for (let val = 0;val<tiennghicuaphong.length;val++){
                    await roomModel.addTienNghiCuaPhong({'phong':result.insertId,'tiennghi':tiennghicuaphong[val]});
                }
                res.send({ 'id': result.insertId });
             }
            else res.sendStatus(500);
        }
    });
    
});

router.post('/upload/:id',function(req, res) {
    upload(req, res, function (err) {
           if (err instanceof multer.MulterError) {
               return res.status(500).json(err)
           } else if (err) {
               return res.status(500).json(err)
           }
      return res.status(200).send(req.file)
    });
    res.send("oke");

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