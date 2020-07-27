import React from 'react';
import moment from 'moment';
import numberWithCommas from '../../js/numberWithCommas';
import { useHistory } from "react-router-dom";
const ItemListBookRoom = (props) => {
    const history = useHistory();
    const handleOnClick = ()=>{
        history.push(`/host/reservations/${props.data.id}`);
    }
    if (props.data)
    return (
        <div class="ListBookRoom">
            <div>
                <p class="ListBookRoom__status">Complete</p>
            </div>
            <div class="ListBookRoom__body">
                <div class="ListBookRoom__name">
                    {props.data.tenphong}
                </div>
                <div class="ListBookRoom__detail">
                    <div class="ListBookRoom__grid">
                        <div>
                            <p class="ListBookRoom__detail--label">Số khách</p>
                            <p class="ListBookRoom__detail--containt">{props.data.sokhach}</p>
                        </div>
                        <div>
                            <p class="ListBookRoom__detail--label">Người nhận</p>
                            <p class="ListBookRoom__detail--containt">{props.data.ten}</p>
                        </div>
                        <div>
                            <p class="ListBookRoom__detail--label">Ngày đến</p>
                            <p class="ListBookRoom__detail--containt">{moment(props.data.ngaycheckin).format("DD-MM-yyyy")}</p>
                        </div> 
                        <div>
                            <p class="ListBookRoom__detail--label">Tổng tiền</p>
                            <p class="ListBookRoom__detail--containt">{numberWithCommas(props.data.gia)}₫</p>
                        </div> 
                        
                        <div>
                            <p class="ListBookRoom__detail--label">Số điện thoại</p>
                            <p class="ListBookRoom__detail--containt">{props.data.sdt}</p>
                        </div>       
                        <div>
                            <p class="ListBookRoom__detail--label">Ngày đi</p>
                            <p class="ListBookRoom__detail--containt">{moment(props.data.ngaycheckout).format("DD-MM-yyyy")}</p>
                        </div> 
                    </div>    
                </div>
                <div class="ListBookRoom__showmore">
                    <button onClick={handleOnClick} class="ListBookRoom__showmore--bt" type="">
                        Xem chi tiết
                    </button>
                </div>
            </div>
        </div>
    );
    else return null;
}

export default ItemListBookRoom;
