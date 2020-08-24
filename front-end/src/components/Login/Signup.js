import React, { useContext } from "react";
import { UserContext } from "../../UserContext";
import { ToastContainer, toast } from "react-toastify";
import Cookies from "js-cookie";
import $ from "jquery";
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";
import Avatar from "../../icons/Avatar.svg";
import Bg from "../../icons/bg.svg";
import Wave from "../../icons/wave.png";

const config = require("../../config/default.json");

const Signup = () => {
  const [state, dispatch] = useContext(UserContext);
  const location = useLocation();

  function validateEmail(email) {
    const re =
      /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
  }
  function validatePassword(pw) {
    return pw.length > 1;

    //   /[A-Z]/.test(pw) &&
    //   /[a-z]/.test(pw) &&
    //   /[0-9]/.test(pw) &&
    //   /[^A-Za-z0-9]/.test(pw) &&
  }

  const handleClick = () => {
    const email = document.getElementById("username").value;
    const pass = document.getElementById("password").value;
    const repass = document.getElementById("repassword").value;
    if (email !== "" && pass.length !== "") {
      if (!validateEmail(email)) {
        toast.error("Email không hợp lệ!");
      } else if (!validatePassword(pass)) {
        toast.error("Mật khẩu chứa ít nhất 2 ký tự!");
      } else if (pass !== repass) {
        toast.error("Mật khẩu không khớp!");
      } else {
        $.post(`${config.url}/user/signup`, { email, pass }, (val) => {
          dispatch({
            id: val.id,
            type: "login",
          });
          Cookies.set("token", val.token, { expires: 10 });
          toast.success("Đăng ký thành công!");
        })
          .fail(function () {
            toast.error("Bạn đã có tài khoản đăng ký với email này!");
          });
      }
    } else {
      toast.error("Tên tài khoản hoặc mật khẩu không hợp lệ!");
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
              <div className="input-div pass">
                <div className="i">
                  <i style={{ fontSize: "1.6rem" }} className="fas fa-lock"></i>
                </div>
                <div className="div">
                  <input
                    id="repassword"
                    placeholder="Nhập lại mật khẩu"
                    type="password"
                    className="input Login__input"
                  />
                  <label for="password" className="Login__label">
                    Mật khẩu
                  </label>
                </div>
              </div>

              <p onClick={handleClick} className="Login__btn">Đăng nhập</p>
              <p className="Login__createAcc">
                Bạn đã có tài khoản? <strong
                  className="Login__createAcc--link"
                >
                  Đăng nhập ngay
                </strong>
              </p>
            </form>
          </div>
        </div>
      </div>
      // <div className="login" >
      //     <ToastContainer />
      //     <label style={{ display: 'block' }} for="username">username</label>
      //     <input id="username" style={{ display: 'block' }} type="text" />
      //     <label style={{ display: 'block' }} for="password">password</label>
      //     <input id="password" style={{ display: 'block' }} type="password" />
      //     <button onClick={(handleClick)} style={{ display: 'block' }} type="">Sign up</button>
      // </div>
    )
    : <Redirect to={location.state ? location.state.from : "/"}></Redirect>;
};

export default Signup;
