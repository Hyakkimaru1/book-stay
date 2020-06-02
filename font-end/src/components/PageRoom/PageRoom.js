import React, { Component } from 'react';
import Slide from './Slide';
import BodyPage from './BodyPage';
import CardDetail from '../CardDetail/CardDetail';
class PageRoom extends Component {
    render() {
        return (
            <div>
                <Slide/>
                <BodyPage/>
                <div className="cozy__title row" style={{padding:'.2rem'}}>
                <div style={{marginBottom:'1.6rem'}} className="cozy__title">Chỗ ở tương tự</div>
                <CardDetail/>
                </div>
                
            </div>
        );
    }
}

export default PageRoom;
