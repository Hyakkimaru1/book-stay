/* eslint-disable jsx-a11y/alt-text */
import React, { useState, useReducer, useEffect } from "react";
import "./App.css";
import "./style.css";
import PageRoom from "./components/PageRoom/PageRoom";
import PageCreateARoom from "./components/PageCreateARoom/PageCreateARoom";
//import InforUser from './components/InforUser/InforUser';
import NavBar from "./components/NavBar/NavBar";
import NavItem from "./components/NavBar/NavItem";
import DropdownMenu from "./components/NavBar/DropdownMenu";
import User from "./components/User/User";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
} from "react-router-dom";
import { ReactComponent as CaretIcon } from "../src/icons/caret.svg";
import { UserContext } from "./UserContext";
import { UserReducer } from "./UserReducer";
import $, { type } from "jquery";
import Cookies from "js-cookie";

import Login from "./components/Login/Login";
import ForgotPassword from "./components/Login/ForgotPassword";
import ProctectUser from "./ProctectUser";
import ProctectAdmin from "./ProctectAdmin";
import Signup from "./components/Login/Signup";
import ProtectHostRegister from "./ProctectHostRegister";
import ProtectHostFixRoom from "./ProtectHostFixRoom";
import ProtectBooked from "./ProtectBooked";
import PageBookRoom from "./components/PageBookRoom/PageBookRoom";
import MomoQR from "./components/Payment.js/MomoQR";
import PageHostInf from "./components/PageHostInf/PageHostInf";
import InfWhoBook from "./components/ListBookRoom/InfWhoBook";
import ManageRooms from "./components/ManageRooms.js/ManageRooms";
import ManageUsers from "./components/Admin/ManageUser/ManageUsers";
import ListBookRoom from "./components/ListBookRoom/ListBookRoom";
import { ToastContainer } from "react-toastify";
import OutOfRoom from "./components/ManageRooms.js/OutOfRoom/OutOfRoom";
import NewPassword from "./components/Login/NewPassword";
import HostRegister from "./components/HostRegister/HostRegister.js";
import Home from "./components/Home/Home.js";
import Footer from "./components/Footer/Footer.js";
import Admin from "./components/Admin/Admin";
import ErrorPage from "./components/ErrorPage/ErrorPage";
import CancellationPolicy from "./components/AnotherPage/CancellationPolicy";
import SearchRoom from "./components/SearchRoom/SearchRoom";

const config = require("./config/default.json");

function App() {
  //const [checkError,setCheckError] = useState(true);
  const [state, dispatch] = useReducer(UserReducer, null);
  const [search, setsearch] = useState(
    { key: "", startD: null, endD: null, guest: 0 },
  );

  function handleSearch(item) {
    const temp = { ...item };
    setsearch(temp);
  }
  function handleHomeSearch(item) {
    setsearch({ key: item });
  }

  const [isHost, setIsHost] = useState(false);

  const upDateCheckChange = () => {
    if (Cookies.get("token")) {
      $.ajax({
        url: `${config.url}/user/loginAgain`,
        type: "post",
        xhrFields: {
          withCredentials: true,
        },
        success: function (id) {
          dispatch({
            id: id.id,
            avt: id.avt,
            email: id.email,
            ten: id.ten,
            sdt: id.sdt,
            admin: id.admin,
            diachi: id.diachi,
            gioitinh: id.gioitinh,
            gioithieu: id.gioithieu,
            ngaysinh: id.ngaysinh,
            type: "login",
          });
        },
      })
        .fail(function () {
          dispatch({
            type: "logout",
          });
        });
    } else {
      dispatch({
        type: "logout",
      });
    }
  };

  //Begin when go on web check login or not
  useEffect(() => {
    if (Cookies.get("token")) {
      $.ajax({
        url: `${config.url}/user/loginAgain`,
        type: "post",
        xhrFields: {
          withCredentials: true,
        },
        success: function (id) {
          dispatch({
            id: id.id,
            avt: id.avt,
            email: id.email,
            ten: id.ten,
            sdt: id.sdt,
            admin: id.admin,
            diachi: id.diachi,
            gioitinh: id.gioitinh,
            gioithieu: id.gioithieu,
            ngaysinh: id.ngaysinh,
            type: "login",
          });
        },
      })
        .fail(function () {
          dispatch({
            type: "logout",
          });
        });
      $.ajax({
        url: `${config.url}/user/profile`,
        type: "post",
        xhrFields: {
          withCredentials: true,
        },
        success: function (val) {
          if (val.upHost === 2) {
            setIsHost(true);
          }
        },
      });
    } else {
      dispatch({
        type: "logout",
      });
    }
  }, []);

  if (!state) return null;
  else {
    return (
      <Router>
        <div>
          <ToastContainer />
          <UserContext.Provider value={[state, dispatch]}>
            {state.type === "login" &&
              (<NavBar
                onChange={(item) => handleSearch(item)}
                value={search}
              >
                <Link
                  className="userbutton"
                  style={{ textDecoration: "none", alignSelf: "center" }}
                  to={{ pathname: "/user", state: { type: 1 } }}
                >
                  <NavItem icon={state.ten} img={state.avt} />
                </Link>
                <NavItem icon={<CaretIcon />}>
                  <DropdownMenu isHost={isHost}></DropdownMenu>
                </NavItem>
              </NavBar>)}
            {state.type === "logout" &&
              <NavBar onChange={(item) => handleSearch(item)} value={search}>
                <NavItem
                  icon={<Link to="/login">&nbsp; Login / Sign up &nbsp;</Link>}
                />
              </NavBar>}

            {/* <Switch>
            <Router exact path="/">
              <User/>
            </Router>
            <Route path="/user"  children={<User/>} />
            <Route path="/rooms/:id"  children={<PageRoom />} />
            <ProtectHostCreate path="/host/create">
                <PageCreateARoom />
            </ProtectHostCreate>
            <Route path="/login" children={ <Login/>} />
            <Route path="/signup" children={ <Signup/>} />
            <Route path="/forgotpw" children={ <ForgotPassword/>} /> */}

            <Switch>
              <Route
                exact
                strict
                path="/"
                children={<Home onChange={(item) => handleHomeSearch(item)} />}
              />
              {/* <Route exact path="/hostbar">
                <HostRegister hostBar={handleBar} />
                {/* <User /> 
              </Route> */}
              <ProtectBooked path="/user">
                <User onClick={upDateCheckChange} user={state} />
              </ProtectBooked>
              {/* <Route path="/user" children={<User />} /> */}
              <Route exact strict path="/rooms/:id" children={<PageRoom />} />

              <Route
                exact
                strict
                path="/host/reservations/:id"
                children={<InfWhoBook />}
              />

              <ProctectUser strict path="/host/reservations">
                <Route children={<ListBookRoom />} />
              </ProctectUser>

              <ProctectAdmin exact strict path="/admin">
                <Route children={<Admin />} />
              </ProctectAdmin>

              <ProctectUser exact strict path="/host/managerooms">
                <Route children={<ManageRooms />} />
              </ProctectUser>
              <ProctectUser exact strict path="/admin/manageusers">
                <Route children={<ManageUsers />} />
              </ProctectUser>

              <ProctectUser strict path="/host/outofroom/:id">
                <Route children={<OutOfRoom />} />
              </ProctectUser>

              <ProctectUser path="/host/create">
                <PageCreateARoom />
              </ProctectUser>

              <ProtectHostFixRoom path="/host/fix/:id">
                <PageCreateARoom />
              </ProtectHostFixRoom>

              <Route exact strict path="/host/:id" children={<PageHostInf />} />

              <ProtectBooked path="/checkout/room">
                <PageBookRoom />
              </ProtectBooked>

              <Route path="/payment/momo" children={<MomoQR />} />

              <Route path="/login" children={<Login></Login>} />
              <Route path="/signup" children={<Signup></Signup>} />
              <Route
                exact
                strict
                path="/cancellation_policy"
                children={<CancellationPolicy />}
              />
              <Route path="/forgotpassword" children={<ForgotPassword />} />
              <Route path="/newpassword" children={<NewPassword />} />
              <Route
                path="/search"
                children={<SearchRoom value={search}></SearchRoom>}
              />
              <Route>
                <ErrorPage />
              </Route>
            </Switch>
          </UserContext.Provider>
          <Footer />
        </div>
      </Router>
    );
  }
}

export default App;
