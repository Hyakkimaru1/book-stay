import React, { Component } from 'react';
import $ from 'jquery';
class Showrooms extends Component {
    render() {
        return (
            <div className="Showroom">
                 <div className="Showroom__avt">
                    <div className="Showroom__img">
                        <img className="Showroom__img--img" src="https://cdn.luxstay.com/home/slider/slider_154_1589798803.jpg" alt=""/>
                    </div>
                    <div className="Showroom__avt--bt">
                        <button type="" style={{marginLeft:'2rem'}} className="bt__default" id="changeAvt">
                            Đổi ảnh đại diện
                        </button>
                    </div>  
                </div>
                <form className="Showroom__info">
                    <label for="inputName" className="Showroom__info--label">Tên</label>
                    <input type="text" id="inputName" className="Showroom__info--input" required></input>
                    
                    <label for="inputSurname" className="Showroom__info--label">Họ và tên đệm</label>
                    <input type="text" id="inputSurname" className="Showroom__info--input" required></input>
                    
                    <label for="inputEmail" className="Showroom__info--label">Email</label>
                    <input value="hyakkiamru@gmail.com" readOnly="true" id="inputEmail" type="email" className="Showroom__info--input Showroom__info--email"></input>
                   
                    <label for="inputPhone" className="Showroom__info--label">Số điện thoại</label>
                    <input type="text" id="inputPhone"  className="Showroom__info--input" required></input>
                    
                    <label for="inputAddress" className="Showroom__info--label">Địa chỉ</label>
                    <input type="text" id="inputAddress"  className="Showroom__info--input"></input>
                    
                    <label for="inputBirthday" className="Showroom__info--label">Ngày sinh</label>
                    <input onClick={()=>{document.getElementById("inputBirthday").focus();}} type="date" id="inputBirthday"  className="Showroom__info--input "></input>
                    <label for="inputSex" className="Showroom__info--label">Giới tính</label>
                    <div className="form">
                        <div class="form__radio-group">
                            <input type="radio" class="form__radio-input" id="male" name="gender"/>
                            <label for="male" class="form__radio-label">
                                <span class="form__radio-button"></span>
                                Nam
                            </label>
                        </div>
                        <div class="form__radio-group">
                            <input type="radio" class="form__radio-input" id="female" name="gender"/>
                            <label for="female" class="form__radio-label">
                                <span class="form__radio-button"></span>   
                                Nữ
                            </label>
                        </div>
                        <div class="form__radio-group">
                            <input type="radio" class="form__radio-input" id="another" name="gender"/>
                            <label for="another" class="form__radio-label">
                                <span class="form__radio-button"></span>   
                                Khác
                            </label>
                        </div>
                    </div>
                    
                    <label for="inputSelf" className="Showroom__info--label">Giới thiệu bản thân</label>
                    <textarea id="inputSelf" className="Showroom__info--input"></textarea>
                    <div>
                    <button type=""  className="bt__default" style={{marginTop:'4rem'}}>Cập nhật</button>    
                    </div>
                    </form>
            </div>
        );
    }
}

export default Showrooms;

