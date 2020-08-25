import React from 'react';

const NameRoom = (props) => {
    const handleChangeName = (e) => {
        props.onChange({ten:e.target.value})
    }
    const handleChangeAddress = (e) => {
        props.onChange({diaChi:e.target.value})
    }

    const handleChangeChoThue = (e) => {
        props.onChange({soluongchothue:e.target.value})
    }
    return (
        <div style={{marginTop:'5rem'}}>
            <div className="CreateRoom__title">
                <p className="CreateRoom__title--ele">Thông tin đầu tiên</p>
            </div>
            <div className="CreateRoom">
             
                <label className="CreateRoom__label" for="">Tên chỗ ở </label>
                <input className="CreateRoom__input" onChange={handleChangeName} value={props.ten} name="" id="nameHome" type="text" required></input>

                <label className="CreateRoom__label" for="">Địa chỉ của chỗ ở</label>
                <input className="CreateRoom__input" onChange={handleChangeAddress} value={props.diaChi} name="" id="addHome" type="text" required></input> 

                <label className="CreateRoom__label" for="">Số lượng muốn cho thuê</label>
                <input className="CreateRoom__input" onChange={handleChangeChoThue} value={props.soluongchothue} name="" id="soluongchothue" type="number" min="1" required></input> 
                
            </div>
        </div>
       
    );
}

export default NameRoom;

