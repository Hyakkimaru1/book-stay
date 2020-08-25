import React, { useEffect, useState } from 'react';
import ListReview from './review/ListReview';
import numberWithComas from '../../../js/numberWithCommas';

import $ from 'jquery';
import Swal from 'sweetalert2';
import { useHistory } from 'react-router-dom';
const config = require('../../../config/default.json');
var moment = require('moment');

let newStr="";

//cach 2
// let newStr1="";
// str2.map(temp=>{
//     newStr1+='+'+temp;
// });
// const adress = `https://www.google.com/maps/embed/v1/place?key=AIzaSyBzPKwdedCrteLH--f8928A34RrgCrZYR4&q=${newStr1}`
const DetailBody = (props) => {
    const [tienNghi, setTienNghi] = useState();
    const [lengthCmt, setLengthCmt] = useState(false);
    const history = useHistory();
    let sumIconShow = 0;
    useEffect(() => {
        $.get(`${config.url}/room/tiennghi/${props.id}`,data=>{
            setTienNghi(data);
        });
        $.get(`${config.url}/room/lengthcmt/${props.id}`,data=>{
            if (data[0].length > 0){
                setLengthCmt(true);
            }
        });
    }, [props.id]);
    //noi chuoi dia chi
    if (props.data){
        const str = props.data.diaChi;
        const str2 = str.split(' ');
        newStr="https://www.google.com/maps/embed/v1/place?key=AIzaSyBzPKwdedCrteLH--f8928A34RrgCrZYR4&q=";
        str2.map(temp=>{
            newStr+='+'+temp;
            return newStr;
        });
    }  
    return (
        <div>
             <section className="detail__body">
                <div className="detail__body--titleCozy cozy">
                    <div className="cozy__title">Tiện nghi chỗ ở</div>
                    <div className="cozy__intro">Giới thiệu về các tiện nghi và dịch vụ tại nơi lưu trú</div>
                    <div className="cozy__base"> 
                        <div className="cozy__base--title">
                            Tiện ích
                        </div>
                        <ul className="cozy__base--list row">
                            {tienNghi && tienNghi.map(val=>{
                                if (val.tenDanhMuc==='Tiện ích'){
                                    sumIconShow++;
                                    return <li className="cozy__base--list-item col-1-of-3"><td dangerouslySetInnerHTML={{__html: val.icon}}/> {val.tenTienNghi}</li>
                                }
                                else return null;
                            })}
                        </ul> 
                    </div>
                    <div className="cozy__base"> 
                        <div className="cozy__base--title">
                            Tiện ích bếp
                        </div>
                        <ul className="cozy__base--list row">
                            {tienNghi && tienNghi.map(val=>{
                                if (val.tenDanhMuc==='Tiện ích bếp'){
                                    sumIconShow++;
                                    return <li className="cozy__base--list-item col-1-of-3"><td dangerouslySetInnerHTML={{__html: val.icon}} /> {val.tenTienNghi}</li>
                                }
                                else return null;
                            })}
                        </ul> 
                    </div>
                    <a href="#popup" className="detail__head--intro-bt" id="readMore" onClick={ () =>{
                        let scroll = document.getElementsByTagName("html")[0];
                        scroll.style.overflowY = "hidden";
                        let icon = [].slice.call(document.getElementsByClassName("cozy__base--list-icon"));
                        for (let i = sumIconShow;i<icon.length;i++)
                        {
                            icon[i].classList.add("popup__base--icon")
                        }
                        
                    }}>Xem thêm </a>
                </div>
                <div className="detail__body--price">
                    <div className="cozy__title">Giá phòng</div>
                    <div className="cozy__intro">Giá có thể tăng vào cuối tuần hoặc ngày lễ</div>
                    <ul className="detail__price">
                        <li className="detail__price--item"><p className="detail__price--item-note">Thứ hai - Thứ năm</p>{props.data && numberWithComas(props.data.giaNgayThuong)}₫</li>
                        <li className="detail__price--item"><p className="detail__price--item-note">Thứ sáu - Chủ nhật</p> {props.data && numberWithComas(props.data.giaNgayCuoiTuan)}₫</li>
                        {props.data && props.data.giaNgayLe&& props.data.giaNgayLe!=0?<li className="detail__price--item"><p className="detail__price--item-note">Giá ngày lễ </p>{ numberWithComas(props.data.giaNgayLe)}₫</li>:null}
                        {props.data && props.data.giaThang&& props.data.giaThang!=0?<li className="detail__price--item"><p className="detail__price--item-note">Chiết khấu tháng </p>{ numberWithComas(props.data.giaThang)}%</li>:null} 
                        <li className="detail__price--item"><p className="detail__price--item-note">Số đêm tối thiểu</p> 1 đêm</li>
                    </ul>
                </div>
                {lengthCmt && <div className="detail__body--review">
                    <div className="cozy__title">Đánh giá</div>
                    <ListReview id = {props.id} number={3}/>
                    <a href="#popup1" className="detail__head--intro-bt" id="readMore" onClick={ () =>{
                        let scroll = document.getElementsByTagName("html")[0];
                        scroll.style.overflowY = "hidden";
                        if (document.getElementById("popupContent1").offsetHeight>666){
                            document.getElementById("popupContent1").style.marginTop = (document.getElementById("popupContent1").offsetHeight - 666)/2 + 'px';
                        }
                    }}>Xem thêm </a> 
                </div>}
                <div className="detail__body--rules">
                    <div className="cozy__title">Nội quy và chính sách về chỗ ở</div>
                    <div>
                        <div className="cozy__base--title" style={{marginTop:'1rem'}}>Chính sách hủy phòng</div>
                        <div className="cozy__base--para">
                        <strong>Trung bình:</strong> Miễn phí hủy phòng trong vòng 48h sau khi đặt phòng thành công và trước 1 ngày so với thời gian check-in. Sau đó, hủy phòng trước 1 ngày so với thời gian check-in, được hoàn lại 100% tổng số tiền đã trả (trừ phí dịch vụ). <p onClick={()=>history.push('/cancellation_policy')}  className="cozy__base--button">Chi tiết</p> 
                        </div>
                    </div>
                    <div>
                        <div className="cozy__base--title" style={{marginTop:'1rem'}}>Lưu ý đặc biệt</div>
                        <div className="cozy__base--para">
                        <td dangerouslySetInnerHTML={{__html: props.data && props.data.luuY}} />
                        </div>
                    </div>
                    <div>
                        <div className="cozy__base--title" style={{marginTop:'1rem'}}>Thời gian nhận phòng</div>
                        <ul className="detail__price">
                            <li className="detail__price--item"><p className="detail__price--item-note">Nhận phòng</p> {props.data && moment(props.data.thoiGianNhan,"kk:mm:ss").format("LT")}</li>
                            <li className="detail__price--item"><p className="detail__price--item-note">Trả phòng</p> {props.data && moment(props.data.thoiGianTra,"kk:mm:ss").format("LT")}</li>
                        </ul>
                    </div>
                    
                </div>
                <div className="detail__body--place" id="place_map">
                    <div >
                    <div className="cozy__title">Vị trí</div>
                    <iframe
                        title="myMap"
                        width="100%"
                        height="450"
                        frameborder="0" style={{marginTop:'4rem', border:0}}
                        src={newStr} allowfullscreen>
                    </iframe>
                    </div>
                </div>
            </section>
    
            <div class="popup" id="popup" style={{overflowY:'scroll'}}>
                <div class="popup__content" id="popupContent">
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                                Tiện ích
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi && tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                            Tiện ích bếp
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi && tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích bếp'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>  
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                            Tiện ích phòng
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi && tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích phòng'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>  
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                            Tiện ích gia đình
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi && tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích gia đình'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>  
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                            Tiện ích giải trí
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi && tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích giải trí'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>  
                    <div className="popup__base"> 
                            <div className="popup__base--title">
                                Tiện ích nổi bật
                            </div>
                           <ul className="popup__base--list">
                                {tienNghi &&  tienNghi.map(val=>{
                                    if (val.tenDanhMuc==='Tiện ích nổi bật'){
                                        return <li className="popup__base--list-item popup__text">{val.tenTienNghi} <td dangerouslySetInnerHTML={{__html: val.icon}}/></li>
                                    }
                                    else return null;
                                })}
                            </ul> 
                    </div>             
                </div>
                
                <a href="#section-course" class="popup__close" onClick={()=>{
                                document.getElementsByTagName("html")[0].style.overflowY = "scroll";                               
                            }}>&times;</a>
            </div>
            <div class="popup" id="popup1" style={{overflowY:'scroll'}}>
                <div class="popup__content" id="popupContent1">
                    <div class="popup__content--review">
                        <ListReview id = {props.id} number={"full"}/>
                    </div>    
                </div>
                
                <a href="#section-course1" class="popup__close" onClick={()=>{
                                document.getElementsByTagName("html")[0].style.overflowY = "scroll";                               
                            }}>&times;</a>
            </div>

        </div>
       
    );
}

export default DetailBody;
