import React, { useContext, useState} from 'react';
import { UserContext } from '../../UserContext';
import $ from 'jquery';
import {toast } from 'react-toastify';
import { Redirect, useLocation, Link } from 'react-router-dom';
import Avatar from '../../icons/forgetpassword.svg';
import Wave from '../../icons/wave.png'
import Confirm from './Confirm';
import NewPassword from './NewPassword';

const config = require('../../config/default.json');

const ForgotPassword = () => {
    const [state] = useContext(UserContext);
    const location = useLocation();
    const [option,setOption] = useState(1);
    const [time,setTime] = useState(null);
    const [token,setToken] = useState(null);
    const handleClick = () => {
        const emailConfirm = document.getElementById('emailConfirm').value;
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailConfirm))
        {
            $.post(`${config.url}/user/forgotpassword`,{email:emailConfirm},
                (val)=>{
                    setTime(val);
                    setOption(2);
            })
            .fail(function() {
                toast.error('Sai địa chỉ email');
            }); 
            
        }
        else {
            $("span").show().delay(2000).fadeOut();
        }
        
    }
    const handleChangeOption = () => {
        setOption(1);
    }
    const handleChangeOption2 = (newToken) => {
        setOption(3);
        setToken(newToken.token);
    }
    let resultReturn;
    if (option===1){
        resultReturn = <div className="login-content">
        <form className="Login__form" action="index.html">
                <img src={Avatar} />
                <h2 className="title">Yêu cầu đặt lại mật khẩu</h2>
                <div className="input-div one">
                <div className="i">
                        <i style={{fontSize: '1.6rem'}} className="fas fa-envelope"></i>
                </div>
                <div className="div">
                    <input id="emailConfirm" placeholder="Nhập email của bạn" type="text" className="input Login__input" />
                    <label for="emailConfirm" className="Login__label">Nhập email của bạn</label>
                    <span className="Login__errorEmail" >Nhập đúng cú pháp</span>
                </div>
                </div>
                <Link to={{pathname:"/login",state:location.state}} style={{textDecoration: 'none'}}><p className="Login__a">Chuyển sang đăng nhập</p></Link>
                <p onClick={handleClick} className="Login__btn">Yêu cầu đặt lại</p>
                <p className="Login__createAcc">Bạn chưa có tài khoản? <strong className="Login__createAcc--link">Đăng ký ngay</strong></p>
            </form>
        </div>;
    } 
    else if (option==2) {
        resultReturn = <Confirm time={time} onClick2={handleChangeOption2} onClick={handleChangeOption}/>;
    }
    else {
        resultReturn = <NewPassword token={token}/>;
    }
    return state.type === "logout" ? ( 
        <div className="Login">
            <img className="Login-wave" src={Wave} alt="" />
            <div className="Login__forgotpassword" alt="">
                {resultReturn}
            </div>
        </div>
    ) : <Redirect to={ location.state ? location.state.from : '/'}></Redirect>;
}

export default ForgotPassword;
