
import React, { useState } from 'react';
import BarTab from './BarTab';

const HostRegisterBar = (props) => {
    const [step, setStep] = useState('1');

    const stepClick = (e) => {
        setStep(e);

    }

    return (
        <div className='HostReBar'>
            <div className="HostReBar__top">
                <div className="navbar-logo">
                    <img alt="a" src="https://i.pinimg.com/236x/c1/09/73/c10973a2554dcebd540db0bd62066c62--origami-lion-lion-logo.jpg"></img>
                </div>
                <BarTab active={step} onChange={stepClick} >
                    <div key='1' >
                        Bước 1: Thông tin chỗ nghỉ
                                </div>
                    <div key='2' >
                        Bước 2: Hình ảnh chỗ nghỉ
                                </div>
                    <div key='3' >
                        Bước 3: Giá và quy định nhận chỗ
                                </div>
                </BarTab>
            </div>

            <div className="HostReBar__bot">

                <div key='1' >
                    Bước 1: Thông tin chỗ nghỉ
                                </div>
                <div key='2' >
                    Bước 2: Hình ảnh chỗ nghỉ
                                </div>
                <div key='3' >
                    Bước 3: Giá và quy định nhận chỗ
                                </div>






                {step === '1' &&
                    <div>
                        {step}
                    </div>
                }

            </div>

        </div>
    );
}

export default HostRegisterBar;

