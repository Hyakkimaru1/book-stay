import React, { useState } from 'react';

function NavItem(props) {
    const [open, setOpen] = useState(false);
    return (
        <li className="navbar-item">
            <p className="icon-button" onClick={_ => setOpen(!open)}>
                {props.img && <img className="navbar-img" alt="" src={props.img} />}
                {props.icon}
            </p>
            {open && props.children}
        </li>);
}

export default NavItem;
