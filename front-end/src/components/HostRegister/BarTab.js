
import { Children } from 'react'
import React from 'react';

const BarTab = (props) => {
    const name = (params) => {
        console.log(params)
    }
    return (
        <div className="HostReBar__top--step">
            {/* {
                Children.map(props.child, (child, i) => {
                    let className = props.active == i ? "HostReBar__top--step-item active" : "HostReBar__top--step-item"
                    return (
                        <div className={className} onClick={() => { props.onChange(child.key) }} style={i === child.length - 1 ? { border: 'none' } : {}}>
                            {child}
                        </div>

                    )
                })
            } */}

          {  Children.map(props.children, (child, i) => {
            let className = (props.active == i+1) ? "HostReBar__top--step-item active" : "HostReBar__top--step-item";
            let style = (i === props.children.length - 1) ? { border: "none" } : {}
                return (

                    <div
                        className={className} style={style}
                        onClick={() => { props.onChange(child.key) }}
                    >

                        {child}

                    </div>
                )
            })}




        </div>
    );
}

export default BarTab;

