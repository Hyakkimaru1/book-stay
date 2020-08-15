import React, { useState, useReducer, useEffect } from 'react';
import { UserContext } from '../../UserContext';
import { UserReducer } from '../../UserReducer';
import HostRegisterBar from './HostRegisterBar';
import { Children } from 'react';

const HostRegister = (props) => {
   useEffect(() => {
       props.hostBar();
   }, []);

    return (
        <div className="HostRegister">
          
            <div >
            <HostRegisterBar ></HostRegisterBar>
             
            </div>

        </div>

    );
}

export default HostRegister;
