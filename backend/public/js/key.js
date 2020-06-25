var crypto = require('crypto');
var secretKey = 'um76xDBeRmmj5kVMhXiCeFKixZTTlmZb';
var iv = new Buffer(16); // 16 byte buffer with random data
iv.fill(0); // fill with zeros
 
module.exports = {
    encrypt_token : function encrypt_token(data) {
    var encipher = crypto.createCipheriv('aes-256-cbc', secretKey, iv),
        buffer = Buffer.concat([
        encipher.update(data),
        encipher.final()
        ]);
    return buffer.toString('base64');
    }
 ,
    decrypt_token: function decrypt_token(data) {
    var decipher = crypto.createDecipheriv('aes-256-cbc', secretKey, iv),
        buffer = Buffer.concat([
        decipher.update(Buffer.from(data, 'base64')),
        decipher.final()
        ]);
    return buffer.toString();
    }
}

