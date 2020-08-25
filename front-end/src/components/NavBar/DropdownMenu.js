import React, { useState,useEffect,useRef,useContext } from 'react';
import {ReactComponent as CogIcon} from '../../icons/cog.svg';
import {ReactComponent as ChevronIcon} from '../../icons/chevron.svg';
import {ReactComponent as ArrowIcon} from '../../icons/arrow.svg';
import {ReactComponent as BoltIcon} from '../../icons/bolt.svg';
import {CSSTransition} from 'react-transition-group';
import { UserContext } from '../../UserContext';
import {Link} from 'react-router-dom';
import $ from 'jquery';
const config = require('../../config/default.json'); 
const DropdownMenu = (props) => {
    const [activeMenu,setActiveMenu] = useState('main');
    const [menuHeight, setMenuHeight] = useState(null);
    const [state, dispatch] = useContext(UserContext);
    const [data,setData] = useState(null);
    const dropdownRef = useRef(null);
    useEffect(() => {
        setMenuHeight(dropdownRef.current?.firstChild.offsetHeight)
      }, [])

    function calcHeight(el) {
        const height = el.offsetHeight;
        setMenuHeight(height+22);
    }

   
    function DropdownItem(props){
        return (
            <a href className="menu-item" onClick={()=>props.goToMenu && setActiveMenu(props.goToMenu)}>
                <span className="icon-button">{props.leftIcon}</span>
                {props.children}
                <span className="icon-right">{props.rightIcon}</span>
            </a>
        );
    }
    return (
        <div className="dropdown" style={{height:menuHeight}} >
            <CSSTransition 
            in={activeMenu === 'main'} 
            unmountOnExit 
            timeout={500}
            classNames="menu-primary"
            onEnter={calcHeight}>
                <div className="menu">
                    {state.admin?<Link to={{pathname:"/admin",state:{type:2}}}><DropdownItem leftIcon={<i style={{color:'#606770'}} class="fas fa-list"></i>}>Trang quản lý</DropdownItem></Link>:<span>
                    <Link to={{pathname:"/user",state:{type:1}}}><DropdownItem leftIcon={<i style={{color:'#606770'}} class="fas fa-user"></i>}>Thông tin của bạn</DropdownItem></Link>
                    <Link to={{pathname:"/user",state:{type:2}}}><DropdownItem leftIcon={<i style={{color:'#606770'}} class="fas fa-list"></i>}>Danh sách đặt phòng</DropdownItem></Link></span>
                    
                    }
                    {props.isHost&&state.admin===false?<Link to={{pathname:"/host/managerooms",state:{type:2}}}><DropdownItem leftIcon={<i style={{color:'#606770'}} class="fas fa-list"></i>}>Trang quản lý của bạn</DropdownItem></Link>:null}
                    <Link to="/" onClick={() => dispatch({ type: 'logout' })}><DropdownItem leftIcon={<i style={{color:'#606770'}} class="fas fa-sign-out-alt"></i>} rightIcon={<ChevronIcon/>} >Logout</DropdownItem></Link>
                </div>
                
            </CSSTransition>
           
        </div>
    );
}

export default DropdownMenu;
