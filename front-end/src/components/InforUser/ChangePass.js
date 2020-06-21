import React from 'react';

const ChangePass = () => {
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
            <button type=""  className="bt__default">Cập nhật</button>    
            </form>
        </div>
    );
}

export default ChangePass;
