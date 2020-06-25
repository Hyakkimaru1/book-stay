import React, { useContext } from 'react';
import { UserContext } from '../../UserContext';
import $ from 'jquery';
import { ToastContainer, toast } from 'react-toastify';
import Cookies from 'js-cookie';
import { Redirect, useLocation, useHistory } from 'react-router-dom';

const config = require('../../config/default.json');

const Login = () => {
    const [state,dispatch] = useContext(UserContext);
    const location = useLocation();
    const handleClick = () => {
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        if (username !== "" && password.length !== "")
        {
            $.post(`${config.url}/user/login`,{username,password},
                (val)=>{
                    dispatch({
                        id:val.id,
                        avt:val.avt,
                        email:val.email,
                        ten:val.ten,
                        sdt:val.sdt,
                        type:"login"
                    });
                    Cookies.set('token', val.token,{ expires: 10 });
            })
            .fail(function() {
                toast.error('Sai tài khoản hoặc mật khẩu');
            }); 
        }  
    }
    return state.type === "logout" ? ( 
        <div>
            <ToastContainer/>
            <label style={{display:'block'}} for="username">username</label>
            <input id="username" style={{display:'block'}} type="text" />
            <label style={{display:'block'}} for="password">password</label>
            <input id="password" style={{display:'block'}} type="password"/>
            <button onClick={(handleClick)} style={{display:'block'}} type="">hehe</button>
        </div>
    ) : <Redirect to={ location.state ? location.state.from : '/'}></Redirect>;
}

export default Login;
