const express = require('express');
const roomModel = require('../../models/room/room.models');
const momoModel = require('../../models/momo/momo.models');
const hostModels = require('../../models/user/host.models');
const adminModels = require('../../models/admin/admin.models');
const moment = require('moment');
const router = express.Router();

router.get('/momoReturnMoney/:id', async (req,res)=>{
    const resultUserPaid = await roomModel.getNguoiDatPhong(req.params.id);
    if (resultUserPaid.length > 0 && resultUserPaid[0].trangthai===1){
       await momoModel.sendRequestRefund(req.params.id.toString(),req.params.id.toString()+"refund",resultUserPaid[0].gia.toString(),resultUserPaid[0].transId);
    }
    res.send('ok');
})

router.post('/momoResponseReturnMoney', async (req,res)=>{
    
})

router.get('/admin', async (req,res)=>{
    let row;
    if (req.query.title_like){
        row = await adminModels.getRoomManageSearch(req.query.title_like);
    }
    else {
        row = await adminModels.getRoomAllManage();
    }
   
    res.send(row);
})

module.exports = router;