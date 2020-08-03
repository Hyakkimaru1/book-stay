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

        
            <ul className="mybooking__dropdown" 
               
            >
                 <DropdownItem>Tất cả chỗ đặt</DropdownItem>
                 <DropdownItem>Chờ xác nhận</DropdownItem>
                 <DropdownItem>Chờ thanh toán</DropdownItem>
                 <DropdownItem>Đã chấp nhận</DropdownItem>
                 <DropdownItem>Từ chối</DropdownItem>
                 <DropdownItem>Thành công</DropdownItem>
                 <DropdownItem>Không thành công</DropdownItem>
                 <DropdownItem>Đã huỷ</DropdownItem>
               
            </ul>


           
       
        
    )
}


export default MBDropdown;