import React,{useState,useEffect, useContext} from 'react';
import {RangeDayPicker} from './RangeDayPicker';
import {checkWeekdays,checkNormalDays,checkDays} from '../../js/checkWeekdays';
import { useHistory } from "react-router-dom";
import numberWithComas from '../../js/numberWithCommas';
import {UserContext} from '../../UserContext';
import { toast } from 'react-toastify';
import $ from 'jquery';

var moment = require('moment');
const config = require('../../config/default.json');

const styleHr ={
    marginBottom: '3rem',
    borderTop: '1px solid #E9E9E9'
}


const RoomSideBar = (props) => {
    let caseNormal="0";
    let caseWeekend="0";
    const [state] = useContext(UserContext);
    const [cast,setCast] = useState(caseNormal);
    const [user,setUser] = useState({}); 
    const [maxGuest,setMaxGuest] = useState(0);
    if (props.data){
        caseNormal = props.data.giaNgayThuong;
        caseWeekend = props.data.giaNgayCuoiTuan;
    }  
    const [roomInvalid,setRoomInvalid] =useState([]);
    useEffect(
        () => {
            if (props.data){
                setCast(props.data.giaNgayThuong);
                $.get(`${config.url}/room/owner/${props.data.id}`,val=>{
                    setUser(val);
                }); 
                
                setMaxGuest(props.data.soKhachToiDa);
                let tempRoomInvalid = [];
                props.data.ngayHetPhong.map(val => {
                    tempRoomInvalid.push(moment(new Date(val.ngayHetPhong)))
                });
                setRoomInvalid(tempRoomInvalid);
            }   
        },
        [props.data],
    );

    //so khach
    const [quantity,setQuantity] = useState(1);
    //Ngay bat dau
    const [startDay,setStartDay] = useState(null);
    //Ket thuc
    const [endDate,setEndDate] = useState(null);
    const [focused,setFocused] = useState(null);
    const history = useHistory();
    const handleFocused = (newFocused) => {
        setFocused(newFocused);
    }

    const showDay = ()=>{
        if (startDay!==null && endDate!==null && checkValidDate(startDay,endDate)){
            if (state.user && state.user == user.id || state.admin){
                toast.error(`Bạn đang là chủ phòng`); 
            }
            else {
                history.push(`/checkout/room?id=${props.data.id}&checkin=${startDay.format("YYYY-MM-DD")}&checkout=${endDate.format("YYYY-MM-DD")}&guest=${quantity}`);
            }
        }
        else if (startDay===null){
            setFocused('startDate');
        }
        else if (endDate===null) {
            setFocused('endDate');
        }
    };

    const checkValidDate = (newStartDay,newEndDate)=>{
        if (roomInvalid.length>0){
            let check=true;
            roomInvalid.map(val=>{ 
                if (newStartDay!==null && newStartDay.isSame(val,'day'))
                    {  
                        check=false;
                        return toast.error(`Rất xin lỗi nhưng ngày ${val.format('DD-MM-YYYY')} đã hết phòng`);   
                    }
                else if (newStartDay!==null && newEndDate!==null && newStartDay.isBefore(val, 'day') && newEndDate.isAfter(val,'day')){
                    check= false;
                    return toast.error(`Rất xin lỗi nhưng ngày ${val.format('DD-MM-YYYY')} đã hết phòng`); 
                }
                return null;
            });
            return check;
        }
        return true;
    }

    return (
        <div className="room-sidebar">
            <div className="room-sidebar__wrap px--12 px--lg--18">
                <div className="room-sidebar__pricing">
                    <p className="room-sidebar__pricing--fadeIn">
                        <span className="extra-bold">{numberWithComas(cast)}</span> <span className="p--small">/{checkDays(startDay,endDate)}đêm</span> 
                    </p>
                    <RangeDayPicker
                        handleFocused={handleFocused}
                        focusedInput={focused} 
                        onDatesChange={
                        (newStartDay,newEndDate)=>{
                            checkValidDate(newStartDay,newEndDate);
                            setStartDay(newStartDay);
                            setEndDate(newEndDate);
                            setCast(checkNormalDays(newStartDay,newEndDate)*caseNormal+checkWeekdays(newStartDay,newEndDate)*caseWeekend);
                        }}/>
                    <div className="room-sidebar__pricing--customer">
                        <p className="room-sidebar__pricing--cur"> 
                            <span id="minus" onClick={()=>{
                                 if (quantity!==1){
                                    setQuantity(quantity-1);
                                    if (quantity-1===1){
                                        document.getElementById('minus').classList.add('room-sidebar__pricing--cur-ban');
                                    }  
                                    document.getElementById('plus').classList.remove('room-sidebar__pricing--cur-ban')
                                }  
                            }} 
                            className="room-sidebar__pricing--cur-minus room-sidebar__pricing--cur-ban noselect">−</span> 
                            <span style={{padding: '5px 13px'}}>{quantity} khách</span> 
                            <span id="plus" onClick={()=>{
                                if (quantity!==maxGuest){
                                    setQuantity(quantity+1);
                                    if (quantity+1===maxGuest){
                                        document.getElementById('plus').classList.add('room-sidebar__pricing--cur-ban');
                                    }  
                                    document.getElementById('minus').classList.remove('room-sidebar__pricing--cur-ban')
                                }    
                            }}  className="room-sidebar__pricing--cur-plus noselect">+</span>
                        </p>
                    </div>
                    <div className="room-sidebar__pricing--bookNow">
                        <button onClick={showDay} className="bt-bookNow">
                            <p><i className="fas fa-bolt"></i>&nbsp;&nbsp;đặt ngay</p>
                        </button>
                    </div>
                </div>
                <div className="room-sidebar__host">
                    <div style={styleHr}></div>
                    <div onClick={()=> history.push(`/host/${user.id}`)}  style={{ cursor: 'pointer'}}>
                        <div className="room-sidebar__host--img">
                            <img className="room-sidebar__host--img-show" alt="" src={user.avatar} />
                        </div>
                        <div className="room-sidebar__host--name">
                            <p className="room-sidebar__host--name-main" >{user.ten}</p>
                            <p  className="room-sidebar__host--name-detail" >Tham gia {moment(user.timeCreate).format('MM/YYYY')}</p>
                        </div>
                    </div>
                </div>
                <div className="room-sidebar__call px--12 px--lg--24 w--100">
                   <div className="room-sidebar__call--bg">
                   Gọi <strong>0355196515</strong> để được hỗ trợ 24/7 &nbsp;<i className="far fa-comments"></i>
                   </div>
            </div>
            </div>
            
        </div>
    );
}

export default RoomSideBar;
