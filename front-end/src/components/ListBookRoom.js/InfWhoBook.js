import React, { useState, useEffect } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import moment from 'moment';
import $ from 'jquery';
const config = require('../../config/default.json');
const InfWhoBook = () => {
    const {id} = useParams();
    const history = useHistory();
    const [inf,setInf] = useState(null);

    if (isNaN(id)){
        history.push('/ERROR');
    }

    useEffect(() => {
            $.ajax({
                url: `${config.url}/host/reservations/${id}`,
                type: 'get',
                xhrFields: {
                    withCredentials: true
                },
                success: function( val ) {
                    console.log(val);
                }
            })
            .fail(function() {
                //history.push('/ERROR');
            });
    }, [id]);
   
    return inf !== null ? (
        <div className="row InfWhoBook" style={{marginTop:'10rem'}} >
            <div className="col-1-of-3">
                <div onClick={()=>history.push(`/rooms/${inf.idphong}`)} className="InfWhoBook__room" >
                    <div className="InfWhoBook__room--img">
                        <img className="InfWhoBook__room--img-img" src={inf.img} alt=""></img>
                    </div>
                    <hr  className="InfWhoBook__room--line"></hr>
                    <div className="InfWhoBook__room--nameadd">
                    <div className="InfWhoBook__room--name">
                        {inf.tenphong}
                    </div>
                    <div className="InfWhoBook__room--add">
                        {inf.diaChi}
                    </div>
                    </div>
                   
                </div>
            </div>
            
           <div className="col-2-of-3">
                <div className="InfWhoBook__who">
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label"> Người nhận phòng:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.ten}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">email người nhận phòng:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.email}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Số điện thoại người nhận:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.sdt}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Tổng tiền:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.gia}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Số khách đến:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.sokhach}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Tên người đặt:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.tennguoidat}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Email người đặt:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.emailnguoidat}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Số điện thoại người đặt:</span> 
                        <div className="InfWhoBook__contain">
                            {inf.sdtnguoidat}
                        </div>
                    </div>
                    
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Ngày đến:</span> 
                        <div className="InfWhoBook__contain InfWhoBook__date">
                            {moment(inf.ngaycheckin).format('DD-MM-YYYY')}
                        </div>
                    </div>
                    <div className="InfWhoBook__who--ele">
                        <span className="InfWhoBook__label">Ngày đi:</span> 
                        <div className="InfWhoBook__contain InfWhoBook__date">
                            {moment(inf.ngaycheckout).format('DD-MM-YYYY')}
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    ): <h1 style={{marginTop:'10rem'}}>Bạn không có quyền truy cập</h1> ;
}

export default InfWhoBook;
