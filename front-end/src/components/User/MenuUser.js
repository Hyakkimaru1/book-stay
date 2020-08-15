import React from 'react';
import { Children } from 'react'




const MenuUser = (props) => {


    return (
        <div className="MenuUser ">
            <div className="MenuUser__option container">

                {Children.map(props.children, (child, i) => {

                    let className = (props.status == i + 1) ? "MenuUser__option--active" : "";

                    return (
                        // eslint-disable-next-line jsx-a11y/anchor-is-valid
                        <a
                         href="#"
                         className={className} 
                         onClick = {() => props.onChange(child.key)} > 
                         {child}  
                         </a>

                    )
                })
                }


                {/* <a href="#" className={props.status === 1 ? 'MenuUser__option--active' : ' '} onClick={() => props.onClick(2)} ><span>Cài đặt tài khoản</span>  </a>
                <a href="#" className={props.status === 2 ? 'MenuUser__option--active' : ' '} onClick={() => props.onClick(1)} ><span>Đặt chỗ của tôi </span> </a> */}

            </div>

        </div>



    );

}
export default MenuUser;