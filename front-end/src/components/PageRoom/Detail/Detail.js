import React from 'react';
import DetailHead from './DetailHead';
import DetailBody from './DetailBody';

const Detail = (props) => {
    
    return (
        <div className="detail">
            <DetailHead data={props.data}/>
            <DetailBody data={props.data} id={props.id}/>
            <section className="detail__footer">
            <div className="rule-process" style={{width: 169}}>
            </div>
            </section>
        </div>
    );
}

export default Detail;
