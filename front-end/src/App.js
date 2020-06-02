/* eslint-disable jsx-a11y/alt-text */
import React from 'react';
import './App.css';
import './style.css';
//import PageRoom from './components/PageRoom/PageRoom';
import InforUser from './components/InforUser/InforUser';
import NavBar from './components/NavBar/NavBar';
import NavItem from './components/NavBar/NavItem';
import DropdownMenu from './components/NavBar/DropdownMenu';
import {ReactComponent as ArrowIcon} from '../src/icons/arrow.svg';
import {ReactComponent as CaretIcon} from '../src/icons/caret.svg';

function App() {
 
  return (
    <div >
        <NavBar>
          <NavItem icon = {<ArrowIcon />}/>
          <NavItem icon = "🤓"/>
          <NavItem icon = "Huynh Duy" img="https://i.ytimg.com/vi/beffsLKXCV4/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBXk56VfwsPMTWE3wY1WAKa1Mg7Qg"/>
          <NavItem icon = {<CaretIcon/>}>
          <DropdownMenu></DropdownMenu>
          </NavItem>
        </NavBar>
        <InforUser/>
    </div>
  );
}

export default App;
