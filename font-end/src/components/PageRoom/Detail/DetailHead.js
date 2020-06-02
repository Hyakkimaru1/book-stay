import React,{useState} from 'react';

const styleIcon = {
    width: 18,
    height: 16,
    paddingLeft: 3.5
}

const DetailHead = () => {
    const [readMore,setReadMore] = useState(true);
    return (
        <section className="detail__head">
                <div className="detail__head--title">
                    <p>
                    Mường Thanh Luxury Apartment with Mỹ Khê beach View
                    </p>    
                </div>
                <div className="detail__head--locState">
                    <p >
                    <span className="bg__icon"><i style={styleIcon} className="fas fa-map-marker-alt icon"></i></span>
                    Hải Châu, Đà Nẵng, Vietnam
                    <a href="#place_map" className="bt__watchMap"> Xem bản đồ</a>
                    </p>
                    <p >
                    <span className="bg__icon"> <i className="fas fa-home icon"></i></span>
                    Căn hộ dịch vụ 40 m<sup>2</sup>
                    </p>  
                </div>
                <div className="detail__head--intro">
                    <div id = "introPara" style={{lineHeight:'1.5'}} className="detail__head--intro-para">
                        <p >
                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!
                            <br/>
                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.
                            <br/>
                            - Chúng tôi miễn phí đưa đón bạn tại sân bay
                            <br/>
                            - Sông Hàn: 4 phút đi bộ
                            <br/>
                            - Bãi biển Mỹ Khê: 5 phút lái xe
                            <br/>
                            - Sân bay: 10 phút lái xe
                            <br/>
                            - Cầu rồng: 15 phút đi bộ
                            <br/>
                            - Dễ dàng đi đến đồi Bà Nà, Hội An
                            <br/>
                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.
                        </p>  
                        <p >
                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!
                            <br/>
                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.
                            <br/>
                            - Chúng tôi miễn phí đưa đón bạn tại sân bay
                            <br/>
                            - Sông Hàn: 4 phút đi bộ
                            <br/>
                            - Bãi biển Mỹ Khê: 5 phút lái xe
                            <br/>
                            - Sân bay: 10 phút lái xe
                            <br/>
                            - Cầu rồng: 15 phút đi bộ
                            <br/>
                            - Dễ dàng đi đến đồi Bà Nà, Hội An
                            <br/>
                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.
                        </p> 
                        <p >
                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!
                            <br/>
                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.
                            <br/>
                            - Chúng tôi miễn phí đưa đón bạn tại sân bay
                            <br/>
                            - Sông Hàn: 4 phút đi bộ
                            <br/>
                            - Bãi biển Mỹ Khê: 5 phút lái xe
                            <br/>
                            - Sân bay: 10 phút lái xe
                            <br/>
                            - Cầu rồng: 15 phút đi bộ
                            <br/>
                            - Dễ dàng đi đến đồi Bà Nà, Hội An
                            <br/>
                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.
                        </p>   
                    </div>
                    <p onClick={_ => {
                        if (readMore){
                            document.getElementById("introPara").classList.remove("detail__head--intro-para");
                            document.getElementById("readMore").innerHTML = "Thu gọn";
                        }
                        else {
                            document.getElementById("introPara").classList.add("detail__head--intro-para");
                            document.getElementById("readMore").innerHTML = "Đọc thêm";
                        }
                        setReadMore(!readMore);
                    }} className="detail__head--intro-bt" id="readMore" >Đọc thêm </p>
                </div>
                
            </section>
    );
}

export default DetailHead;
