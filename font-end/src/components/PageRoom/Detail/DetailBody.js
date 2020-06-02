import React from 'react';
import ListReview from './review/ListReview';

//noi chuoi dia chi
const str = 'A22/4 Phạm Thế Hiền, Phường 3, Quận 8, Hồ Chí Minh';
const str2 = str.split(' ');
let newStr="https://www.google.com/maps/embed/v1/place?key=AIzaSyBzPKwdedCrteLH--f8928A34RrgCrZYR4&q=";
str2.map(temp=>{
    newStr+='+'+temp;
});

//cach 2
// let newStr1="";
// str2.map(temp=>{
//     newStr1+='+'+temp;
// });
// const adress = `https://www.google.com/maps/embed/v1/place?key=AIzaSyBzPKwdedCrteLH--f8928A34RrgCrZYR4&q=${newStr1}`
const DetailBody = () => {
    return (
        <section className="detail__body">
        <div className="detail__body--titleCozy cozy">
            <div className="cozy__title">Tiện nghi chỗ ở</div>
            <div className="cozy__intro">Giới thiệu về các tiện nghi và dịch vụ tại nơi lưu trú</div>
            <div className="cozy__base"> 
                <div className="cozy__base--title">
                    Tiện ích
                </div>
                <ul className="cozy__base--list row">
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-wifi cozy__base--list-icon"></i> Wifi</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-tv cozy__base--list-icon"></i> TV</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-wifi cozy__base--list-icon"></i> Wifi</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-tv cozy__base--list-icon"></i> TV</li>
                </ul> 
            </div>
            <div className="cozy__base"> 
                <div className="cozy__base--title">
                    Tiện ích bếp
                </div>
                <ul className="cozy__base--list row">
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-wifi cozy__base--list-icon"></i> Wifi</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-tv cozy__base--list-icon"></i> TV</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-wifi cozy__base--list-icon"></i> Wifi</li>
                    <li className="cozy__base--list-item col-1-of-3"><i className="fas fa-tv cozy__base--list-icon"></i> TV</li>
                </ul> 
            </div>
            <p className="detail__head--intro-bt" id="readMore">Xem thêm </p>
        </div>
        <div className="detail__body--price">
            <div className="cozy__title">Giá phòng</div>
            <div className="cozy__intro">Giá có thể tăng vào cuối tuần hoặc ngày lễ</div>
            <ul className="detail__price">
                <li className="detail__price--item"><p className="detail__price--item-note">Thứ hai - Thứ năm</p> 945,000₫</li>
                <li className="detail__price--item"><p className="detail__price--item-note">Thứ sáu - Chủ nhật</p> 945,000₫</li>
                <li className="detail__price--item"><p className="detail__price--item-note">Phí khách tăng thêm</p> 150,000₫ (sau 2 khách)</li>
                <li className="detail__price--item"><p className="detail__price--item-note">Số đêm tối thiểu</p> 1 đêm</li>
            </ul>
        </div>
        <div className="detail__body--review">
            <div className="cozy__title">Đánh giá</div>
            <ListReview/>
        </div>
        <div className="detail__body--rules">
            <div className="cozy__title">Nội quy và chính sách về chỗ ở</div>
            <div>
                <div className="cozy__base--title" style={{marginTop:'1rem'}}>Chính sách hủy phòng</div>
                <div className="cozy__base--para">
                <strong>Trung bình:</strong> Miễn phí hủy phòng trong vòng 48h sau khi đặt phòng thành công và trước 5 ngày so với thời gian check-in. Sau đó, hủy phòng trước 5 ngày so với thời gian check-in, được hoàn lại 100% tổng số tiền đã trả (trừ phí dịch vụ). <p className="cozy__base--button">Chi tiết</p> 
                </div>
            </div>
            <div>
                <div className="cozy__base--title" style={{marginTop:'1rem'}}>Lưu ý đặc biệt</div>
                <div className="cozy__base--para">
                Giờ check in thông thường 14h00, giờ check out là 12h00. Tuy nhiên tùy tình trạng phòng trống chúng tôi có thể cho khách in sớm hoặc out trễ. Nếu thời gian in sớm/out trễ >3h chúng tôi có thể thu phụ phí
                </div>
            </div>
            <div>
                <div className="cozy__base--title" style={{marginTop:'1rem'}}>Thời gian nhận phòng</div>
                <ul className="detail__price">
                    <li className="detail__price--item"><p className="detail__price--item-note">Nhận phòng</p> 02:00 pm - 09:00 pm</li>
                    <li className="detail__price--item"><p className="detail__price--item-note">Trả phòng</p> 12:00 am</li>
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
    
    );
}

export default DetailBody;
