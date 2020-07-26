import React, { useState,useEffect } from 'react';
import { useLocation, useHistory } from 'react-router-dom';
import $ from 'jquery';
import getUrlParameter from '../../js/getUrlParameter';
import moment from 'moment';
import {checkDays,cast,castService,castTotal} from '../../js/checkWeekdays';
import numberWithCommas from '../../js/numberWithCommas';
import { ToastContainer } from 'react-toastify';
import PageInfoBook from './PageInfoBook';
import PagePayment from './PagePayment';
const config = require('../../config/default.json');

const stick = {
    position: 'sticky',
    top: 100,
    marginTop:'2rem'
}

const PageBookRoom = () => {
    const location = useLocation();
    const history = useHistory();
    const dateIn = moment(getUrlParameter('checkin',location.search));
    const dateOut = moment(getUrlParameter('checkout',location.search));
    const [data,setData] = useState(null);
    const [link,setLink] = useState(1);

    useEffect(() => {
        $.get(`${config.url}/room/search/${location.search}`,val => {
            if (val==='false')
            {
                history.push('/ERROR')
            }
            setData(val);
        });
    }, []);

    const onClick = () =>{
        setLink(2);
        window.scrollTo(0, 0);
    }

    return (
        <div style={{backgroundColor:'#F4F4F4'}}>
            <div className="PageBook row">
                <ToastContainer/>
                <div className="PageBook__link">
                    <span style={link === 1?{marginRight:'2rem',color:'#f65e39'}: {marginRight:'2rem'}} className="PageBook__link--item">1. Thông tin đặt chỗ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span style={link === 1?{marginLeft:'2rem'}:{marginLeft:'2rem',color:'#f65e39'}} className="PageBook__link--item">2. Xác nhận và thanh toán</span>   
                </div>
                <div className="col-2-of-3" id="pagebook_info">
                   {
                     link === 1 ? <PageInfoBook  gia={data && castTotal(dateIn,dateOut,data.giaNgayThuong,data.giaNgayCuoiTuan)} onClick={onClick} /> : <PagePayment/>
                   }
                </div>
                <div  className="col-1-of-3" style={{height:document.getElementById("pagebook_info")&&document.getElementById("pagebook_info").offsetHeight>800?document.getElementById("pagebook_info").offsetHeight:800}}>
                    <div className="PageBook__head" >
                        Chi tiết đặt phòng
                    </div>
                    <div style={stick} className="PageBook__slide">
                        <div className="PageBook__slide--head">
                            <div className="PageBook__slide--name">
                                <div style={{textAlign:'center',fontSize:'1.8rem'}}>
                                    <strong style={{color:'black'}}>{data&&data.ten}</strong>
                                </div>
                                <div className="PageBook__slide--img" style={data &&{ backgroundImage: `url(${data.img})`}}> </div>
                                <p className="PageBook__slide--icon">
                                    <svg version="1.1" viewBox="0 0 24 24" style={{width: 24, height: 24}}><g fill="none" fill-rule="evenodd"><circle pid="0" cx="12" cy="12" r="12" fill="#000" fill-opacity=".2" fill-rule="nonzero"></circle><path pid="1" fill="#FFF" d="M11.92 6c2.87 0 5.218 2.335 5.218 5.205a5.112 5.112 0 0 1-1.055 3.137c-.97 1.252-3.77 3.461-3.882 3.56a.43.43 0 0 1-.282.098.43.43 0 0 1-.281-.098c-.113-.099-2.912-2.308-3.883-3.546a5.182 5.182 0 0 1-1.055-3.15C6.7 8.335 9.05 6 11.92 6zm0 7.203a2.104 2.104 0 0 0 0-4.207 2.104 2.104 0 0 0 0 4.206z"></path></g></svg>
                                    &nbsp;&nbsp;
                                    {data&&data.diaChi}
                                </p>   
                            </div>
                        </div>
                        <div className="PageBook__slide--default">
                            <p className="PageBook__slide--icon">
                                <svg version="1.1" viewBox="0 0 24 24" style={{width: 24, height: 24}}><g fill="none" fill-rule="evenodd"><path pid="0" fill="#F65E39" fill-rule="nonzero" d="M12 0c6.614 0 12 5.386 12 12s-5.386 12-12 12S0 18.614 0 12 5.386 0 12 0z"></path><path pid="1" fill="#FFF" d="M10 7h4a1 1 0 1 1 2 0h.5A1.5 1.5 0 0 1 18 8.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 6 16.5v-8A1.5 1.5 0 0 1 7.5 7H8a1 1 0 1 1 2 0zm4 7v2h2v-2h-2zm-3 0v2h2v-2h-2zm-3 0v2h2v-2H8zm3-3v2h2v-2h-2zm3 0v2h2v-2h-2zm-6 0v2h2v-2H8z"></path></g></svg>
                                &nbsp;&nbsp;
                                <strong style={{color:'black'}}>
                                    {checkDays(dateIn,dateOut)}
                                    đêm
                                    &nbsp;
                                </strong>
                                {dateIn.format('DD/MM/YYYY')}
                                -
                                {dateOut.format('DD/MM/YYYY')}
                            </p>
                            <p className="PageBook__slide--icon">
                                <svg version="1.1" viewBox="0 0 24 24" style={{width: 24, height: 24}}><g fill="none"><circle pid="0" cx="12" cy="12" r="12" fill="#F65E39"></circle><path pid="1" fill="#FFF" d="M12.007 12c.844 0 1.807-.083 2.414-.747.518-.539.681-1.396.518-2.585C14.702 6.995 13.607 6 12.007 6c-1.599 0-2.695.995-2.946 2.668-.163 1.19 0 2.046.518 2.585.607.664 1.57.747 2.428.747zm-3.67 6h7.335c.411 0 .779-.16 1.029-.442.264-.309.367-.724.264-1.126C16.436 14.408 14.408 13 12.012 13c-2.41 0-4.439 1.408-4.968 3.432-.103.402 0 .817.264 1.126.25.281.618.442 1.03.442z"></path></g></svg>
                                &nbsp;&nbsp;
                                <strong style={{color:'black'}}>
                                    {getUrlParameter('guest',location.search)}
                                    &nbsp;
                                    người
                                </strong>
                            </p>
                        </div>
                        <div className="PageBook__slide--default PageBook__slide--cast">
                            <div className="PageBook__slide--cast-element" >
                                <p>Giá thuê {checkDays(dateIn,dateOut)} đêm</p>
                                <p> { data && numberWithCommas(cast(dateIn,dateOut,data.giaNgayThuong,data.giaNgayCuoiTuan))} VNĐ</p>
                            </div>
                            <div className="PageBook__slide--cast-element">
                                <p>Phí dịch vụ</p>
                                <p>{data && numberWithCommas(castService(dateIn,dateOut,data.giaNgayThuong,data.giaNgayCuoiTuan))} VNĐ</p>
                            </div>
                        </div>
                        <div className="PageBook__slide--default ">
                            <strong style={{color:'black'}}  className="PageBook__slide--cast-element">
                                <p>Tổng tiền</p>
                                <p>{data && numberWithCommas(castTotal(dateIn,dateOut,data.giaNgayThuong,data.giaNgayCuoiTuan))} VNĐ</p>
                            </strong>
                            
                        </div>
                        <div className="PageBook__slide--default">
                            <strong style={{color:'black'}}>Chính sách hủy phòng</strong>
                            <p> <strong style={{color:'black'}}>Linh hoạt</strong>  : Miễn phí hủy phòng trong vòng 48h sau khi đặt phòng thành công và trước 1 ngày so với thời gian check-in. Sau đó, hủy phòng trước 1 ngày so với thời gian check-in, được hoàn lại 100% tổng số tiền đã trả (trừ phí dịch vụ).</p>
                            <p class="cozy__base--button">Chi tiết</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        );
}

export default PageBookRoom;
