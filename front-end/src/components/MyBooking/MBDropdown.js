import React, {useState, Component } from 'react';

// import {ReactComponent as DownIcon} from '../../icons/down-arrow.svg';


 const MBDropdown = (props) => {
    const [select, setSelect] = useState("");


    function handleClick(e){
        props.onClick(e);
    }


    function DropdownItem(props){
        function handleChange(){
           handleClick(props.children);
           setSelect("selected");
           
    }
        return(
            <li className="mybooking__dropdown--item" onClick={handleChange}>
             
              {props.children}
            </li>
        )

    }

    return (
            <ul className="mybooking__dropdown">
                 <DropdownItem>Tất cả chỗ đặt</DropdownItem>
                 <DropdownItem>Sắp tới</DropdownItem>
                 <DropdownItem>Chờ thanh toán</DropdownItem>
                 <DropdownItem>Hoàn tất thanh toán</DropdownItem>
                 <DropdownItem>Không thành công</DropdownItem>
            </ul>
    )
}


export default MBDropdown;