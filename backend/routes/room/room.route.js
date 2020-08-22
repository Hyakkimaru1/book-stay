const express = require('express');
const productModel = require('../../models/room/room.models');
const momoModel = require('../../models/momo/momo.models');
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

router.get('/homepage',async (req,res)=>{
    const [row1,row2,HCM,HN,VT,HA,DN,NT,DL] = await Promise.all([productModel.getTheMostBook(),productModel.getJustBook(),
    productModel.getRoomInHCM(),productModel.getRoomInHN(),productModel.getRoomInVT()
    ,productModel.getRoomInHA(),productModel.getRoomInDN(),productModel.getRoomInNT(),productModel.getRoomInDL()]);
    for (let index = 0;index < row1.length;index++){
        const img = await productModel.getImgRoom(row1[index].id);
        row1[index].img = img[0];
        const comment = await productModel.getComment(row1[index].id);
        let star = null;
        if (comment.length>0){
            star=0;
            for (let index1 = 0 ;index1 < comment.length;index1++){
                star+=comment[index1].danhGia;
            }
            star/=comment.length;
            star = parseInt(star);
        }
        if (star){
            row1[index].star = star;
            row1[index].rates = comment.length;
        }
    }
    for (let index = 0; index < row2.length;index++){
        const img = await productModel.getImgRoom(row2[index].id);
        row2[index].img = img[0];
        const comment = await productModel.getComment(row2[index].id);
        let star = null;
        if (comment.length>0){
            star=0;
            for (let index1 = 0 ;index1 < comment.length;index1++){
                star+=comment[index1].danhGia;
            }
            star/=comment.length;
            star = parseInt(star);
        }
        if (star){
            row2[index].star = star;
            row2[index].rates = comment.length;
        }
    }
    const data = {
        rooms: {
            hcm: HCM[0].rooms,
            hn: HN[0].rooms,
            vt: VT[0].rooms,
            ha: HA[0].rooms,
            dn: DN[0].rooms,
            nt: NT[0].rooms,
            dl: DL[0].rooms
        },
        mostBook: row1,
        currentBook: row2
    }
    res.send(data);
})

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
            //console.error(error);
        }
    }
});

router.post('/book', async (req,res) => {
    const search = await productModel.searchPhongDaDat(req.body);
    let flag = true;
    if (search.length>0)
    {   
        for (let index = 0; index < search.length; index++) {
        const element = search[index];
            if (element.trangthai===0){
                res.sendStatus(400);
                flag = false;
                break;
            }
        }
    }
    if (flag){
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
            setTimeout(async() => {
                const resultUserPaid = await productModel.getNguoiDatPhong(row.insertId);
                    // if user didn't pay, clear data and change status of NguoiDatPhong to -1 
                if (resultUserPaid.length > 0 && resultUserPaid[0].trangthai !== 1){
                    await productModel.updateNguoiDatPhong({trangthai:-1},row.insertId);
                    arrayIdOutOfRoom.map( async (val) => {
                        await productModel.removeOutOfRoom({id:val});
                    });
                }
            }, 15*60000); // 10 minutes 
            res.send({idBook: row.insertId});
        }
        else res.sendStatus(400);
    }  
});

router.post('/momo',async (req,res)=>{
    const row = await productModel.getNguoiDatPhong(req.body.id);
    if (row.length>0 && row[0].trangthai === 0){
        //getQR from momo then send to user 
        const getQR = await momoModel.sendRequest(row[0].gia.toString(),'dat phong book-stay',row[0].id.toString());
        if (getQR !==''){
            res.send({urlQR:getQR});
        }
        else {
            res.sendStatus(503);
        }
    }
    else {
        res.sendStatus(403);
    }
    
})

router.post('/momoResponsePaid',async (req,res)=>{
    const resultUserPaid = await productModel.getNguoiDatPhong(req.body.extraData);
    // if user didn't pay, clear data and change status of NguoiDatPhong to -1 
    if (resultUserPaid.length > 0 ){
        if ( req.body.errorCode == 0){
            await productModel.updateNguoiDatPhong({trangthai:1,transId:req.body.transId},req.body.extraData);
        }
        else {
            await productModel.updateNguoiDatPhong({trangthai:-1,transId:req.body.transId},req.body.extraData); 
        }
    } 
    res.sendStatus(200);
})


module.exports = router;