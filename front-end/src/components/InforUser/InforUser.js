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
            user: ""
        }
        this.setOption = this.setOption.bind(this);
    }

    componentWillMount(){
        let inforUser = this;
        $.ajax({
            url: `${config.url}/user/profile`,
            type: 'post',
            xhrFields: {
                withCredentials: true
            },
            success: function( val ) {
                inforUser.setState({user:val});
            }
        })
        .fail(function() {
            console.log('false');
        });
    }

    setOption(newOption){
        this.setState({option:newOption});
    }

    render() {
        const bodyShowroom = this.state.option==="ListOption1"?<Showrooms user={this.state.user} />:<ChangePass/>;
        const info = this.state.option==="ListOption1"?
        {name:"Thông tin tài khoản",info:"Cá nhân hóa tài khoản bằng việc cập nhật thông tin của bạn"}
        :{name:"Thay đổi mật khẩu",info:"Đổi mật khẩu ít nhất 6 tháng 1 lần để bảo vệ tài khoản của bạn"};
        return (
            <div style={{backgroundColor:'#F8F8F8'}}>
                <div className="row">
                <ToastContainer/>
                <div className="col-3-of-4">
                    <div className="BoxStart">
                        <div className="BoxStart__img">
                            <img className="BoxStart__img--img" src={this.state.user.avatar} alt=""/>
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
