import React, { useState,useEffect,useRef } from 'react';
import {ReactComponent as CogIcon} from '../../icons/cog.svg';
import {ReactComponent as ChevronIcon} from '../../icons/chevron.svg';
import {ReactComponent as ArrowIcon} from '../../icons/arrow.svg';
import {ReactComponent as BoltIcon} from '../../icons/bolt.svg';
import {CSSTransition} from 'react-transition-group';

const DropdownMenu = () => {
    const [activeMenu,setActiveMenu] = useState('main');
    const [menuHeight, setMenuHeight] = useState(null);
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
                    <DropdownItem goToMenu="animals">My profile</DropdownItem>
                    <DropdownItem leftIcon={<CogIcon/>} rightIcon={<ChevronIcon/>} goToMenu="settings">Settings</DropdownItem>
                </div>
                
            </CSSTransition>
            <CSSTransition
                in={activeMenu === 'settings'}
                timeout={500}
                classNames="menu-secondary"
                unmountOnExit
                onEnter={calcHeight}>
                <div className="menu">
                <DropdownItem goToMenu="main" leftIcon={<ArrowIcon />}>
                    <h2>My Tutorial</h2>
                </DropdownItem>
                <DropdownItem leftIcon={<BoltIcon />}>HTML</DropdownItem>
                <DropdownItem leftIcon={<BoltIcon />}>CSS</DropdownItem>
                <DropdownItem leftIcon={<BoltIcon />}>JavaScript</DropdownItem>
                <DropdownItem leftIcon={<BoltIcon />}>Awesome!</DropdownItem>
                </div>
            </CSSTransition>
            <CSSTransition
                in={activeMenu === 'animals'}
                timeout={500}
                classNames="menu-secondary"
                unmountOnExit
                onEnter={calcHeight}>
                <div className="menu">
                <DropdownItem goToMenu="main" leftIcon={<ArrowIcon />}>
                    <h2>Animals</h2>
                </DropdownItem>
                <DropdownItem leftIcon="🦘">Kangaroo</DropdownItem>
                <DropdownItem leftIcon="🐸">Frog</DropdownItem>
                <DropdownItem leftIcon="🦋">Horse?</DropdownItem>
                <DropdownItem leftIcon="🦔">Hedgehog</DropdownItem>
                </div>
            </CSSTransition>
        </div>
    );
}

export default DropdownMenu;
