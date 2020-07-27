import React from 'react';
import { useHistory } from 'react-router-dom';

const PagePayment = (props) => {
    const history = useHistory();
    return (
        <div>
            <div className="PageBook__head">
                Thanh toán
            </div>
            <div className="PageBook__text">Vui lòng lựa chọn phương thức thanh toán</div>
            <div className="PageBook__payment">
            <div className="form__radio-group">
                <input type="radio" defaultChecked="true" className="form__radio-input" id="momo" name="gender"/>
                <label for="momo" className="form__radio-label">
                    <span style={{top: '.2rem'}} className="form__radio-button"></span>
                    <span style={{color:'#212529'}}>MOMO</span>
                    <br/>
                    <span style={{fontSize:'1.2rem',marginLeft:'5rem',color:'#999'}}>Thanh toán bằng ví điện tử momo</span>  
                </label>
            </div>
            <div>
                <img src="https://cdn.luxstay.com/images/logos/payments/momo.png"></img>
            </div>
            </div>
            <button onClick= {()=> history.push("/payment/momo")} style={{marginTop:'4rem'}} className="bt__default">Thanh Toán Ngay</button>
        </div>
    );
}

export default PagePayment;
