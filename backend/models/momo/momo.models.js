const https = require('https');
//parameters send to MoMo get get payUrl
const endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor"
const hostname = "https://test-payment.momo.vn"
const path = "/gw_payment/transactionProcessor"
const partnerCode = "MOMO1P6420200501"
const accessKey = "aQG2TO5DoUOl2ASC"
const serectkey = "4Ojjmu1hPNJ18rqRBf3xVbhzD9Z1NBr3"
const returnUrl = "http://localhost:3000/"
const notifyurl = "https://7d902e390c85.ngrok.io/room/momoResponsePaid"
const requestType = "captureMoMoWallet"
const requestTypeRefund = "refundMoMoWallet"
const extraData = "idbook=" //pass empty value if your merchant does not have stores else merchantName=[storeName]; merchantId=[storeId] to identify a transaction map with a physical store
module.exports = {
    sendRequest: async (orderId, requestId, amount, orderInfo) => {
        const rawSignature = "partnerCode=" + partnerCode + "&accessKey=" + accessKey + "&requestId=" + requestId + "&amount=" + amount + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&returnUrl=" + returnUrl + "&notifyUrl=" + notifyurl + "&extraData=" + extraData;
        //before sign HMAC SHA256 with format
        //partnerCode=$partnerCode&accessKey=$accessKey&requestId=$requestId&amount=$amount&orderId=$oderId&orderInfo=$orderInfo&returnUrl=$returnUrl&notifyUrl=$notifyUrl&extraData=$extraData

        //puts raw signature
        //signature
        const crypto = require('crypto');
        var signature = crypto.createHmac('sha256', serectkey)
            .update(rawSignature)
            .digest('hex');

        //json object send to MoMo endpoint
        var body = JSON.stringify({
            partnerCode: partnerCode,
            accessKey: accessKey,
            requestId: requestId,
            amount: amount,
            orderId: orderId,
            orderInfo: orderInfo,
            returnUrl: returnUrl,
            notifyUrl: notifyurl,
            extraData: extraData,
            requestType: requestType,
            signature: signature,
        })
        //Create the HTTPS objects
        var options = {
            hostname: 'test-payment.momo.vn',
            port: 443,
            path: '/gw_payment/transactionProcessor',
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(body)
            }
        };
        let qrcode;
        await doRequest(options, body);
        return qrcode;
        
        
        function doRequest(options, body) {
            return new Promise((resolve, reject) => {
                //Send the request and get the response
                
                const req = https.request(options, (res) => {
                    res.setEncoding('utf8');
                    res.on('data', (body) => {
                        qrcode = JSON.parse(body).payUrl;
                        
                    });
                    res.on('end', () => {
                        //console.log('No more data in response.');
                        resolve(qrcode);
                    });
                });

                req.on('error', (e) => {
                    console.error(`problem with request: ${e.message}`);
                });

                // write data to request body
                req.write(body);
                req.end();
            })}
    },
    sendRequestRefund: (orderId, requestId, amount, transId) => {
        const rawSignature = "partnerCode=" + partnerCode + "&accessKey=" + accessKey + "&requestId=" + requestId + "&amount=" + amount + "&orderId=" + orderId + "&transId=" + transId + "&requestType=" + requestTypeRefund ;
        //before sign HMAC SHA256 with format
        //partnerCode=$partnerCode&accessKey=$accessKey&requestId=$requestId&amount=$amount&orderId=$oderId&orderInfo=$orderInfo&returnUrl=$returnUrl&notifyUrl=$notifyUrl&extraData=$extraData

        //puts raw signature
        //signature
        const crypto = require('crypto');
        var signature = crypto.createHmac('sha256', serectkey)
            .update(rawSignature)
            .digest('hex');
        //json object send to MoMo endpoint
        var body = JSON.stringify({
            partnerCode: partnerCode,
            accessKey: accessKey,
            requestId: requestId,
            amount: amount,
            orderId: orderId,
            transId: transId,
            requestType: requestTypeRefund,
            signature: signature,
        })
        //Create the HTTPS objects
        var options = {
            hostname: 'test-payment.momo.vn',
            port: 443,
            path: '/gw_payment/transactionProcessor',
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(body)
            }
        };
        
        const req = https.request(options, (res) => {
            res.setEncoding('utf8');
            res.on('data', (body) => {
               console.log(body);
            });
            res.on('end', () => {
                //console.log('No more data in response.');
            });
        });

        req.on('error', (e) => {
            console.error(`problem with request: ${e.message}`);
        });

        // write data to request body
        req.write(body);
        req.end();
    }
}
