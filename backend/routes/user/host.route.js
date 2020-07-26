const express = require('express');
const roomModel = require('../../models/room/room.models');
const multer = require('multer');
const mkdirp = require('mkdirp');
const jwt = require('jsonwebtoken');
const hostModels = require('../../models/user/host.models');
const router = express.Router();
const fs = require('fs');

//private key for token
const privateKey = require('../../config/default.json').secret;
const paginate = require('../../config/default.json').paginate;

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const dir = './public/imgs/'+req.params.id;
        mkdirp(dir, err => cb(err, dir))
    },
    filename: async function (req, file, cb) {
        var newFileName = file.fieldname + '-'+file.originalname;
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
            let tiennghicuaphong
            if (req.body.tiennghicuaphong){
                tiennghicuaphong = [...req.body.tiennghicuaphong];
            }
            else {
                tiennghicuaphong = null;
            }
            delete req.body.tiennghicuaphong;
            const entity = req.body;
            const result = await hostModels.addRoom(entity);
            if (result.insertId > 0 && tiennghicuaphong) {
                for (let val = 0;val<tiennghicuaphong.length;val++){
                    await roomModel.addTienNghiCuaPhong({'phong':result.insertId,'tiennghi':tiennghicuaphong[val]});
                }
                res.send({ 'id': result.insertId });
             }
            else res.sendStatus(500);
        }
    });
    
});

router.post('/upload/:id',async function(req, res) {
    const row = await roomModel.getImg(req.params.id);
    if (row.length>0){
        for (let index = 0; index < row.length; index++) {
            const subURL = './public' + row[index].img.substring(21);
            try {
                fs.unlinkSync(subURL);
            } catch (err) {
                // handle the error
                console.log(`Delete img fail: ${row[index].img}`)
            }
        }
        const resultDel = await roomModel.delImg(req.params.id);
        if (resultDel.affectedRows==0){
            console.log("Delete img fail in db");
        }
    }
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

router.get('/:id',async (req,res,next) => {
    if (isNaN(req.params.id)){
        next();
    }
    else {
        const row = await hostModels.getHost(req.params.id);
        if (row.length>0)
        {
            res.send(row[0])
        }
        else {
            res.send('false');
        }
    }
});

router.get('/roomowner/:id',async (req,res) => {
    if (isNaN(req.params.id)){
        res.send('false');
    }
    else {
        let row = await hostModels.getRoomByHost(req.params.id);
        let room = [];
        if (row.length>0)
        {
            for (let i = 0; i < row.length; i++) {
                row[i].danhgia  = await hostModels.getVoteInRoom(req.params.id,row[i].id);
            }
            res.send(row);
        }
        else {
            res.send('false');
        }
    }
});

router.post('/roomowner/:id/update',verifyToken,async (req,res) => {
    if (isNaN(req.params.id)){
        res.send('false');
    }
    else {
        jwt.verify(req.token,privateKey, async (err,authData)=>{
            if (err){
                res.sendStatus(404);
            } else {
                req.body.nguoiDang = authData.user.id;
                const checkAdd = await roomModel.single(req.params.id);
                if (checkAdd.nguoiDang!=authData.user.id)
                {
                    res.sendStatus(403);
                }
                let tiennghicuaphong
                if (req.body.tiennghicuaphong){
                    tiennghicuaphong = [...req.body.tiennghicuaphong];
                }
                else {
                    tiennghicuaphong = null;
                }
                delete req.body.tiennghicuaphong;
                const entity = req.body;
                const result = await roomModel.updateRoom(entity,req.params.id);
                if (result.affectedRows!=0){
                    if (tiennghicuaphong){
                        const resultRemove = await roomModel.removeAllTienNghi(req.params.id);
                        for (let val = 0;val<tiennghicuaphong.length;val++){
                            await roomModel.addTienNghiCuaPhong({'phong':req.params.id,'tiennghi':tiennghicuaphong[val]});
                        }
                    }
                    res.sendStatus(200);
                }
                else {
                    res.sendStatus(501);
                }
            }
        });
    }
});

router.get('/reservations',verifyToken, async(req, res) => {
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            let result,page;
            let filter = '';
            if (req.query.filter && req.query.filter != -1){
                filter = `danhsachdatphong.phong = ${req.query.filter} and`
            }
            if (!req.query.title_like){
                [result,page] = await Promise.all([hostModels.getWhoBookTheRoom(authData.user.id,filter,paginate.limit,5*(req.query.page-1)),hostModels.getNumPage(authData.user.id,filter)]);
            }
            else {
                [result,page] = await Promise.all([hostModels.getWhoBookTheRoomSearch(authData.user.id,filter,req.query.title_like,paginate.limit,5*(req.query.page-1)),
                hostModels.getNumPageSearch(authData.user.id,filter,req.query.title_like)])
            }

            let num_page = page[0].num_page;
            const more = num_page%paginate.limit !== 0 ? 1 : 0;
            num_page = Math.floor(num_page/paginate.limit) + more;
            if (!req.query.filter && result.length > 0) {
                
                res.send([result,num_page]);
            }
            else if (req.query.filter) {
                res.send([result,num_page]);
            }
            else res.sendStatus(404);
        }
    });
    
});

router.get('/reservations/:id',verifyToken, async(req, res) => {
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            const result = await hostModels.getWhoBookTheRoomD(req.params.id,authData.user.id);
            if (result.length > 0) {
                
                res.send(result[0]);
             }
            else res.sendStatus(500);
        }
    });
    
});
module.exports = router;