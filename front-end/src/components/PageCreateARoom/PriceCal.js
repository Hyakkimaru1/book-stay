import React, { Component } from 'react';

class PriceCal extends Component {
    constructor(props){
        super(props);
        this.state={
            checked:this.props.checkedMorePrice,
        }
        this.handleChange = this.handleChange.bind(this);
    }
    onKeyPress(event) {
        const keyCode = event.keyCode || event.which;
        const keyValue = String.fromCharCode(keyCode);
         if (/\+|-/.test(keyValue))
           event.preventDefault();
    }
    handleChange(){
        this.props.onChange({checkedMorePrice:!this.state.checked});
        this.setState({checked:!this.state.checked});
    }

    handleChangeFirst(e){
        this.props.onChange({giaNgayThuong:e.target.value});
    }

    handleChangeSec(e){
        this.props.onChange({giaNgayCuoiTuan:e.target.value});
    }

    handleChangeThird(e){
        this.props.onChange({giaNgayLe:e.target.value});
    }

    handleChangeFour(e){
        this.props.onChange({giaThang:e.target.value});
    }

    handleChangeTimeCheck(e){
        this.props.onChange({thoiGianNhan:e.target.value});
        console.log(e.target.value);
    }

    handleChangeTimeOut(e){
        this.props.onChange({thoiGianTra:e.target.value});
    }

    render() {
        const moreOption = this.state.checked === true?             
        <div className="CreateRoom">
            
            <label className="CreateRoom__label" for="">&nbsp;&nbsp;&nbsp;&nbsp;Tiền bạn muốn thu mỗi đêm ngày lễ</label>
            <div className= "CreateRoom__Info">
                <p className= "CreateRoom__Info--inf">VNĐ</p>
                <input className="CreateRoom__Info--input" value={this.props.giaNgayLe} name="" id="nameHome" type="number" min="1000" onChange={this.handleChangeThird.bind(this)} onKeyPress={this.onKeyPress.bind(this)} required></input>
            </div>

            <label className="CreateRoom__label" for="">Phần trăm chiết khấu theo tháng</label>
            <div className= "CreateRoom__Info">
                <p className= "CreateRoom__Info--inf">&nbsp;&nbsp;&nbsp;%&nbsp;&nbsp;</p>
                <input className="CreateRoom__Info--input" value={this.props.giaThang} name="" id="nameHome"  type="number" max="100" min="1" onChange={this.handleChangeFour.bind(this)} onKeyPress={this.onKeyPress.bind(this)} required></input>
            </div>
        
        </div>:null;
        return (
            <div style={{marginTop:'5rem'}}>
            <div className="CreateRoom__title">
                <p className="CreateRoom__title--ele">Giá mỗi đêm</p>
            </div>
            <div className="CreateRoom">
                <label className="CreateRoom__label" for="">Thời gian nhận phòng</label>
                <input onChange={this.handleChangeTimeCheck.bind(this)} value={this.props.thoiGianNhan} className="CreateRoom__input" type="time"/>

                <label className="CreateRoom__label" for="">Thời gian trả phòng</label>
                <input onChange={this.handleChangeTimeOut.bind(this)} value={this.props.thoiGianTra} className="CreateRoom__input" type="time"/>

                <label className="CreateRoom__label" for="">Tiền bạn muốn thu mỗi đêm trong tuần </label>
                <div className= "CreateRoom__Info">
                    <p className= "CreateRoom__Info--inf">VNĐ</p>
                    <input className="CreateRoom__Info--input" value={this.props.giaNgayThuong} name="" id="nameHome" type="number" min="1000" onChange={this.handleChangeFirst.bind(this)} onKeyPress={this.onKeyPress.bind(this)} required></input>
                </div>
                <label className="CreateRoom__label" for="">Tiền bạn muốn thu mỗi đêm cuối tuần</label>
                <div className= "CreateRoom__Info" >
                    <p className= "CreateRoom__Info--inf">VNĐ</p>
                    <input className="CreateRoom__Info--input" value={this.props.giaNgayCuoiTuan} name="" id="nameHome" type="number" min="1000" onChange={this.handleChangeSec.bind(this)} onKeyPress={this.onKeyPress.bind(this)} required></input>
                </div>
                <div className="CreateRoom__note" style={{display: 'flex',justifyContent: 'space-evenly'}}>
                    <input className="CreateRoom__checkbox--input" name="" defaultChecked={this.props.checkedMorePrice} onChange={this.handleChange} type="checkbox"></input> Thêm giá các mục về giá
                </div>
                  
            </div>
            {moreOption}
            <div className="CreateRoom__note">
                <div>Bao gồm các loại thuế, phí và hoa hồng</div>
                <div>15,00% Hoa hồng cho Book stay</div> 
            </div>  
        </div>
        );
    }
}

export default PriceCal;

