
import React, { useState } from 'react';
import InforUser from '../InforUser/InforUser';
import MenuUser from './MenuUser';
import MyBooking from '../MyBooking/MyBooking';

const User = () => {
    const [option, setOption] = useState(2);


    const onOptionClick = (status) => {
        if (status === 1)
            setOption(2);
        else if (status === 2)
            setOption(1);


    };

    const curStatus = option === 1 ? <InforUser /> : <MyBooking />

    return (
        <div >

            <MenuUser
                status={option}
                onClick={onOptionClick}
            />

            <div>
                {curStatus}
            </div>
        </div>

    );
}


export default User;