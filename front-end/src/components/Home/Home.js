import React, { useState,useEffect } from 'react';
import BackgroundHome from '../../icons/home.png';
import CardPlace from './CardPlace';
import CardDetail from '../CardDetail/CardDetail';
import $, { type, each } from 'jquery';
import { useHistory } from 'react-router-dom';
const config = require('../../config/default.json');

const Home = () => {
    const [item,setItem] = useState(0);
    const [data,setData] = useState(null);
    const history = useHistory();
    useEffect(() => {
        $.get(`${config.url}/room/homepage`, val => {
            setData(val);
        })
    }, []);
    // useEffect(() => {
    //     $.ajax({
    //         url: `${config.url}/user/cancelbooking`,
    //         type: 'post',
    //         xhrFields: {
    //             withCredentials: true
    //         },
    //         success: function () {
    //             console.log("OK");
    //         }
    //     })
    //         .fail(function () {
    //             console.log("fail");
    //         });
    // }, []);
    return data===null?null:(
        <div className="Home row">
            <section className="Home__background">
                    <img className="Home__background--img" src={BackgroundHome} alt=""></img>
            </section>
            <section className="Home__topplaces">
                <h1 className="Home__topplaces--title">
                    Những địa điểm nổi bật
                </h1>
                <p className="Home__topplaces--detail">Các địa điểm thú vị đang chờ đón bạn</p>
                <div style={{position:'relative'}}>
                    <div className="Home__button Home__button--right"  id="buttonplaces_right" onClick={()=>{
                        if (item<2){
                            setItem(item+1);
                            if (item+1==2){
                                document.getElementById("buttonplaces_right").style.opacity = 0;
                            }
                            document.getElementById("slide__places").style.transform = `translateX(-${(item+1)*230.8}px)`;
                        }
                        if (document.getElementById("buttonplaces_left").style.opacity == 0){
                            document.getElementById("buttonplaces_left").style.opacity = 1;
                        }
                        }}>
                        <i className="fa fa-angle-right fa-3x"></i>
                    </div>
                    <div style={{overflow:'hidden'}}>
                    <div className="Home__topplaces--card" id="slide__places">   
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_5_1559735011.png" name="Hồ Chí Minh" places={data.rooms.hcm}/>
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_16_1559303173.png" name="Đà Nẵng" places={data.rooms.dn}/>
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_1_1559734709.png" name="Hà Nội" places={data.rooms.hn}/>
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_10_1559303118.png" name="Vũng Tàu" places={data.rooms.vt}/>
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_1_1559373089.png" places={data.rooms.nt} name="Nha Trang" />
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_4_1559786177.png" name="Đà lạt" places={data.rooms.dl}/>
                        <CardPlace img="https://cdn.luxstay.com/home/location/location_6_1559786202.png" name="Hội An" places={data.rooms.ha}/>
                    </div>
                    </div>
                    <div className="Home__button Home__button--left" id="buttonplaces_left" onClick={()=>{
                        if (item>0){
                            setItem(item-1);
                            if (item-1==0){
                                document.getElementById("buttonplaces_left").style.opacity = 0;
                            }
                            document.getElementById("slide__places").style.transform = `translateX(-${(item-1)*230.8}px)`;
                        }
                        if (document.getElementById("buttonplaces_right").style.opacity == 0){
                            document.getElementById("buttonplaces_right").style.opacity = 1;
                        }
                        }}>
                            <i className="fas fa-angle-left fa-3x"></i>
                    </div>
                </div>
                
            </section>
            <section className="Home__topplaces">
                <h1 className="Home__topplaces--title">
                    Các địa điểm được đặt nhiều
                </h1>
                <div style={{width:'100%'}} className="Home__topplaces--card" >
                    {
                        data.mostBook.map( ele => 
                            <CardDetail key={ele.id} id={ele.id} rates={ele.rates && ele.rates} ten={ele.ten} img={ele.img && ele.img.img} soKhachToiDa={ele.soKhachToiDa} soPhong={ele.soPhong} soGiuong={ele.soGiuong} giaNgayThuong={ele.giaNgayThuong} star={ele.star && ele.star}/>
                        )
                    }   
                </div>
                
            </section>
            <section className="Home__topplaces">
                <h1 className="Home__topplaces--title">
                    Các địa điểm mới được đặt
                </h1>
                <div style={{width:'100%'}} className="Home__topplaces--card">   
                    {
                        data.currentBook.map( ele => 
                            <CardDetail key={ele.id} id={ele.id} rates={ele.rates && ele.rates} ten={ele.ten} img={ele.img && ele.img.img} soKhachToiDa={ele.soKhachToiDa} soPhong={ele.soPhong} soGiuong={ele.soGiuong} giaNgayThuong={ele.giaNgayThuong} star={ele.star && ele.star}/>
                        )
                    }  
                </div>
                
            </section>
           </div>
    );
}

export default Home;
