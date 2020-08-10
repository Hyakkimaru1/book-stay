/* eslint-disable jsx-a11y/alt-text */
import React, { useState, useReducer, useEffect } from 'react';
import './App.css';
import './style.css';
import PageRoom from './components/PageRoom/PageRoom';
import PageCreateARoom from './components/PageCreateARoom/PageCreateARoom';
//import InforUser from './components/InforUser/InforUser';
import NavBar from './components/NavBar/NavBar';
import NavItem from './components/NavBar/NavItem';
import DropdownMenu from './components/NavBar/DropdownMenu';
import User from './components/User/User';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom';
import { ReactComponent as CaretIcon } from '../src/icons/caret.svg';
import { UserContext } from './UserContext';
import { UserReducer } from './UserReducer';
import $, { type } from 'jquery';
import Cookies from 'js-cookie';


import Login from './components/Login/Login';
import Signup from './components/Login/Signup';
import ProtectHostRegister from './ProctectHostRegister';
import ProtectHostCreate from './ProctectHostCreate';
import ProtectHostFixRoom from './ProtectHostFixRoom';
import ProtectBooked from './ProtectBooked';
import ForgotPassword from './components/Login/ForgotPassword';
import PageBookRoom from './components/PageBookRoom/PageBookRoom';
import MomoQR from './components/Payment.js/MomoQR';
import PageHostInf from './components/PageHostInf/PageHostInf';
import InfWhoBook from './components/ListBookRoom.js/InfWhoBook';
import ManageRooms from './components/ManageRooms.js/ManageRooms';
import ListBookRoom from './components/ListBookRoom.js/ListBookRoom';
import HostRegister from './components/HostRegister/HostRegister.js';


const config = require('./config/default.json');

function App() {
  //const [checkError,setCheckError] = useState(true);
  const [state, dispatch] = useReducer(UserReducer, null);
  const [hostBar, setHostBar] = useState(false);

  const handleBar = (e) =>{
    setHostBar(true);
  }

  //Begin when go on web check login or not
  useEffect(() => {
    if (Cookies.get('token')) {
      $.ajax({
        url: `${config.url}/user/loginAgain`,
        type: 'post',
        xhrFields: {
          withCredentials: true
        },
        success: function (id) {
          dispatch({
            id: id.id,
            avt: id.avt,
            email: id.email,
            ten: id.ten,
            sdt: id.sdt,
            type: "login",
           
          });
        }
      })
        .fail(function () {
          dispatch({
            type: "logout"
          });
        });
    }
    else {
      dispatch({
        type: "logout"
      });
    }
  }, []);
  if (!state) return null;
  else
    return (
      <Router>

        <div>
          <UserContext.Provider value={[state, dispatch]}>

            {state.type === "login" && (!hostBar ?   <NavBar>
              <NavItem icon={<Link to="/">🤓</Link>} />
              <NavItem icon={state.ten} img="https://i.ytimg.com/vi/beffsLKXCV4/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBXk56VfwsPMTWE3wY1WAKa1Mg7Qg" />
              <NavItem icon={<CaretIcon />}>
                <DropdownMenu></DropdownMenu>
              </NavItem>
              <NavItem icon={<Link to="/" onClick={() => dispatch({ type: 'logout' })}>Logout</Link>}>
              </NavItem>
            </NavBar>: <div></div>)}
            {state.type === "logout" && <NavBar>
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
              <Router exact path="/">
              {/* <HostRegister hostBar={handleBar} /> */}
                <User />
              </Router>
              <ProtectBooked path="/user">
              <User />
              </ProtectBooked>
              {/* <Route path="/user" children={<User />} /> */}
              <Route exact strict path="/rooms/:id" children={<PageRoom />} />

              <Route exact strict path="/host/reservations/:id" children={<InfWhoBook />} />

              <Route strict path="/host/reservations" children={<ListBookRoom />} />

              <Route exact strict path="/host/manage" children={<ManageRooms />} />

              <ProtectHostRegister path="/host/register">
                <HostRegister hostBar={handleBar} />
              </ProtectHostRegister>

              <ProtectHostCreate path="/host/create">
                <PageCreateARoom />
              </ProtectHostCreate>

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

              <Router>
                <h1>ERROR</h1>
                <Link to="/">Public Page</Link>
              </Router>
            </Switch>
          </UserContext.Provider>
        </div>
      </Router>
    );
}

export default App;
