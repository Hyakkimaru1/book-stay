import React, { useState } from 'react';
import { ToastContainer, toast  } from 'react-toastify';
import $ from 'jquery';
import { Redirect} from 'react-router-dom';


const config = require('../../config/default.json');

const ForgotPassword = () => {
    const [openOtp, setOpenOtp] = useState({mail:'', otp:0});
    const [openResetpw, setOpenResetpw] = useState({resetpw:false, redirect:false})
    const forgotpwClick = () =>{

        const email = document.getElementById("email").value;
        
        
        if (email !== "" )
        {
            
            $.post(`${config.url}/user/forgotpw`,{email},
             (val)=>{          
                      console.log(val.otp);
                   setOpenOtp({mail: email, otp:val.otp});
                    toast.success('Điền mã OTP nhận được trong mail để lấy lại mật khẩu');
            })
            .fail(function() {
                toast.error('Sai email!');
            }); 
        }

    }

     
    const sendOtpClick = () =>{
        const otp = document.getElementById("otp").value;
        if(otp === openOtp.otp)
        {
                setOpenResetpw({resetpw:true});
                
                console.log(otp);
        }

        

    }

    const resetPwClick = ()=>{
        const pass = document.getElementById("newpw").value;
        const confirmpass = document.getElementById("confirmpw").value;
        const email = openOtp.mail;
       
        if (pass === confirmpass)
        {
            $.post(`${config.url}/user/resetpw`,{email,pass},
                (val)=>{
                    toast.success('Thay đổi mật khẩu thành công! Vui lòng đăng nhập lại!');
                    setOpenResetpw({redirect:true})
                   
            })
            .fail(function() {
                toast.error('Sai tài khoản hoặc mật khẩu');
            }); 
        }  
        else{
            toast.error('Password dont match!');
        }


       
    }


    return openResetpw.redirect? 
    <Redirect to={ '/login'}></Redirect>
    :
    (!openResetpw.resetpw ? (
        <div className="login">
            <ToastContainer/>
            <h2>Quên mật khẩu</h2>
            <label for="email"> Nhập email:</label>
            <input id="email"></input>
            <button type="button" onClick={forgotpwClick}>Lấy lại mật khẩu</button>
            {openOtp.otp  && <div>
                <label for="otp"> Nhập OTP:</label>
            <input id="otp"></input>
            <button type="button" onClick={sendOtpClick}>Gửi</button>
            </div>
            
             }
            

        </div>
    ):
        <div className="login"style={{display:'block'}}>
            <h2>Đặt lại mật khẩu</h2>
            <label for="newpw"> Nhập mật khẩu mới:</label>
            <input id="newpw"type="password"></input>
            <label for="confirmpw"> Nhập lại mật khẩu:</label>
            <input id="confirmpw"type="password"></input>
            <button type="button" onClick={resetPwClick}>Xác nhận</button>
             
           
        </div>   

    )  
   
};




export default ForgotPassword;
