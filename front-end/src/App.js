/* eslint-disable jsx-a11y/alt-text */
import React, { useState, useReducer,useEffect } from 'react';
import './App.css';
import './style.css';
import PageRoom from './components/PageRoom/PageRoom';
import PageCreateARoom from './components/PageCreateARoom/PageCreateARoom';
//import InforUser from './components/InforUser/InforUser';
import NavBar from './components/NavBar/NavBar';
import NavItem from './components/NavBar/NavItem';
import DropdownMenu from './components/NavBar/DropdownMenu';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom';
import {ReactComponent as CaretIcon} from '../src/icons/caret.svg';
import { UserContext } from './UserContext';
import Login from './components/Login/Login';
import {UserReducer} from './UserReducer';
import ProtectHostCreate from './ProctectHostCreate';
import ProtectBooked from './ProtectBooked';
import Cookies from 'js-cookie';
import $ from 'jquery';
import PageBookRoom from './components/PageBookRoom/PageBookRoom';
import MomoQR from './components/Payment.js/MomoQR';
const config = require('./config/default.json');

function App() {
  //const [checkError,setCheckError] = useState(true);
  const [state, dispatch] = useReducer(UserReducer, null);
  //Begin when go on web check login or not
  useEffect(() => {
    if(Cookies.get('token')){
      $.ajax({
          url: `${config.url}/user/loginAgain`,
          type: 'post',
          xhrFields: {
              withCredentials: true
          },
          success: function( id ) {
              dispatch( {
                  id:id.id,
                  avt:id.avt,
                  email:id.email,
                  ten:id.ten,
                  sdt:id.sdt,
                  type:"login"
              });
          }
      })
      .fail(function() {
          dispatch( {
              type: "logout"
          });
      });
    }
    else {
      dispatch ({
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
        {state.type==="login" && <NavBar>
              <NavItem icon = {<Link to="/">🤓</Link>}/>
              <NavItem icon = "Huynh Duy" img="https://i.ytimg.com/vi/beffsLKXCV4/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBXk56VfwsPMTWE3wY1WAKa1Mg7Qg"/>
              <NavItem icon = {<CaretIcon/>}>
              <DropdownMenu></DropdownMenu>
              </NavItem>
              <NavItem icon = {<Link to="/" onClick={()=>dispatch({type:'logout'})}>Logout</Link>}>
              </NavItem>
        </NavBar>}
        {state.type==="logout" && <NavBar>
              <NavItem icon = {<Link to="/">🤓</Link>}/>
              <NavItem icon = {<Link to="/login">Login/Logup</Link>}/>
        </NavBar>}
        <Switch>
            <Router exact path="/">
            </Router>

            <Route path="/rooms/:id"  children={<PageRoom />} />
            
            <ProtectHostCreate path="/host/create">
                <PageCreateARoom />
            </ProtectHostCreate>

            <ProtectBooked path="/checkout/room">
                <PageBookRoom/>
            </ProtectBooked>

            <Route path="/payment/momo" children={<MomoQR/>}/>

            <Route path="/login" children={<Login></Login>} />

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
