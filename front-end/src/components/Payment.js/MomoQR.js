import React, { useEffect } from 'react';
import $ from 'jquery';
import {  toast } from 'react-toastify';
import { useLocation, useHistory } from 'react-router-dom';

const config = require('../../config/default.json');
const center = {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%,-50%)'
}

const MomoQR = () => {
    const location = useLocation();
    const history = useHistory();
    useEffect(() => {
        if (location.state&&location.state.idbook){
            $.post(`${config.url}/room/momo`,{id:location.state.idbook}, (val) => {
                window.location.href = val.urlQR;
            }).fail(function() {
                toast.error('Hết thời gian thanh toán');
            });
        }
        else {
            history.push('/ERROR');
        }
    }, []);

    return (
        <div style={center}>
            <h2>Quét mã để thanh toán</h2>
            <img id='barcode' src="https://api.qrserver.com/v1/create-qr-code/?data=https://payment.momo.vn/pay/store/MOMO1P6420200501-book-stay?i=qqr1k-200624234642a2babc0e" alt="" title="HELLO" width="150" height="150" />
        </div>
    );
}

export default MomoQR;
