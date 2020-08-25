import React, { Component, useEffect } from "react";
import ListOptions from "./ListOptions";
import Showrooms from "./Showrooms";
import ChangePass from "./ChangePass";
import { ToastContainer, toast } from "react-toastify";
import $ from "jquery";

import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Button from "@material-ui/core/Button";

const config = require("../../config/default.json");

class InforUser extends Component {
  constructor(props) {
    super(props);
    this.state = {
      option: "ListOption1",
      user: "",
      regHost: false,
      open: false,
    };
    this.setOption = this.setOption.bind(this);
  }

  handleClickOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };
  handleOk = () => {
    this.handleRegHostClick();
    this.setState({ open: false });
  };

  componentWillMount() {
    let inforUser = this;
    $.ajax({
      url: `${config.url}/user/profile`,
      type: "post",
      xhrFields: {
        withCredentials: true,
      },
      success: function (val) {
        inforUser.setState({ user: val });
        const btn = document.getElementById("btnRegHost");
        if (val.upHost != 0) {
          btn.disabled = true;
          btn.style.color = "gray";
          btn.style.backgroundColor = "white";
          btn.style.cursor = "not-allowed";
          btn.innerHTML = val.upHost == 1 ? "Đã gửi yêu cầu" : "Chủ nhà";
        }
      },
    })
      .fail(function () {
      });
  }
  handleRegHostClick = () => {
    this.setState({ regHost: true });
    $.ajax({
      url: `${config.url}/user/registerhost`,
      type: "post",
      xhrFields: {
        withCredentials: true,
      },
      success: function (val) {
        toast("Đã gửi yêu cầu!");
      },
    })
      .fail(function () {
        console.log("false");
      });
  };

  setOption(newOption) {
    this.setState({ option: newOption });
  }

  componentWillReceiveProps(newProps) {
    if (newProps != this.props) {
      this.setState({ ...this.state, user: newProps.user });
    }
  }

  render() {
    const bodyShowroom = this.state.option === "ListOption1"
      ? <Showrooms user={this.state.user} onClick={this.props.onClick} />
      : <ChangePass />;
    const info = this.state.option === "ListOption1"
      ? {
        name: "Thông tin tài khoản",
        info: "Cá nhân hóa tài khoản bằng việc cập nhật thông tin của bạn",
      }
      : {
        name: "Thay đổi mật khẩu",
        info: "Đổi mật khẩu ít nhất 6 tháng 1 lần để bảo vệ tài khoản của bạn",
      };
    return (
      <div className="Box" style={{ backgroundColor: "#F8F8F8" }}>
        <div className="row">
          <ToastContainer />
          <div className="col-3-of-4">
            <div className="BoxStart">
              <div className="BoxStart__img">
                <img
                  className="BoxStart__img--img"
                  src={this.state.user.avatar?this.state.user.avatar:'https://cdn.luxstay.com/users_avatar_default/default-avatar.png'}
                  alt=""
                />
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
            {
              this.state.user?<button
              id="btnRegHost"
              type=""
              className="BoxStart__host"
              onClick={this.handleClickOpen}
            >
              Trở thành chủ nhà
            </button>:null
            }
            
            <Dialog
              fullWidth={true}
              maxWidth="md"
              open={this.state.open}
              onClose={this.handleClose}
              aria-labelledby="draggable-dialog-title"
            >
              <DialogTitle
                style={{ cursor: "move" }}
                id="draggable-dialog-title"
              >
                Xác nhận đăng ký trở thành chủ nhà
              </DialogTitle>
              <DialogContent>
                <DialogContentText>
                  Đăng ký trở thành chủ nhà đồng nghĩa với việc bạn chấp nhận
                  mọi điều khoản và điều kiện sử dụng dịch vụ của BookStay.
                  <br />
                  Bạn có thật sự muốn đăng ký?
                </DialogContentText>
              </DialogContent>
              <DialogActions>
                <Button autoFocus onClick={this.handleClose} color="primary">
                  Cancel
                </Button>
                <Button onClick={this.handleOk} color="primary">
                  Register
                </Button>
              </DialogActions>
            </Dialog>
          </div>
        </div>
        <div className="row" style={{ marginTop: "-4rem" }}>
          <div className="col-1-of-3">
            <ListOptions onClick={this.setOption} />
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
