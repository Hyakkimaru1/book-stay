import React, { Component } from 'react';
import ListOptions from './ListOptions';
import Showrooms from './Showrooms';
import ChangePass from './ChangePass';
import { ToastContainer } from 'react-toastify';
import $ from 'jquery';
const config = require('../../config/default.json');

class InforUser extends Component {
    constructor(props){
        super(props);
        this.state={
            option: "ListOption1",
            user: props.user
        }
        this.setOption = this.setOption.bind(this);
    }

    setOption(newOption){
        this.setState({option:newOption});
    }

    componentWillReceiveProps(newProps){
        if (newProps!=this.props){
            this.setState({...this.state,user:newProps.user});
        }
    }

    render() {
        const bodyShowroom = this.state.option==="ListOption1"?<Showrooms user={this.state.user} onClick={this.props.onClick} />:<ChangePass/>;
        const info = this.state.option==="ListOption1"?
        {name:"Thông tin tài khoản",info:"Cá nhân hóa tài khoản bằng việc cập nhật thông tin của bạn"}
        :{name:"Thay đổi mật khẩu",info:"Đổi mật khẩu ít nhất 6 tháng 1 lần để bảo vệ tài khoản của bạn"};
        return (
            <div className="Box" style={{backgroundColor:'#F8F8F8'}}>
                <div className="row">
                <div className="col-3-of-4">
                    <div className="BoxStart">
                        <div className="BoxStart__img">
                            <img className="BoxStart__img--img" src={this.state.user.avt} alt=""/>
                        </div>
                        <div className="BoxStart__name">
                            <div className="BoxStart__name--name">
                                {this.state.user.ten}
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
