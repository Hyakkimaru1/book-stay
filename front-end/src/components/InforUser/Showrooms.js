import React, { Component } from 'react';
import moment from 'moment';
import { toast } from 'react-toastify';
import { UserContext } from '../../UserContext';
import $ from 'jquery';
const config = require('../../config/default.json');

var openFile = function(file) {
    var input = file.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var output = document.getElementById('avtuser');
      output.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
};

class Showrooms extends Component {
    constructor(props){
        super(props);
        this.state = {
            user: this.props.user,
        }
        
        this.handleOnClick = this.handleOnClick.bind(this);
    }
    static context = UserContext;
    componentWillReceiveProps(newProps,newState){
        if (newProps!=this.props){
            this.setState({user:newProps.user});
            return true;
        }
        else return false;
        
    }

    async handleOnClick(){
        let userUpdate = {...this.state.user};
        delete userUpdate.admin;
        delete userUpdate.type;
        delete userUpdate.user;
        delete userUpdate.avt;

        if (document.getElementById('inputBirthday').value !== null){
            userUpdate.ngaysinh = moment(document.getElementById('inputBirthday').value).format('YYYY-MM-DD');
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
        const instance = this;
        await $.ajax({
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
        if (document.getElementById('avtchanging').value!==''){
            var formData = new FormData();
            formData.append('file',document.getElementById('avtchanging').files[0]);
            userUpdate.formData = formData;
            await $.ajax({
                url: `${config.url}/user/profile/updateavt`,
                type: 'post',
                data:formData,
                contentType: false, 
                processData: false,
                xhrFields: {
                    withCredentials: true
                },
                success: function( val ) {
                }
            })
            .fail(function() {
                toast.error("Cập nhật thất ảnh đại diện thất bại");
            });
        }
        instance.props.onClick();
    }

    

    render() {
        console.log(this.state.user);
        return (
            <div className="Showroom">
                 <div className="Showroom__avt">
                    <div className="Showroom__img">
                        <img className="Showroom__img--img" src={this.state.user.avatar?this.state.user.avatar:'https://cdn.luxstay.com/users_avatar_default/default-avatar.png'} id="avtuser" alt=""/>
                    </div>
                    <div className="Showroom__avt--bt">
                        <button onClick={()=>{document.getElementById('avtchanging').click()}} type="" style={{marginLeft:'2rem'}} className="bt__default">
                            Đổi ảnh đại diện
                        </button>
                        <input style={{display:'none'}} type="file" onChange={(event)=>{
                            var input = event.target;

                            var reader = new FileReader();
                            reader.onload = function(){
                              var dataURL = reader.result;
                              var output = document.getElementById('avtuser');
                              output.src = dataURL;
                            };
                            reader.readAsDataURL(input.files[0]);
                        }} accept="image/x-png,image/gif,image/jpeg"  id="avtchanging">
                        </input>
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
                    <input  type="date" id="inputBirthday" onChange={(event)=>{
                            const value = event.target.value;
                            this.setState(
                            prevState => ({
                                user: {
                                    ...prevState.user,
                                    ngaysinh:value
                            }
                    }))}} value={moment(this.state.user.ngaysinh).format('YYYY-MM-DD')}  className="Showroom__info--input "></input>
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
                    <button onClick={this.handleOnClick} type=""  className="bt__default" style={{marginTop:'4rem'}}>Cập nhật</button>    
                    </div>
                </div>
            </div>
        );
    }
}

export default Showrooms;

