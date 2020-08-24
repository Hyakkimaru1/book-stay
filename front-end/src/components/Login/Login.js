import React, { useContext } from "react";
import { UserContext } from "../../UserContext";
import $ from "jquery";
import { toast } from "react-toastify";
import Cookies from "js-cookie";
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";
import Avatar from "../../icons/Avatar.svg";
import Bg from "../../icons/bg.svg";
import Wave from "../../icons/wave.png";

const config = require("../../config/default.json");

const Login = () => {
  const [state, dispatch] = useContext(UserContext);
  const location = useLocation();
  const history = useHistory();
  const handleClick = () => {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    if (username !== "" && password.length !== "") {
      $.post(`${config.url}/user/login`, { username, password }, (val) => {
        Cookies.set("token", val.token, { expires: 10 });
        dispatch({
          id: val.id,
          avt: val.avt,
          email: val.email,
          ten: val.ten,
          sdt: val.sdt,
          admin: val.admin,
          diachi: val.diachi,
          gioitinh: val.gioitinh,
          gioithieu: val.gioithieu,
          ngaysinh: val.ngaysinh,
          type: "login",
        });
      })
        .fail(function () {
          toast.error("Sai tài khoản hoặc mật khẩu");
        });
    }
  };
  return state.type === "logout"
    ? (
      <div className="Login">
        <img className="Login-wave" src={Wave} alt="" />
        <div className="Login-container" alt="">
          <div className="Login-img">
            <img src={Bg} />
          </div>
          <div className="login-content">
            <form className="Login__form" action="index.html">
              <img src={Avatar} />
              <h2 className="title">Welcome</h2>
              <div className="input-div one">
                <div className="i">
                  <i style={{ fontSize: "1.6rem" }} className="fas fa-user"></i>
                </div>
                <div className="div">
                  <input
                    id="username"
                    placeholder="Tên đăng nhập"
                    type="text"
                    className="input Login__input"
                  />
                  <label for="username" className="Login__label">
                    Tên đăng nhập
                  </label>
                </div>
              </div>
              <div className="input-div pass">
                <div className="i">
                  <i style={{ fontSize: "1.6rem" }} className="fas fa-lock"></i>
                </div>
                <div className="div">
                  <input
                    id="password"
                    placeholder="Mật khẩu"
                    type="password"
                    className="input Login__input"
                  />
                  <label for="password" className="Login__label">
                    Mật khẩu
                  </label>
                </div>
              </div>
              <Link
                to={{ pathname: "/forgotpassword", state: location.state }}
                style={{ textDecoration: "none" }}
              >
                <p className="Login__a">Quên mật khẩu?</p>
              </Link>
              <p onClick={handleClick} className="Login__btn">Đăng nhập</p>
              <p className="Login__createAcc">
                Bạn chưa có tài khoản?
                <Link
                  to={{ pathname: "/signup", state: location.state }}
                  style={{ textDecoration: "none" }}
                >
                  <strong
                    className="Login__createAcc--link"
                  >
                    Đăng ký ngay
                  </strong>
                </Link>
              </p>
            </form>
          </div>
        </div>
      </div>
    )
    : <Redirect to={location.state ? location.state.from : "/"}></Redirect>;
};

export default Login;
