import React, { Component, useState } from 'react';

function NavItem(props){
    const [open,setOpen] = useState(false);
    return ( 
    <li className="navbar-item">
        <a href="#" className="icon-button" onClick={_=> setOpen(!open)}>
           {props.img && <img className="navbar-img" alt="" src={props.img}/>} 
            {props.icon}
        </a>
        {open && props.children}
    </li>);
}

export default NavItem;
