
import React, { useState } from 'react';
import InforUser from '../InforUser/InforUser';
import MenuUser from './MenuUser';
import MyBooking from '../MyBooking/MyBooking';

const User = () => {
    const [option, setOption] = useState('2');


    const onOptionClick = (a) => {

        setOption(a);

    };
    const content = () => {
        switch (option) {
            case '1':
                return <InforUser />
            case '2':
                return <MyBooking />
            default:
                return <InforUser />
        }
    }

    let curStatus = content();
    return (
        <div >

            <MenuUser
                status={option}
                onChange={onOptionClick}
            >
                <span key='1' >
                    Cài đặt tài khoản
                </span>
                <span key='2' >
                    Đặt chỗ của tôi
                </span>
                {
                    <span key='3' >
                        Phòng đã đăng
                </span>
                }

            </MenuUser>

            <div>
                {curStatus}

            </div>
        </div>

    );
}


export default User;