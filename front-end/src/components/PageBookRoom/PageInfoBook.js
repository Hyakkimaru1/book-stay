import React, { useContext, useState } from 'react';
import { useLocation } from 'react-router-dom';
import getUrlParameter from '../../js/getUrlParameter';
import {UserContext} from '../../UserContext';
import moment from 'moment';
import $ from 'jquery';
import {  toast } from 'react-toastify';

const config = require('../../config/default.json');

const PageInfoBook = (props) => {
    const location = useLocation();
    const dateIn = moment(getUrlParameter('checkin',location.search));
    const dateOut = moment(getUrlParameter('checkout',location.search));
    const [state] = useContext(UserContext);

    const [name,setName] = useState(state.ten);
    const [numPhone, setNumPhone] = useState(state.sdt);
    const [email, setEmail] = useState(state.email);

    const thumay = (date) => {
        const dateOfWeek = moment(date).weekday();
        switch (dateOfWeek) {
            case 1:
                return 'Thứ 2'
            case 2:
                return 'Thứ 3'
            case 3:
                return 'Thứ 4'
            case 4:
                return 'Thứ 5'
            case 5:
                return 'Thứ 6'
            case 6:
                return 'Thứ 7'    
            default:
                return 'Chủ nhật';
        }
    }
    const handleOnClick = () => {
        if (state.user && props.user.id == state.user ){
            toast.error(`Bạn đang là chủ phòng`); 
        } 
        else{
            const datphonggiup = document.getElementById("datphonggiup").checked;
            let dataSend = {
                phong: getUrlParameter('id',location.search),
                gia: props.gia,
                nguoidat:state.user,
                ngaycheckin: dateIn.format('YYYY-MM-DD'),
                ngaycheckout:dateOut.format('YYYY-MM-DD'),
                sokhach:getUrlParameter('guest',location.search)
            } ;
            if (datphonggiup){
                dataSend.ten = document.getElementById("PageBook__name").value;
                dataSend.sdt = document.getElementById("PageBook__name2").value;
                dataSend.email = document.getElementById("PageBook__name3").value;
            }
            else {
                dataSend.ten = document.getElementById("PageBook__nameMain").value;
                dataSend.sdt = document.getElementById("PageBook__nameMain2").value;
                dataSend.email = document.getElementById("PageBook__nameMain3").value;
            }
            $.post(`${config.url}/room/book`,dataSend, (val) => {
                props.onClick(val.idBook);
            }).fail(function() {
                toast.error('Bạn đang có giao dịch trùng chưa được thanh toán.');
            });
        }
    }
    
    return (
        <div>
             <div className="PageBook__head">
                    Thông tin đặt chỗ
                    </div>
                    <div className="PageBook__body">
                        <div className="PageBook__body--part">
                            <div className="PageBook__title"> <span  className="PageBook__title--force">*</span> Số Khách</div>
                            <div className="PageBook__textBox pr--18 py--12 px--lg--18">{getUrlParameter('guest',location.search)} khách</div>
                        </div>
                        <div className="PageBook__body--part">
                            <div className="PageBook__title">1 đêm tại Anna House - Newly modern room in the center (01)</div>
                            <div className="PageBook__time  pr--18 py--12 px--lg--18">
                                <div className="PageBook__time--line PageBook__time--line-blue"></div>
                                <p className="PageBook__time--check">Nhận phòng</p>
                                <div className="PageBook__time--timeCheck">
                                    {dateIn.format('DD/MM/YYYY')}
                                </div >
                                <p className="PageBook__time--date">{thumay(getUrlParameter('checkin',location.search))}</p>                        
                            </div>

                            <div style={{marginLeft:'1rem'}} className="PageBook__time  pr--18 py--12 px--lg--18">
                                <div className="PageBook__time--line PageBook__time--line-red"></div>
                                <p className="PageBook__time--check">Trả phòng</p>
                                <div className="PageBook__time--timeCheck">
                                    {dateOut.format('DD/MM/YYYY')}
                                </div >
                                <p className="PageBook__time--date">{thumay(getUrlParameter('checkout',location.search))}</p>                        
                            </div>
                        </div>
                        <div className="PageBook__body--part">
                            <div className="PageBook__title">Trách nhiệm vật chất</div>
                            <div className="PageBook__text">Khách hàng chịu mọi trách nhiệm thiệt hại về tài sản đã gây ra tại chỗ ở trong thời gian lưu trú.</div>
                        </div>
                        <div className="PageBook__body--part">
                            <div className="PageBook__title">Nội quy chỗ ở</div>
                            <div className="PageBook__text">Vui lòng không mang theo vật nuôi, không hút thuốc, tiệc tùng ầm ĩ trong phòng, không sử dụng chất kích thích, không mở nhạc ồn ảnh hưởng đến các phòng khác và hàng xóm xung quanh. Bạn có thể hút thuốc trước cổng ra vào của Anna House.</div>
                        </div>
                    </div>
                    <div className="PageBook__head">
                        Thông tin của bạn
                    </div>
                    <div className="PageBook__body">
                        <div className="PageBook__body--part">
                            <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Tên Khách hàng</div>
                            <label style={{display:'inline-block'}} for="PageBook__nameMain" className="mt--10">Họ tên trên CMND/ Thẻ căn cước</label>
                            <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__nameMain" onChange={(e)=>setName(e.target.value)} value={name} type="text"></input>
                        </div>
                        <div className="PageBook__body--part">
                            <div className="PageBook__checkInfo">
                                <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Số điện thoại</div>
                                <label style={{display:'inline-block'}} for="PageBook__nameMain2" className="mt--10">Chỉ chứa chữ số</label>
                                <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__nameMain2" onChange={(e)=>setNumPhone(e.target.value)}  value={numPhone} type="text"></input>                     
                            </div>

                            <div style={{marginLeft:'1rem'}} className="PageBook__checkInfo">
                                <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Email</div>
                                <label style={{display:'inline-block'}} for="PageBook__nameMain3" className="mt--10">VD: email@example.com</label>
                                <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__nameMain3" onChange={(e)=>setEmail(e.target.value)} value={email} type="email"></input>              
                            </div>
                        </div>
                        <div style={{marginTop:'3rem'}}>
                            <input onClick={()=>{
                                $("#ShowInfoFriends").slideToggle("slow");
                                
                            }} id="datphonggiup" className="CreateRoom__checkbox--input" type="checkbox"></input>
                            <label style={{marginLeft:'2rem'}} for="datphonggiup">Tôi đặt phòng cho người khác</label>
                        </div>
                    <div id="ShowInfoFriends" style={{display:'none'}}>
                        <div className="PageBook__head">
                            Thông tin của người khác
                        </div>
                        <div className="PageBook__body">
                            <div className="PageBook__body--part">
                                <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Tên Khách hàng</div>
                                <label style={{display:'inline-block'}} for="PageBook__name" className="mt--10">Họ tên trên CMND/ Thẻ căn cước</label>
                                <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__name"  type="text"></input>
                            </div>
                            <div className="PageBook__body--part">
                                <div className="PageBook__checkInfo">
                                    <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Số điện thoại</div>
                                    <label style={{display:'inline-block'}} for="PageBook__name2" className="mt--10">Chỉ chứa chữ số</label>
                                    <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__name2"  type="text"></input>                     
                                </div>

                                <div style={{marginLeft:'1rem'}} className="PageBook__checkInfo">
                                    <div className="PageBook__title "> <span  className="PageBook__title--force">*</span> Email</div>
                                    <label style={{display:'inline-block'}} for="PageBook__name3" className="mt--10">VD: email@example.com</label>
                                    <input  className="ChangePass__input  pr--18 py--12 px--lg--18 mt--15" id="PageBook__name3" type="email"></input>              
                                </div>
                            </div>
                        </div> 
                    </div>
                    <button onClick={handleOnClick} style={{marginTop:'4rem'}} className="bt__default">Thanh Toán</button>
            </div>
        </div>
    );
}

export default PageInfoBook;
