import React from 'react';

const center = {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%,-50%)'
}

const MomoQR = () => {

    const setTime = () => {
        setTimeout();
    }

    return (
        <div style={center}>
            <h2>Quét mã để thanh toán</h2>
            <img id='barcode' src="https://api.qrserver.com/v1/create-qr-code/?data=https://payment.momo.vn/pay/store/MOMO1P6420200501-book-stay?i=qqr1k-200624234642a2babc0e" alt="" title="HELLO" width="150" height="150" />
        </div>
    );
}

export default MomoQR;
