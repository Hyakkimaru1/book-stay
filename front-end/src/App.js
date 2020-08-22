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
import InfWhoBook from "./components/ListBookRoom.js/InfWhoBook";
import ManageRooms from "./components/ManageRooms.js/ManageRooms";
import ListBookRoom from "./components/ListBookRoom.js/ListBookRoom";
import { ToastContainer } from "react-toastify";
import OutOfRoom from "./components/ManageRooms.js/OutOfRoom/OutOfRoom";
import NewPassword from "./components/Login/NewPassword";
import HostRegister from "./components/HostRegister/HostRegister.js";
import Home from "./components/Home/Home.js";
import Footer from "./components/Footer/Footer.js";
import RecommendRooms from "./components/RecommendRooms/RecommendRooms";
import Admin from "./components/Admin/Admin";
import SearchRoom from "./components/SearchRoom/SearchRoom";

const config = require("./config/default.json");

function App() {
  //const [checkError,setCheckError] = useState(true);
  const [state, dispatch] = useReducer(UserReducer, null);
  const [hostBar, setHostBar] = useState(false);
  const [search, setsearch] = useState(
    { key: "", startD: null, endD: null, guest: 0 },
  );

  function handleSearch(item) {
    const temp = { ...item };
    setsearch(temp);
  }

  const handleBar = (e) => {
    setHostBar(true);
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
  }, []);
  if (!state) return null;
  else {
    return (
      <Router>
        <div>
          <ToastContainer />
          <UserContext.Provider value={[state, dispatch]}>
            {state.type === "login" &&
              (!hostBar
                ? <NavBar
                  onChange={(item) => handleSearch(item)}
                  value={search}
                >
                  <NavItem icon={<Link to="/">🤓</Link>} />
                  <NavItem icon={state.ten} img={state.avt} />
                  <NavItem icon={<CaretIcon />}>
                    <DropdownMenu></DropdownMenu>
                  </NavItem>
                  <NavItem
                    icon={<Link
                      to="/"
                      onClick={() => dispatch({ type: "logout" })}
                    >
                      Logout
                    </Link>}
                  >
                  </NavItem>
                </NavBar>
                : <div></div>)}
            {state.type === "logout" &&
              <NavBar onChange={(item) => handleSearch(item)} value={search}>
                <NavItem icon={<Link to="/forgotpw">🤓</Link>} />
                <NavItem icon={<Link to="/login">Login/Logup</Link>} />
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
              <Route exact strict path="/" children={<Home />} />
              <Route
                exact
                strict
                path="/vietnam/:country"
                children={<RecommendRooms />}
              >
              </Route>

              <Route exact path="/hostbar">
                <HostRegister hostBar={handleBar} />
                {/* <User /> */}
              </Route>
              <ProtectBooked path="/user">
                <User />
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

              <ProctectAdmin strict path="/admin">
                <Route children={<Admin />} />
              </ProctectAdmin>

              <ProctectUser exact strict path="/host/managerooms">
                <Route children={<ManageRooms />} />
              </ProctectUser>

              <ProtectHostRegister path="/host/register">
                <HostRegister hostBar={handleBar} />
              </ProtectHostRegister>

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

              <Route path="/forgotpassword" children={<ForgotPassword />} />
              <Route path="/newpassword" children={<NewPassword />} />
              <Route
                path="/search"
                children={<SearchRoom value={search}></SearchRoom>}
              />
              <Router>
                <h1>ERROR</h1>
                <Link to="/">Public Page</Link>
              </Router>
            </Switch>
          </UserContext.Provider>
          {/* <Footer /> */}
        </div>
      </Router>
    );
  }
}

export default App;
