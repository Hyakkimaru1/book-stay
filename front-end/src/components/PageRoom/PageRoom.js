import React,{useEffect, useState} from 'react';
import Slide from './Slide';
import BodyPage from './BodyPage';
import CardDetail from '../CardDetail/CardDetail';
import $ from 'jquery';
import { ToastContainer } from 'react-toastify';
import {
    useParams, Redirect 
} from "react-router-dom";

const config = require('../../config/default.json'); 

const PageRoom = () => {
    const { id } = useParams();
    const [checkRoomValid,setCheckRoomValid] = useState(true);
    const [data,setData] = useState(null);
    useEffect(() => {
        $.get(`${config.url}/room/isRoom/${id}`, (data) => {
            if (!data.val){
                setCheckRoomValid(false);
            }
        });
        $.get(`${config.url}/room/homepage`, val => {
            setData(val);
        })
        window.scrollTo(0, 0);
    }, [id]);

    if (!isNaN(id) && checkRoomValid)
    {  return (
        <div>
            <div id="loader" className="loaderBackground">
                <div className="loader"></div>
            </div>
            
            <div style={{marginTop:'8rem'}}>
                <Slide id={id}/>
                <BodyPage id={id}/>
                <div className="cozy__title row" style={{ padding: '.2rem' }}>
                    <div style={{ marginBottom: '1.6rem' }} className="cozy__title">Chỗ ở tương tự</div>
                    <div style={{width:'100%',lineHeight: '1.5'}} className="Home__topplaces--card">   
                    {
                        data && data.currentBook.map( ele => 
                            <CardDetail key={ele.id} id={ele.id} rates={ele.rates && ele.rates} ten={ele.ten} img={ele.img && ele.img.img} soKhachToiDa={ele.soKhachToiDa} soPhong={ele.soPhong} soGiuong={ele.soGiuong} giaNgayThuong={ele.giaNgayThuong} star={ele.star && ele.star}/>
                        )
                    }   
                    </div>
                </div>

            </div>
        </div>
        );
    }
    else {
        return (<Redirect to="/error"></Redirect>)
    }
}

export default PageRoom;

