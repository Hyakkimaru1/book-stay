
import { Children } from 'react'
import React from 'react';

const BarTab = (props) => {
    const name = (params) => {
        console.log(params)
    }
    return (
        <div className="HostReBar__top--step">

            <div className="HostReBar__top--step-item" key='1' onClick={() => { props.onChange('1') }} >
                Bước 1: Thông tin chỗ nghỉ
                    </div>
            <div className="HostReBar__top--step-item" key='2' onClick={() => { props.onChange('2') }}  >
                Bước 2: Hình ảnh chỗ nghỉ
                     </div>
            <div className="HostReBar__top--step-item" key='3' onClick={() => { props.onChange('3') }} style={{ border: "none" }} >
                Bước 3: Giá và quy định nhận chỗ
                    </div>



            {/* Children.map(props.children, (child, i) => {

                return (

                    <div
                        className="HostReBar__top--step-item" style={(i === props.children.length - 1) ? { border: "none" } : {}}
                        onClick={() => { props.onChange(child.key) }}
                    >

                        {child}

                    </div>
                )
            }) */}




        </div>
    );
}

export default BarTab;

