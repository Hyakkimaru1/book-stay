import React,{useState} from 'react';
import {RangeDayPicker} from './RangeDayPicker';
import {checkWeekdays,checkNormalDays,checkDays} from '../../js/checkWeekdays';
import numberWithComas from '../../js/numberWithCommas';

const styleHr ={
    marginBottom: '3rem',
    borderTop: '1px solid #E9E9E9'
}


const RoomSideBar = () => {
    const caseNormal = 719200;
    const caseWeekend = 800000;
    const [quantity,setQuantity] = useState(1);
    const [startDay,setStartDay] = useState(null);
    const [endDate,setEndDate] = useState(null);
    const [cast,setCast] = useState(caseNormal);
    const showDay = ()=>{
        console.log(checkWeekdays(startDay,endDate)) ;  
    };

    return (
        <div className="room-sidebar">
            <div className="room-sidebar__wrap px--12 px--lg--18">
                <div className="room-sidebar__pricing">
                    <p className="room-sidebar__pricing--fadeIn">
    <span className="extra-bold">{numberWithComas(cast)}</span> <span className="p--small">/{checkDays(startDay,endDate)}đêm</span> 
                    </p>
                    <RangeDayPicker onDatesChange={
                        (newStartDay,newEndDate)=>{
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
                                if (quantity!==10){
                                    setQuantity(quantity+1);
                                    if (quantity+1===10){
                                        document.getElementById('plus').classList.add('room-sidebar__pricing--cur-ban');
                                    }  
                                    document.getElementById('minus').classList.remove('room-sidebar__pricing--cur-ban')
                                }    
                            }}  className="room-sidebar__pricing--cur-plus noselect">+</span>
                        </p>
                    </div>
                    <div className="room-sidebar__pricing--bookNow">
                        <button className="bt-bookNow">
                            <p onClick={showDay}><i className="fas fa-bolt"></i>&nbsp;&nbsp;đặt ngay</p>
                        </button>
                    </div>
                </div>
                <div className="room-sidebar__host">
                    <div style={styleHr}></div>
                    <a href="/" style={{textDecoration: 'none', cursor: 'pointer'}}>
                        <div className="room-sidebar__host--img">
                            <img className="room-sidebar__host--img-show" alt="" src="https://cdn.luxstay.com/users_avatar_default/default-avatar.png" />
                        </div>
                        <div className="room-sidebar__host--name">
                            <p className="room-sidebar__host--name-main" >Homestay Little Flower</p>
                            <p  className="room-sidebar__host--name-detail" >Tham gia 03/2020</p>
                        </div>
                    </a>
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
