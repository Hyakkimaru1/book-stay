import React from 'react';
import $ from 'jquery';
import { toast } from 'react-toastify';
import Cookies from 'js-cookie';
const config = require('../../config/default.json');

const ChangePass = () => {
    const handleClick = () => {

        // do something
        if (document.getElementById("changepass_old").value && document.getElementById("changepass_new").value && document.getElementById("changepass_confirm").value)
        {
            if (document.getElementById("changepass_new").value!==document.getElementById("changepass_confirm").value){
                toast.error("Mật khẩu phải giống nhau");
            }
            else {
                $.post(`${config.url}/user/changepassword2`,{token:Cookies.get('token'),currentpassword:document.getElementById("changepass_old").value,password:document.getElementById("changepass_new").value},
                    ()=>{
                        toast.success('Thay đổi mật khẩu thành công');
                })
                .fail(function() {
                    toast.error('Sai mật khẩu hiện tại');
                }); 
            }
        }
        else {
            toast.error("Điền đủ mật khẩu và xác nhận lại");
        }
    }
    return (
        <div className="ChangePass">
            <form style={{marginTop:'2.4rem'}}>
            <div className="ChangePass__group">
                <input id="changepass_old" type="password" className="ChangePass__input" placeholder="Mật khẩu hiện tại" name="username" required/>
                <label for="changepass_old" className="ChangePass__label">Mật khẩu hiện tại</label>
                <span style={{color: 'red'}} id="showFail" className="ChangePass__error"></span>
            </div>
            <div className="ChangePass__group">
                <input id="changepass_new" type="password" className="ChangePass__input" placeholder="Mật khẩu mới" name="username" required/>
                <label for="changepass_new" className="ChangePass__label">Mật khẩu mới</label>
                <span style={{color: 'red'}} id="showFail" className="ChangePass__error"></span>
            </div>
            <div className="ChangePass__group">
                <input id="changepass_confirm" type="password" className="ChangePass__input" placeholder="Xác nhận mật khẩu mới" name="username" required/>
                <label for="changepass_confirm" className="ChangePass__label">Xác nhận mật khẩu mới</label>
                <span style={{color: 'red'}} id="showFail" className="ChangePass__error"></span>
            </div>
            <div onClick={handleClick}  className="bt__default">Cập nhật</div>    
            </form>
        </div>
    );
}

export default ChangePass;
