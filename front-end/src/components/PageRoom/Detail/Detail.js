import React from 'react';
import DetailHead from './DetailHead';
import DetailBody from './DetailBody';

const Detail = () => {
    
    return (
        <div className="detail">
            <DetailHead/>
            <DetailBody/>
            <section className="detail__footer">
            <div className="rule-process" style={{width: 169}}>
            </div>
            </section>
        </div>
    );
}

export default Detail;
