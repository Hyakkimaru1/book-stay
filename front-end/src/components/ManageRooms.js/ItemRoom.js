import React, { useState,useEffect } from 'react';
import moment from 'moment';
import numberWithCommas from '../../js/numberWithCommas';
import { useHistory } from "react-router-dom";
import { ToastContainer, toast } from 'react-toastify';
import Swal from 'sweetalert2';
import $ from 'jquery';
const config = require('../../config/default.json');

const ItemRoom = (props) => {
    const history = useHistory();
    const [trangThai,settrangThai] = useState(null);
    const handleOnClickShow = () => {
        history.push(`/rooms/${props.data.id}`);
    }
    const handleOnClickFix = () => {
        history.push(`/host/fix/${props.data.id}`);
    }
    const handleChangeReservations = () => {
        history.push(`/host/reservations/?rooms=${props.data.id}`);
    }
    const handleChangeOutOfRoom = () => {
        history.push(`/host/outofroom/${props.data.id}`);
    }
    const handleChangeToggle = (e) => {
        settrangThai(e.target.checked);
    }
    
    useEffect(() => {
        if (trangThai!=null){
            Swal.fire({
                title: 'Bạn có chắc muốn thay đổi?',
                text: "Điều này sẽ thay đổi trạng thái phòng này. Tuy nhiên, các đặt chỗ trước đó vẫn sẽ được thực hiện!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý!',
                cancelButtonText:'Cân nhắc lại'
              }).then((result) => {
                if (result.value) {
                    $.ajax({
                        url:`${config.url}/host/roomowner/${props.data.id}/updateStatus`,
                        type:'post',
                        data: {trangThai},
                        xhrFields: {
                            withCredentials: true
                        }, success: ()=>{
                            toast.success('Cập nhật thành công');
                        }, statusCode: {
                            403: () => {
                                toast.error('Bạn không đủ quyền hạn, vui lòng liên hệ quản trị.')
                                document.getElementById(`toggleCheck${props.data.id}`).checked=!trangThai;
                                settrangThai(null);
                            },
                            404: () => {toast.error('Không tìm thấy phòng này')
                                document.getElementById(`toggleCheck${props.data.id}`).checked=!trangThai;
                                settrangThai(null);
                            },
                            500: () => {
                                toast.error('Cập nhật thất bại')
                                document.getElementById(`toggleCheck${props.data.id}`).checked=!trangThai;
                                settrangThai(null);
                            }
                        }});
                }
                else {
                    document.getElementById(`toggleCheck${props.data.id}`).checked=!trangThai;
                    settrangThai(null);
                }
            });
        }  
    }, [trangThai]);
    if (props.data)
        return (
            <div className="ListBookRoom">
                <div className="ListBookRoom__body" style={{marginTop:'0rem'}}>
                    <div className="ListBookRoom__img" >
                        <img className="ListBookRoom__img--img" src={props.data.img} alt=""/>
                    </div>
                    <div className="ListBookRoom__name" style={{flex:'1 35%'}}>
                        {props.data.ten}
                        <div>
                            <p className="ListBookRoom__detail--label">Địa chỉ</p>
                            <p className="ListBookRoom__detail--containt">{props.data.diaChi}</p>
                        </div>
                    </div>
                    <div className="ListBookRoom__detail" style={{borderRight: 'none',flex:'1 40%'}}>
                        <div className="ListBookRoom__gridManage">
                            <div>
                                <p className="ListBookRoom__detail--label">Xem phòng</p>
                                <button onClick={handleOnClickShow} className="ListBookRoom__showmore--btManage" type="">
                                    Xem chi tiết
                                </button>
                            </div>
                            <div>
                                <p className="ListBookRoom__detail--label">Sửa phòng</p>
                                <button onClick={handleOnClickFix} className="ListBookRoom__showmore--btManage" type="">
                                    Sửa phòng
                                </button>
                            </div>
                            <div>
                                <p className="ListBookRoom__detail--label">Quản lý hết phòng</p>
                                <button onClick={handleChangeOutOfRoom} className="ListBookRoom__showmore--btManage" type="">
                                    &nbsp;&nbsp;&nbsp; Quản lý&nbsp;&nbsp;&nbsp;
                                </button>
                            </div>
                            <div>
                                <p className="ListBookRoom__detail--label">Xem danh sách đặt</p>
                                <button onClick={handleChangeReservations} className="ListBookRoom__showmore--btManage" type="">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </button>
                            </div>
                            <div style={{gridColumnStart: '1',gridColumnEnd: '3',textAlign:'center'}}>
                                <p className="ListBookRoom__detail--label" style={{color:'black',fontSize:'1.4rem'}}>Hoạt động</p>
                                <label className="switch">
                                    <input id={`toggleCheck${props.data.id}`} onChange={handleChangeToggle} type="checkbox" defaultChecked={props.data.trangThai===1?true:false}/>
                                    <span className="slider round"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        );
    else return null;
}

export default ItemRoom;
