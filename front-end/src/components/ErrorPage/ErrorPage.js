import React,{useEffect} from 'react';
import {Link} from 'react-router-dom';
import Errorimg from '../../icons/errorimg.svg';
const ErrorPage = () => {
    useEffect(() => {
        document.getElementById('navbar').style.display = 'none';
        document.getElementById('footer').style.display = 'none'
    }, []);
    return (
        <div className="errorpage">
            <img className="errorpage__img" src={Errorimg} alt="" />
            <h1 className="errorpage__title">OHH! Có phải bạn đang lạc đường!!</h1>
            <Link className="errorpage__button" to="/" onClick={()=> {
                document.getElementById('navbar').style.display = ''
                document.getElementById('footer').style.display = ''
        }}>Quay lại trang chính</Link>
        </div>
    );
}

export default ErrorPage;
