import React, {useState} from 'react';

const StartBox = () => {
    const [userName, setUserName] = useState("Huynh Duy");
    return (
        <div className="row">
            <div className="col-3-of-4">
                <div className="BoxStart">
                    <div className="BoxStart__img">
                        <img className="BoxStart__img--img" src="https://cdn.luxstay.com/home/slider/slider_154_1589798803.jpg" alt=""/>
                    </div>
                    <div className="BoxStart__name">
                        <div className="BoxStart__name--name">
                            {userName}
                        </div>
                        <div className="BoxStart__name--inf">
                            &nbsp;&nbsp;&nbsp; Thông tin tài khoản
                        </div>
                        <div className="BoxStart__name--comment">
                            <p>Cá nhân hóa tài khoản bằng việc cập nhật thông tin của bạn</p>
                        </div>
                    </div>
                </div>
            </div>
            <div className="col-1-of-4">
                   <button type="" className="BoxStart__host">Trở thành chủ nhà</button>
            </div>
        </div>
    );
}

export default StartBox;
