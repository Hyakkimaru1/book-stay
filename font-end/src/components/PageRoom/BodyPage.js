import React from 'react';
import RoomSideBar from './RoomSideBar';
import Detail from './Detail/Detail';

const stick = {
    position: 'sticky',
    top: 100
}

const BodyPage = () => {
    return (
        <div className="row" style={{marginTop:40}}>
            <div className="col-2-of-3">
               <Detail/>
            </div>
            <div className="col-1-of-3" style={stick}>
                <RoomSideBar/>
            </div>
        </div>
    );
}

export default BodyPage;
