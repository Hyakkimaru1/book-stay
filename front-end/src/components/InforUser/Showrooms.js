import React, { Component } from 'react';
import moment from 'moment';
import { toast } from 'react-toastify';
import $ from 'jquery';
const config = require('../../config/default.json');

class Showrooms extends Component {
    constructor(props){
        super(props);
        this.state = {
            user: this.props.user,
        }
    }

    componentWillReceiveProps(newProps,newState){
        this.setState({user:newProps.user});
    }

    handleOnClick(){
        let userUpdate = this.state.user;
        if (userUpdate.ngaysinh!==null){
            userUpdate.ngaysinh = moment(userUpdate.ngay).format('YYYY-MM-DD');
        }
        else {
            delete userUpdate.ngaysinh;
        }
        if (document.getElementById('male').checked===true){
            userUpdate.gioitinh=1;
        }
        else if (document.getElementById('female').checked===true){
            userUpdate.gioitinh=2;
        }
        else if (document.getElementById('another').checked===true){
            userUpdate.gioitinh=3;
        }
        console.log(userUpdate);
        $.ajax({
            url: `${config.url}/user/profile/update`,
            type: 'post',
            data:userUpdate,
            xhrFields: {
                withCredentials: true
            },
            success: function( val ) {
                toast.success("Cập nhật thành công");
            }
        })
        .fail(function() {
            toast.error("Cập nhật thất bại");
        });
    }

    render() {
        console.log()
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
                <div className="Showroom__info">
                    <label for="inputName" className="Showroom__info--label">Tên</label>
                    <input value={this.state.user.ten}  onChange={
                        (event)=>{
                            const value = event.target.value;
                            this.setState(
                            prevState => ({
                                user: {
                                    ...prevState.user,
                                    ten: value
                            }
                    }))}}  type="text" id="inputName" className="Showroom__info--input" required></input>
                    
                    <label for="inputEmail" className="Showroom__info--label">Email</label>
                    <input value={this.state.user.email} readOnly="true" id="inputEmail" type="email" className="Showroom__info--input Showroom__info--email"></input>
                   
                    <label for="inputPhone" className="Showroom__info--label">Số điện thoại</label>
                    <input type="number" min="0" id="inputPhone" onChange={
                        (event)=>{
                            const value = event.target.value;
                            this.setState(
                            prevState => ({
                                user: {
                                    ...prevState.user,
                                    sdt: value
                            }
                    }))}} value={this.state.user.sdt}  className="Showroom__info--input" required></input>
                    
                    <label for="inputAddress" className="Showroom__info--label">Địa chỉ</label>
                    <input type="text" id="inputAddress" onChange={
                        (event)=>{
                            const value = event.target.value;
                            this.setState(
                            prevState => ({
                                user: {
                                    ...prevState.user,
                                    diachi: value
                            }
                    }))}} value={this.state.user.diachi}  className="Showroom__info--input"></input>
                    
                    <label for="inputBirthday" className="Showroom__info--label">Ngày sinh</label>
                    <input  type="date" id="inputBirthday" onChange={(e)=>this.setState({user:{ngaysinh:e.target.value}})} value={moment(this.state.user.ngaysinh).format('YYYY-MM-DD')}  className="Showroom__info--input "></input>
                    <label for="inputSex" className="Showroom__info--label">Giới tính</label>
                    <div className="form">
                        <div class="form__radio-group">
                            <input type="radio" defaultChecked={this.state.user.gioitinh===1?'checked':null} class="form__radio-input" id="male" name="gender"/>
                            <label for="male" class="form__radio-label">
                                <span class="form__radio-button"></span>
                                Nam
                            </label>
                        </div>
                        <div class="form__radio-group">
                            <input type="radio" defaultChecked={this.state.user.gioitinh===2?'checked':null} class="form__radio-input" id="female" name="gender"/>
                            <label for="female" class="form__radio-label">
                                <span class="form__radio-button"></span>   
                                Nữ
                            </label>
                        </div>
                        <div class="form__radio-group">
                            <input type="radio" defaultChecked={this.state.user.gioitinh===3?'checked':null} class="form__radio-input" id="another" name="gender"/>
                            <label for="another" class="form__radio-label">
                                <span class="form__radio-button"></span>   
                                Khác
                            </label>
                        </div>
                    </div>
                    
                    <label for="inputSelf" className="Showroom__info--label">Giới thiệu bản thân</label>
                    <textarea onChange={
                        (event)=>{
                            const value = event.target.value;
                            this.setState(
                            prevState => ({
                                user: {
                                    ...prevState.user,
                                    gioithieu: value
                            }
                    }))}} id="inputSelf" value={this.state.user.gioithieu} className="Showroom__info--input"></textarea>
                    <div>
                    <button onClick={this.handleOnClick.bind(this)} type=""  className="bt__default" style={{marginTop:'4rem'}}>Cập nhật</button>    
                    </div>
                </div>
            </div>
        );
    }
}

export default Showrooms;

