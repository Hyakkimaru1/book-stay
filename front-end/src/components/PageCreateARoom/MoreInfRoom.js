import React, { Component } from 'react';
import CKEditor from 'ckeditor4-react';
class MoreInfRoom extends Component {
    handleChangeAcreage(e){
        this.props.onChange({dienTich:e.target.value})
    }
    handleChangeRooms(e){
        this.props.onChange({soPhong:e.target.value})
    }
    handleChangeBed(e){
        this.props.onChange({soGiuong:e.target.value})
    }
    handleChangeGuest(e){
        this.props.onChange({soKhachToiDa:e.target.value})
    }
    handleChangeCheckBox(e){
        let splitId = e.target.id.split("_");
        this.props.onChangeCheckBox(splitId[1]);
    }
    onKeyPress(event) {
        const keyCode = event.keyCode || event.which;
        const keyValue = String.fromCharCode(keyCode);
         if (/\+|-/.test(keyValue))
           event.preventDefault();
    }
    handleChangeIntro(evt){
        this.props.onChange({gioiThieu:evt.editor.getData()});
    }
    handleChangeNote(evt){
        this.props.onChange({luuY:evt.editor.getData()});
    }
    render() {
        return (
            <div style={{marginTop:'5rem'}}>
            <div className="CreateRoom__title">
                <p className="CreateRoom__title--ele">Chi tiết nơi ở</p>
            </div>
            <div className="CreateRoom">
                
                    
                <label className="CreateRoom__label" for="">Giới thiệu</label>
                <div className="CreateRoom__detail">
                    <CKEditor
                        data={this.props.gioiThieu}
                        onChange={this.handleChangeIntro.bind(this)}/>
                </div>


                <label className="CreateRoom__label" for="">Diện tích</label>
                <div className= "CreateRoom__Info">
                    <p className= "CreateRoom__Info--inf">&nbsp;&nbsp;M2&nbsp;</p>
                    <input className="CreateRoom__Info--input" onKeyPress={this.onKeyPress.bind(this)} min="1" onChange={this.handleChangeAcreage.bind(this)} name="" type="number" value={this.props.dienTich} required></input>
                </div>
                
                <label className="CreateRoom__label" for="">Số phòng</label>
                <input className="CreateRoom__input" onKeyPress={this.onKeyPress.bind(this)} min="1" onChange={this.handleChangeRooms.bind(this)} name="" type="number" value={this.props.soPhong} required></input>

                <label className="CreateRoom__label" for="">Số giường</label>
                <input className="CreateRoom__input" onKeyPress={this.onKeyPress.bind(this)} min="1" onChange={this.handleChangeBed.bind(this)} name="" type="number" value={this.props.soGiuong} required></input>

                <label className="CreateRoom__label" for="">Số khách tối đa</label>
                <input className="CreateRoom__input" onKeyPress={this.onKeyPress.bind(this)} min="1" onChange={this.handleChangeGuest.bind(this)} name="" type="number" value={this.props.soKhachToiDa} required></input>
                
                <label className="CreateRoom__label" for="">Lưu ý</label>
                <div className="CreateRoom__detail">
                    <CKEditor
                        data={this.props.luuY}
                        onChange={this.handleChangeNote.bind(this)}/>
                </div>

                <div className="CreateRoom__label" for="">Danh sách các tiện nghi</div>
                {
                    this.props.danhSachTienNghi.map((val,index) =>
                        <div className="CreateRoom__checkbox">
                            <input className="CreateRoom__checkbox--input" onChange={this.handleChangeCheckBox.bind(this)} name="" id={"checkboxTiennghi_"+index} type="checkbox" defaultChecked={this.props.tienNghi[index]}></input>
                            <label className="CreateRoom__checkbox--label" for={"checkboxTiennghi_"+index}>{val.tenTienNghi}</label>
                        </div>
                    )
                }
                
            </div>
        </div>
        );
    }
}

export default MoreInfRoom;

