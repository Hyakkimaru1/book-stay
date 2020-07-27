import React from 'react';





const MenuUser = props => {


return (
<div className="MenuUser ">
    <div className="MenuUser__option container">
<a href="#" className={props.status===2?'MenuUser__option--active':' '} onClick={() => props.onClick(1)} ><span>Đặt chỗ của tôi </span> </a>
    <a href="#" className={props.status===1?'MenuUser__option--active':' '} onClick={() => props.onClick(2)} ><span>Cài đặt tài khoản</span>  </a>
    </div>
    
</div>



);

}
export default MenuUser;