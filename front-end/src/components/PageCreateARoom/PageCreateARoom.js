import React, { Component } from 'react';
import NameRoom from './NameRoom';
import MoreInfRoom from './MoreInfRoom';
import OptionBar from './OptionBar';
import PriceCal from './PriceCal';
import $ from 'jquery';
import Previews from './Previews';
import { ToastContainer, toast } from 'react-toastify';

import 'react-toastify/dist/ReactToastify.css';
import CheckAgain from './CheckAgain';

const config = require('../../config/default.json');
class PageCreateARoom extends Component {
    constructor(props){
        super(props);
        this.state=this.props.data?this.props.data:{
            option: "form_create_room_1",
            prev:"",
            ten:"",
            diaChi:"",
            dienTich:"",
            soPhong:"",
            soGiuong:"",
            soKhachToiDa:"",
            danhSachTienNghi:[],
            tiennghi:[],
            hinhAnh: [],
            giaNgayThuong:"",
            giaNgayCuoiTuan:"",
            giaNgayLe:"",
            giaThang:"",
            checkedMorePrice:false,
            gioiThieu:"",
            luuY:"",
            thoiGianNhan:'12:00',
            thoiGianTra:'12:00',
            checkInfFill:'',
            removeInfFill:'',
            isCheckAgain: false,
        }
        this.chooseOption = this.chooseOption.bind(this);
        this.nextOption = this.nextOption.bind(this);
        this.onChange = this.onChange.bind(this);
        this.onChangeCheckBox = this.onChangeCheckBox.bind(this);
        this.upDate = this.upDate.bind(this);
        this.checkNameRoomFill = this.checkNameRoomFill.bind(this);
        this.checkMoreInfFill = this.checkMoreInfFill.bind(this);
        this.checkImgsFill = this.checkImgsFill.bind(this);
        this.checkPriceFill = this.checkPriceFill.bind(this);
    }

    componentDidMount(){
        $.get(`${config.url}/room/tiennghi`,val=>{
            this.setState({danhSachTienNghi:val});
            val.map(valTemp => this.state.tiennghi.push(false));
        });
    }

    async componentWillReceiveProps(newProps)
    {
        if (newProps.data) {
            let tiennghicuaphong;
            await $.get(`${config.url}/room/tiennghi/${this.props.id}`,val=>{
                tiennghicuaphong=val;
            });
            $.get(`${config.url}/room/tiennghi`,val=>{
                this.setState({danhSachTienNghi:val});
                val.map(valTemp => tiennghicuaphong.find(element => element.tenTienNghi === valTemp.tenTienNghi )?this.state.tiennghi.push(true):this.state.tiennghi.push(false));
            });
            
            this.setState(newProps.data);
        }
    }

    chooseOption(newOption){
        this.setState({option:newOption});
    }

    onChange(newData){
        this.setState(newData);
    }

    onChangeCheckBox(newChangeChecked){
        let newListTienNghi = this.state.tiennghi;
        newListTienNghi[newChangeChecked] = !newListTienNghi[newChangeChecked];
        this.setState({tiennghi:newListTienNghi});        
    }

    upDate(newFile){
        this.setState({hinhAnh:newFile}); 
    }

    checkNameRoomFill(){
        if (this.state.ten.trim()===''){
            return false;
        }
        if (this.state.diaChi.trim()===''){
            return false;
        }
        return true;
    }

    checkMoreInfFill(){
        if (this.state.dienTich===''){
            return false;
        }
        if (this.state.soPhong===''){
            return false;
        }
        if (this.state.soGiuong===''){
            return false;
        }
        if (this.state.soKhachToiDa===''){
            return false;
        }
        if (this.state.gioiThieu.trim()===''){
            return false;
        }
        if (this.state.luuY.trim()===''){
            return false;
        }

        //Tien nghi . map != false all
        //Function check tiennghi 
        if (this.state.tiennghi.length===0){
            return false;
        }
        
        if (this.state.dienTich<1 || this.state.soPhong<1||this.state.soGiuong<1||this.state.soKhachToiDa<1)
        {
            toast.error('Các thông số phải lớn hơn 0');
            return false;
        }
        return true;
    }

    checkImgsFill(){
        if (this.state.hinhAnh.length===0){
            return false;
        }
        return true;
    }

    checkPriceFill(){
        
        if (this.state.giaNgayThuong==='')
        {
            return false;
        }
        if (this.state.giaNgayCuoiTuan===''){
            return false;
        }
        if (this.state.giaNgayCuoiTuan<1000 || this.state.giaNgayThuong<1000)
        {
            toast.error('Giá phải lớn hơn bằng 1000');
            return false;
        }
        else if (this.state.checkedMorePrice){
            if (this.state.giaNgayLe<1000 || this.state.giaThang<1)
            {
                toast.error('Giá phải lớn hơn bằng 1000 và % tháng phải lơn hơn 0');
                return false;
            }
           
        }
        return true;
    }

    updateInfFill(){
        this.setState({checkInfFill:'',removeInfFill:''});
    }

    nextOption(){
        if (this.state.option==="form_create_room_1")
        {
            if (this.checkNameRoomFill()){
                this.setState({checkInfFill:'navCreate_fill_1'});
                this.setState({removeInfFill:''});
            }
            else {
                this.setState({checkInfFill:''});
                this.setState({removeInfFill:'navCreate_fill_1'});
            }
            this.setState({option:"form_create_room_2",prev:"form_create_room_1"});
        }
        else if (this.state.option==="form_create_room_2")
        {
            if (this.checkMoreInfFill()){
                this.setState({checkInfFill:'navCreate_fill_2'});
                this.setState({removeInfFill:''});
            }
            else {
                this.setState({checkInfFill:''});
                this.setState({removeInfFill:'navCreate_fill_2'});
            }
            this.setState({option:"form_create_room_3",prev:"form_create_room_2"});
        }
        else if (this.state.option==="form_create_room_3")
        {
            if (this.checkImgsFill()){
                this.setState({checkInfFill:'navCreate_fill_3'});
                this.setState({removeInfFill:''});
            }
            else {
                this.setState({checkInfFill:''});
                this.setState({removeInfFill:'navCreate_fill_3'});
            }
            this.setState({option:"form_create_room_4",prev:"form_create_room_3"});
        }
        else {
            if (this.checkPriceFill()){
                this.setState({checkInfFill:'navCreate_fill_4'});
                this.setState({removeInfFill:''});
            }
            else {
                this.setState({checkInfFill:''});
                this.setState({removeInfFill:'navCreate_fill_4'});
            }

            let check = false;
            
            if (this.checkImgsFill() && this.checkNameRoomFill() && this.checkMoreInfFill() && this.checkPriceFill()){
                check = true;
            } 

            if (check){
                this.setState({option:"form_create_room_5",prev:"form_create_room_4"});
            }
            else {
                toast.error('Vui lòng điền đủ thông tin');
                document.getElementById('form_create_room_5').classList.add("navCreate__info--notAllowed");
            }
        }
       
    }

    sendData(){
        if (this.state.isCheckAgain){
            let dataSend = {...this.state};
            //console.log(dataSend);
            delete dataSend.hinhAnh;
            delete dataSend.danhSachTienNghi;
            delete dataSend.option;
            delete dataSend.prev;
            delete dataSend.checkInfFill;
            delete dataSend.removeInfFill;
            delete dataSend.isCheckAgain;
            if (this.state.checkedMorePrice===false){
                delete dataSend.giaNgayLe;
                delete dataSend.giaThang;
                
            }
            else {
                dataSend.giaThang = '-'+dataSend.giaThang;
            }
            delete dataSend.checkedMorePrice;
            dataSend.tiennghicuaphong = [];
            dataSend.tiennghi.map((val,i)=>{
                if (val===true){
                  return dataSend.tiennghicuaphong.push(i+1);
                }
                return null;
            });
            delete dataSend.tiennghi;
            //check update or create a new room
            if (this.props.id){
                $.ajax({
                    url:`${config.url}/host/roomowner/${this.props.id}/update`,
                    type:'post',
                    data:dataSend,
                    xhrFields: {
                        withCredentials: true
                    }, success: ()=>{
                        if (typeof this.state.hinhAnh !== 'string'){
                            const data = new FormData();
                            for(var temp = 0; temp<this.state.hinhAnh.length; temp++) {
                                data.append('file', this.state.hinhAnh[temp])
                            }
                            $.ajax({ 
                                url: `${config.url}/host/upload/${this.props.id}`, 
                                type: 'post', 
                                data: data, 
                                contentType: false, 
                                processData: false, 
                                success: function(response){ 
                                    if(response === "oke"){
                                        toast.success('Cập nhật thành công');
                                    } 
                                    else{ 
                                        toast.error('Cập nhật thất bại');
                                    } 
                                },
                                error: function() {
                                    toast.error('Cập nhật ảnh thất bại');
                                }
                            });
                        } 
                }});
            }
            else {
                $.ajax({
                    url:`${config.url}/host/upload`,
                    type:'post',
                    data:dataSend,
                    xhrFields: {
                        withCredentials: true
                    }, success: (idRoom)=>{
                        if (idRoom.id>0){
                            const data = new FormData()
                            for(var temp = 0; temp<this.state.hinhAnh.length; temp++) {
                                data.append('file', this.state.hinhAnh[temp])
                            }
                            $.ajax({ 
                                url: `${config.url}/host/upload/${idRoom.id}`, 
                                type: 'post', 
                                data: data, 
                                contentType: false, 
                                processData: false, 
                                success: function(response){ 
                                    if(response === "oke"){ 
                                        toast.success('Đăng tải thành công') ;
                                    } 
                                    else{ 
                                        toast.error('Đăng tải thất bại');
                                    } 
                                },error: function() {
                                    toast.error('Đăng tải thất bại');
                                } 
                            });
                        }
                        else {
                            toast.error('Đăng tải thất bại');
                        }
                }});
            } 
        }
    }
    render() {
        let bodyPage;
        if (this.state.option==="form_create_room_1")
            bodyPage =  <NameRoom onChange={this.onChange} ten={this.state.ten} diaChi={this.state.diaChi}/>;
        else if (this.state.option==="form_create_room_2")
            bodyPage = <MoreInfRoom onChange={this.onChange}
            dienTich={this.state.dienTich}
            soPhong={this.state.soPhong}
            soGiuong={this.state.soGiuong}
            soKhachToiDa={this.state.soKhachToiDa}
            danhSachTienNghi={this.state.danhSachTienNghi}
            tienNghi={this.state.tiennghi}
            gioiThieu={this.state.gioiThieu}
            luuY={this.state.luuY}
            onChangeCheckBox={this.onChangeCheckBox}/>;
        else if (this.state.option==="form_create_room_3")
            bodyPage = <Previews hinhAnh={this.state.hinhAnh} upDate={this.upDate}/>
        else if (this.state.option==="form_create_room_4")
            bodyPage = <PriceCal 
            giaNgayThuong={this.state.giaNgayThuong} 
            giaNgayCuoiTuan={this.state.giaNgayCuoiTuan}  
            giaNgayLe={this.state.giaNgayLe} 
            giaThang={this.state.giaThang}
            onChange={this.onChange}
            thoiGianNhan={this.state.thoiGianNhan}
            thoiGianTra={this.state.thoiGianTra}
            checkedMorePrice={this.state.checkedMorePrice}/>;
            else bodyPage = <CheckAgain 
            ten={this.state.ten} 
            diaChi={this.state.diaChi} 
            giaNgayThuong={this.state.giaNgayThuong} 
            giaNgayCuoiTuan={this.state.giaNgayCuoiTuan}
            isCheckAgain={this.state.isCheckAgain}
            onChange={this.onChange}/>;
        return (
            <div name="form_create_room">
                <OptionBar checkNameRoomFill={this.checkNameRoomFill} 
                 checkMoreInfFill={this.checkMoreInfFill}
                 checkImgsFill={this.checkImgsFill}
                 checkPriceFill={this.checkPriceFill} 
                 removeInfFill={this.state.removeInfFill} 
                 checkInfFill={this.state.checkInfFill} 
                 prev={this.state.prev} 
                 onClick={this.chooseOption} 
                 current={this.state.option}
                 updateInfFill={this.updateInfFill.bind(this)}/>
                <ToastContainer/>
                <div className="container">
                    {bodyPage}
                    <div className="CreateRoom__bt">
                        {
                            this.state.option!=="form_create_room_5"?
                            <button style={{marginBottom:'5rem'}} className="bt__default" onClick={this.nextOption}>Tiếp theo</button>
                            :<button  style={ this.state.isCheckAgain === false ? 
                                {marginBottom:'5rem',cursor:'not-allowed',backgroundColor:'#bdbdbd',borderColor:'#bdbdbd'}
                                : {marginBottom:'5rem'}} className="bt__default" onClick={this.sendData.bind(this)}>Gửi thông tin</button>
                        }             
                    </div>
                       
                </div>
                
            </div>
        );
    }
}

export default PageCreateARoom;
