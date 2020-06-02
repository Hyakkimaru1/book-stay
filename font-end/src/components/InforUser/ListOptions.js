import React, { Component } from 'react';

class ListOptions extends Component {
    constructor(props){
        super(props);
        this.state = {
            option: "ListOption1"
        }
        this.handleOnCLick = this.handleOnCLick.bind(this);
    }
    handleOnCLick(e){
        this.props.onClick(e.target.id);
        this.setState({option:e.target.id})
        document.getElementById(this.state.option).classList.remove("ListOptions__active");
        document.getElementById(e.target.id).classList.add("ListOptions__active");
    }
    render() {
        return (
            <div>
                <ul className="ListOptions">
                    <li onClick={this.handleOnCLick} id="ListOption1" className="ListOptions__item ListOptions__active">Thông tin tài khoản</li>
                    <li onClick={this.handleOnCLick} id="ListOption2" className="ListOptions__item">Thay đổi mật khẩu</li>
                </ul>
            </div>
        );
    }
}

export default ListOptions;
