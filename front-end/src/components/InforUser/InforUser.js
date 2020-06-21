import React, { Component } from 'react';
import ListOptions from './ListOptions';
import Showrooms from './Showrooms';
import ChangePass from './ChangePass';
class InforUser extends Component {
    constructor(props){
        super(props);
        this.state={
            option: "ListOption1",
            userName: "Huynh Duy"
        }
        this.setOption = this.setOption.bind(this);
    }

    setOption(newOption){
        this.setState({option:newOption});
    }

    render() {
        const bodyShowroom = this.state.option==="ListOption1"?<Showrooms/>:<ChangePass/>;
        const info = this.state.option==="ListOption1"?
        {name:"Thông tin tài khoản",info:"Cá nhân hóa tài khoản bằng việc cập nhật thông tin của bạn"}
        :{name:"Thay đổi mật khẩu",info:"Đổi mật khẩu ít nhất 6 tháng 1 lần để bảo vệ tài khoản của bạn"};
        return (
            <div style={{backgroundColor:'#F8F8F8'}}>
                <div className="row">
                <div className="col-3-of-4">
                    <div className="BoxStart">
                        <div className="BoxStart__img">
                            <img className="BoxStart__img--img" src="https://cdn.luxstay.com/home/slider/slider_154_1589798803.jpg" alt=""/>
                        </div>
                        <div className="BoxStart__name">
                            <div className="BoxStart__name--name">
                                {this.state.userName}
                            </div>
                            <div className="BoxStart__name--inf">
                                &nbsp;&nbsp;&nbsp; {info.name}
                            </div>
                            <div className="BoxStart__name--comment">
                                <p>{info.info}</p>
                            </div>
                        </div>
                    </div>
                </div>
                    <div className="col-1-of-4">
                        <button type="" className="BoxStart__host">Trở thành chủ nhà</button>
                    </div>
                </div>
                <div className="row" style={{marginTop:'-4rem'}}>
                    <div className="col-1-of-3">
                        <ListOptions onClick={this.setOption}/>
                    </div>
                    <div className="col-2-of-3">
                        {bodyShowroom}
                    </div>
                </div>
            </div>
            
        );
    }
}

export default InforUser;
