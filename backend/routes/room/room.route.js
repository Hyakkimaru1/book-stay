const express = require('express');
const productModel = require('../../models/room/room.models');
const moment = require('moment');
const router = express.Router();
const dayByDay = require('../../public/js/getDayByDay');

router.get('/:id', async (req, res,next) => {
    if (!isNaN(req.params.id)){
        const[row,ngayHetPhong] = await Promise.all([productModel.single(req.params.id),productModel.checkRoomInvalidNow(req.params.id,moment(new Date()).format('YYYY-MM-DD'))]);
        if (row){
            row.ngayHetPhong=ngayHetPhong;
            res.send(row);
        }
        else res.sendStatus(404);
    }
    else {
        next();
    }
});

router.get('/tiennghi/:id',async (req,res)=>{
    const row =  await productModel.getTienNghiPhong(req.params.id);
    res.send(row);
});

router.get('/tiennghi',async (req,res)=>{
    const row =  await productModel.getTienNghi();
    res.send(row);
});

router.get('/comment/:id',async (req,res)=>{
    const row =  await productModel.getComment(req.params.id);
    res.send(row);
});

router.get('/isRoom/:id',async (req,res)=>{
    const row = await productModel.checkIsRoom(req.params.id);
    if (row.length>=1){
        res.send({'val':true});
    }
    else {
        res.send({'val':false});
    }
});

router.get('/owner/:id',async (req,res)=>{
    const row = await productModel.getOwner(req.params.id);
    res.send(row[0]);
});


router.get('/img/:id',async (req,res)=>{
    const row = await productModel.getImg(req.params.id);
    res.send(row);
});

router.get('/lengthcmt/:id',async (req,res)=>{
    const row = await productModel.getLengthCmt(req.params.id);
    res.send(row);
});

router.get('/search',async (req,res)=>{
    if (req.query.id<1||req.query.guest<1||
        moment(new Date()).isAfter(req.query.checkin,'day') || moment(new Date()).isAfter(req.query.checkout,'day')||
        moment(req.query.checkout).isBefore(req.query.checkin,'day')||!moment(req.query.checkout).isValid()||!moment(req.query.checkin).isValid()){
        res.send("false");
    }
    const checkRoomInvalid = await productModel.checkRoomInvalid(req.query.id,req.query.checkin,req.query.checkout);
    if (checkRoomInvalid.length>0)
    {
        res.send("false");
    }
    const row = await productModel.getRoomValid(req.query.id);
    if (row.length === 0 ||row.length>0 && row[0].soKhachToiDa<req.query.guest)
    {
        res.send("false");
    }
    else {
        try {
            res.send(row[0]);
        } catch (error) {
            console.error(error);
        }
    }
});

router.post('/book', async (req,res) => {
    const search = await productModel.searchPhongDaDat(req.body);
    if (search.length>0)
    {
        res.sendStatus(400);
    }
    else {
        const arrayDay = dayByDay(req.body.ngaycheckin,req.body.ngaycheckout);
        const row = await productModel.addNguoiDatPhong(req.body);
        //adding short term out of room to table hetphong 
        let arrayIdOutOfRoom = []
        arrayDay.map( async (val) => {
            const resultOFR = await productModel.addOutOfRoom({phong:req.body.phong,ngayHetPhong:val});
            if (resultOFR.insertId>0){
                arrayIdOutOfRoom.push(resultOFR.insertId);
            }
        });
        if (row.insertId>0){
            res.sendStatus(200);
            //set time out 10 minutes
           
            // failling
            setTimeout(async() => {
                const resultUserPaid = await productModel.getNguoiDatPhong(row.insertId);
                 // if user didn't pay, clear data and change status of NguoiDatPhong to -1 
                if (resultUserPaid.length > 0 && resultUserPaid[0].trangthai !== 1){
                    await productModel.updateNguoiDatPhong({trangthai:-1},row.insertId);
                    arrayIdOutOfRoom.map( async (val) => {
                        await productModel.removeOutOfRoom({id:val});
                    });
                }
            }, 10*60000); // 10 minutes 
        }
        else res.sendStatus(400);
    }
    
});

module.exports = router;