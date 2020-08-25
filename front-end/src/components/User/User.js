
import React, { useState,useEffect,useContext } from 'react';
import InforUser from '../InforUser/InforUser';
import MenuUser from './MenuUser';
import MyBooking from '../MyBooking/MyBooking';
import { UserContext } from '../../UserContext';
import { useLocation } from 'react-router-dom';

const User = (props) => {
    const [option, setOption] = useState('2');
    const [state] = useContext(UserContext);
    const location = useLocation();
    useEffect(() => {
        if (location.state && location.state.type){
            setOption(location.state.type);
         }
        
    }, [location.state]);

    const onOptionClick = (a) => {

        setOption(a);

    };
    return (
        <div >

            <MenuUser
                status={option}
                onChange={onOptionClick}
            >
                <span key='1' >
                    Cài đặt tài khoản
                </span>
                {state.admin?null:<span key='2' >
                    Đặt chỗ của tôi
                </span>}
                

            </MenuUser>

            <div>
                {option=='1'? <InforUser user={props.user} onClick = {props.onClick}/>:<MyBooking />}

            </div>
        </div>

    );
}


export default User;