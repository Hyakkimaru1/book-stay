const express = require('express');
const productModel = require('../../models/room/room.models');

const router = express.Router();


router.get('/:id', async (req, res,next) => {
    if (!isNaN(req.params.id)){
        const row =  await productModel.single(req.params.id);
        res.send(row);
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

router.get('/maxID',async (req,res)=>{
    const row = await productModel.getMaxID();
    res.send(row[0]);
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


module.exports = router;