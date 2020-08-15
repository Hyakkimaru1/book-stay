import React, { useContext, useState } from 'react';
import $ from 'jquery';
import { toast } from 'react-toastify';
import { Redirect, useLocation, Link, useHistory } from 'react-router-dom';
import Avatar from '../../icons/authentication.svg';
import Wave from '../../icons/wave.png';
import { UserContext } from '../../UserContext';

const config = require('../../config/default.json');

const NewPassword = (props) => {
    const location = useLocation();
    const history = useHistory();
    const [state] = useContext(UserContext);
    const handleClick = () => {
        // do something
        if (document.getElementById("newpassword").value && document.getElementById("confirmNewpassword").value)
        {
            if (document.getElementById("newpassword").value!==document.getElementById("confirmNewpassword").value){
                toast.error("Mật khẩu phải giống nhau");
            }
            else {
                $.post(`${config.url}/user/changepassword`,{token:props.token,password:document.getElementById("newpassword").value},
                    ()=>{
                        toast.success('Thay đổi mật khẩu thành công');
                        history.push('/login');
                })
                .fail(function() {
                    toast.error('Thay đổi mật khẩu thất bại');
                });   
            }
        }
        else {
            toast.error("Điền đủ mật khẩu và xác nhận lại");
        }
    }
    return state.type === "logout" ? ( 
        <div className="Login">
            <img className="Login-wave" src={Wave} alt="" />
            <div className="Login__forgotpassword" alt="">
                <div className="login-content">
                <form className="Login__form" action="index.html">
                        <img src={Avatar} />
                        <h2 className="title">Tạo mật khẩu mới</h2>
                        <div className="input-div one">
                        <div className="i">
                                <i style={{fontSize: '1.6rem'}} className="fas fa-lock"></i>
                        </div>
                        <div className="div">
                            <input id="newpassword" placeholder="Mật khẩu mới" type="password" className="input Login__input" />
                            <label for="newpassword" className="Login__label">Mật khẩu mới</label>
                        </div>
                        </div>
                        <div className="input-div pass">
                        <div className="i"> 
                                <i style={{fontSize: '1.6rem'}} className="fas fa-lock"></i>
                        </div>
                        <div className="div">
                            <input id="confirmNewpassword" placeholder="Xác nhận lại mật khẩu" type="password" className="input Login__input" />
                            <label for="confirmNewpassword" className="Login__label">Xác nhận lại mật khẩu</label>
                        </div>
                        </div>
                        <p onClick={handleClick} className="Login__btn">Xác nhận</p>
                    </form>
                </div>
                
            </div>
        </div>
    ) : <Redirect to={ location.state ? location.state.from : '/'}></Redirect>;
}

export default NewPassword;
