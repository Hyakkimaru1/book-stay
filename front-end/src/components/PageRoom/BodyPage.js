import React, { useState,useEffect } from 'react';
import RoomSideBar from './RoomSideBar';
import Detail from './Detail/Detail';
import $ from 'jquery';

const config = require('../../config/default.json');

const stick = {
    position: 'sticky',
    top: 100
}

const BodyPage = (props) => {
    const [data, setData] = useState();
    useEffect(() => {
        $.get(`${config.url}/room/${props.id}`,val=>{
            setData(val);
        });
    }, [props.id]);
    return (
        <div className="row" style={{marginTop:40}}>
            <div className="col-2-of-3">
               <Detail data={data} id={props.id}/>
            </div>
            <div className="col-1-of-3" style={stick}>
                <RoomSideBar data={data}/>
            </div>
        </div>
    );
}

export default BodyPage;
