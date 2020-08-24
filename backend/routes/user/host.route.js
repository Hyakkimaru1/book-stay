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

router.get('/managerooms',verifyToken,async (req,res) => {
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            if (authData.admin){
                if (req.query.title_like)
                    res.redirect(`../admin/admin?title_like=${req.query.title_like}`);
                else {
                    res.redirect('../admin/admin');   
                }
            }
            else {
                let row;
                if (req.query.title_like){
                    row = await hostModels.getRoomManageSearch(authData.user.id,req.query.title_like);
                }
                else {
                    row = await hostModels.getRoomManage(authData.user.id);
                }
               
                res.send(row);
            }
        }
    });
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
                if (authData.admin){

                }
                else {
                    req.body.nguoiDang = authData.user.id;
                    const checkAdd = await roomModel.single(req.params.id);
                    if (checkAdd.nguoiDang!=authData.user.id)
                    {
                        res.sendStatus(403);
                    }
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
                                try {
                                    await roomModel.addTienNghiCuaPhong({'phong':req.params.id,'tiennghi':tiennghicuaphong[val]});
                            
                                } catch (error) {
                                }
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

router.post('/roomowner/:id/updateStatus',verifyToken,async (req,res) => {
    if (isNaN(req.params.id)){
        res.send('false');
    }
    else {
        jwt.verify(req.token,privateKey, async (err,authData)=>{
            if (err){
                res.sendStatus(404);
            } else {
                //make a router for admin then check this
                req.body.nguoiDang = authData.user.id;
                const checkAdd = await roomModel.single(req.params.id);
                if (authData.admin){
                    let entity;
                    if (req.body.trangThai==='true'){
                        entity={trangThai:1};
                    }
                    else {
                        entity={trangThai:2};
                    }
                    let setStatusForRoom = await roomModel.updateRoom(entity,req.params.id);
                    if (setStatusForRoom.affectedRows>0){
                        res.sendStatus(200);
                    }
                    else res.sendStatus(500);
                }
                else{
                    if (checkAdd.nguoiDang!=authData.user.id)
                    {
                        res.sendStatus(403);
                    }
                    else {
                        if (checkAdd.trangThai!==2){
                            let entity;
                            if (req.body.trangThai==='true'){
                                entity={trangThai:1};
                            }
                            else {
                                entity={trangThai:0};
                            }
                            let setStatusForRoom = await roomModel.updateRoom(entity,req.params.id);
                            if (setStatusForRoom.affectedRows>0){
                                res.sendStatus(200);
                            }
                            else res.sendStatus(500);
                        }
                        else {
                            res.sendStatus(403);
                        }
                    }
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

            if (req.query.startDate && req.query.endDate){
                filter += ` '${req.query.startDate}' <= danhsachdatphong.ngaycheckin and danhsachdatphong.ngaycheckin <= '${req.query.endDate}' and`
            }
            else if (req.query.startDate)
            {
                filter += ` '${req.query.startDate}' = danhsachdatphong.ngaycheckin and`
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
            res.send([result,num_page]);
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

router.get('/outofroom/:id',verifyToken, async(req, res) => {
    if (isNaN(req.params.id))
        res.sendStatus(404);
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            if (authData.admin){
                const[row,ngayHetPhong] = await Promise.all([productModel.single(req.params.id),productModel.checkRoomInvalidNow(req.params.id,moment(new Date()).format('YYYY-MM-DD'))]);
                row.ngayHetPhong=ngayHetPhong;
                res.send(row);
            }
            else {
                const[row,ngayHetPhong] = await Promise.all([productModel.single(req.params.id),productModel.checkRoomInvalidNow(req.params.id,moment(new Date()).format('YYYY-MM-DD'))]);
                if (row){
                    if(row.nguoiDang===authData.user.id)
                    {
                        row.ngayHetPhong=ngayHetPhong;
                        res.send(row);
                    }
                    else res.sendStatus(403);
                }
                else res.sendStatus(404);
            } 
        }
    });
});

router.post('/outofroom/:id',verifyToken, async(req, res) => {
    if (isNaN(req.params.id))
        res.sendStatus(404);
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            if (authData.admin){
                const result = await roomModel.removeOutOfRoom(req.body);
                if (result.affectedRows>0){
                    res.sendStatus(200);
                }
                else res.sendStatus(503);
            }
            else {
                const row = await roomModel.single(req.params.id);
                if (row){
                    if(row.nguoiDang===authData.user.id)
                    {
                        const result = await roomModel.removeOutOfRoom(req.body);
                        if (result.affectedRows>0){
                            res.sendStatus(200);
                        }
                        else res.sendStatus(503);
                    }
                    else res.sendStatus(403);
                }
                else res.sendStatus(404);
            }
            
        }
    });
});

router.post('/addoutofroom',verifyToken, async(req, res) => {
    if (isNaN(req.body.phong))
        res.sendStatus(404);
    jwt.verify(req.token,privateKey, async (err,authData)=>{
        if (err){
            res.sendStatus(404);
        } else {
            if (authData.admin){
                const result = await roomModel.addOutOfRoom(req.body);
                if (result.affectedRows>0){
                    res.sendStatus(200);
                }
                else res.sendStatus(503);
            }
            else {
                const row = await roomModel.single(req.body.phong);
                if (row){
                    if(row.nguoiDang===authData.user.id)
                    {
                        const result = await roomModel.addOutOfRoom(req.body);
                        if (result.affectedRows>0){
                            res.sendStatus(200);
                        }
                        else res.sendStatus(503);
                    }
                    else res.sendStatus(403);
                }
                else res.sendStatus(404);
            }
        }
    });
});

module.exports = router;