
import React, { useState } from 'react';
import BarTab from './BarTab';

const HostRegisterBar = () => {
    const [step, setStep] = useState({ a: '1' });

    const stepClick = (e) => {
        setStep({ a: e });

    }

    const a = step.a;

    return (
        <div className='HostReBar'>
            <div className="HostReBar__top">

                <BarTab
                    // active={a}
                    onChange={stepClick}
                >


                </BarTab>
            </div>

            <div className="HostReBar__bot">
{a}
             
            </div>

        </div>
    );
}

export default HostRegisterBar;

