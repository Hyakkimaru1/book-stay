import React, {useEffect } from 'react';
import $ from 'jquery';
import { toast } from 'react-toastify';
import Avatar from '../../icons/forgetpassword.svg';

const config = require('../../config/default.json');

const Confirm = (props) => {
    const handleClick = () => {
        if (document.getElementById("verification").value){
            $.post(`${config.url}/user/confirmkey`,{id:props.time.id,key:document.getElementById("verification").value},
                (token)=>{
                    props.onClick2(token);
            })
            .fail(function() {
                toast.error('Sai mã xác nhận');
            });    
        }
        else {
            toast.error('Vui lòng nhập mã xác nhận trong email');
        }
    }
    var countDownDate = new Date(props.time.time).getTime();
    useEffect(() => {
        // Update the count down every 1 second
        const x = setInterval(function() {

            // Get today's date and time
            const now = new Date().getTime();
                
            // Find the distance between now and the count down date
            const distance = countDownDate - now;
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
                
            // Output the result in an element with id="demo"
            document.getElementById("countdown").innerHTML = "Thời gian còn lại: "+ minutes + "m " + seconds + "s ";
                
            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                const ele = document.getElementsByClassName('input-div')[0];
                ele.parentNode.removeChild(ele);
                const element = document.getElementById('Login__btn');
                element.parentNode.removeChild(element)
                document.getElementById("countdown").innerHTML = "Mã đã hết hạn";
            }
        }, 1000);
        return () => {
            clearInterval(x);
        }
    }, []);
    return (
        <div className="login-content">
                <form className="Login__form" action="index.html">
                <img src={Avatar} />
                
                <h2 className="title">Nhập mã xác nhận</h2>
                <span className="Login__countdown" id="countdown"></span>
                <div className="input-div one">
                <div className="i">
                        <i style={{fontSize: '1.6rem'}} className="fas fa-envelope"></i>
                </div>
                <div className="div">
                    <input id="verification" placeholder="Mã xác nhận" type="text" className="input Login__input" />
                    <label for="verification" className="Login__label">Mã xác nhận</label>
                </div>
                </div>
                <p onClick={props.onClick} className="Login__a">Nhập lại email</p>
                <p id="Login__btn" onClick={handleClick} className="Login__btn">Xác nhận</p>
                </form>
        </div>
    );
}

export default Confirm;
