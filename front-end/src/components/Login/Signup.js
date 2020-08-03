import React, { useContext } from 'react';
import { UserContext } from '../../UserContext';
import { ToastContainer, toast  } from 'react-toastify';
import Cookies from 'js-cookie';
import $ from 'jquery';
import { Redirect, useLocation } from 'react-router-dom';

const config = require('../../config/default.json');

const Signup = () => {
    const [state,dispatch] = useContext(UserContext);
    const location = useLocation();

    const handleClick = ()=>{
        const email = document.getElementById("username").value;
        const pass = document.getElementById("password").value;
        if (email !== "" && pass.length !== "")
        {
            
            $.post(`${config.url}/user/signup`,{email,pass},
             (val)=>{               
                    dispatch({
                        id:val.id,
                        type:'login'
                    });
                    Cookies.set('token', val.token,{ expires: 10 });
                    toast.success('Đăng ký thành công!');
            })
            .fail(function() {
                toast.error('Bạn đã có tài khoản đăng ký với email này!');
            }); 
        }  
    }



    return state.type ==='logout'? (
        
             <div className="login" >
            <ToastContainer/>
            <label style={{display:'block'}} for="username">username</label>
            <input id="username" style={{display:'block'}} type="text" />
            <label style={{display:'block'}} for="password">password</label>
            <input id="password" style={{display:'block'}} type="password"/>
            <button onClick={(handleClick)}  style={{display:'block'}} type="">Sign up</button>
        </div>
       
    ):<Redirect to={ location.state ? location.state.from : '/'}></Redirect>;
    
    
    
};





export default Signup;
