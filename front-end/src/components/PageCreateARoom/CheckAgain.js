import React from 'react';

const CheckAgain = (props) => {
    const handleChange = (e) => {
        props.onChange({isCheckAgain:!props.isCheckAgain});
    }
    return (
        <section className="container" style={{marginTop:'5rem',maxWidth:'80rem'}}>
            <div style={{textAlign: 'center',fontSize: '2rem',marginBottom: '1.5rem'}}>
                Thông tin chỗ nghỉ 
            </div>
            <div className="CreateRoomCheckAgain">
                <div className="CreateRoomCheckAgain__section">
                    <div className="CreateRoomCheckAgain__section--title">
                        Các thông tin chỗ nghỉ của Quý vị đã chính xác chưa?
                    </div>
                    <div className="CreateRoomCheckAgain__section--text">
                        3 thông tin sau là quan trọng nhất khi đăng chỗ nghỉ của Quý vị. Vui lòng kiểm tra lại ngay để tránh có sai sót.
                    </div>
                </div>
                <div className="CreateRoomCheckAgain__section">
                    <div className="CreateRoomCheckAgain__section--title">
                        Tên chỗ nghỉ
                    </div>
                    <div className="CreateRoomCheckAgain__section--text">
                        {props.ten}
                    </div>
                </div>
                <div className="CreateRoomCheckAgain__section">
                    <div className="CreateRoomCheckAgain__section--title">
                        Địa chỉ chỗ nghỉ
                    </div>
                    <div className="CreateRoomCheckAgain__section--text">
                        {props.diaChi}
                    </div>
                </div>
                <div className="CreateRoomCheckAgain__section">
                    <div className="CreateRoomCheckAgain__section--title">
                        Giá cơ bản
                    </div>
                    <div className="CreateRoomCheckAgain__section--text">
                        Giá ngày thường: {props.giaNgayThuong} VNĐ
                    </div>
                    <div className="CreateRoomCheckAgain__section--text">
                        Giá ngày cuối tuần: {props.giaNgayCuoiTuan} VNĐ 
                    </div>
                </div>
                <div className="CreateRoomCheckAgain__section">
                    <input defaultChecked={props.isCheckAgain} onChange={handleChange} className="CreateRoom__checkbox--input" id="checkInfAgain" type="checkbox"></input>
                    <label style={{marginLeft:'1rem'}} for="">Mọi thông tin của tôi đã chính xác</label>
                </div>
            </div>
        </section>
    );
}

export default CheckAgain;
