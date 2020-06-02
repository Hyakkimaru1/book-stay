import React, { Component } from 'react';


const checked = {
    color: 'orange'
}

class StarRating extends Component {
    constructor(props){
        super(props);
        this.state = {
            star: this.props.star
        }
    }

    render() {
        return (
            <span>
                <span style={ this.state.star>0?checked:null} className="fa fa-star"></span>
                <span style={ this.state.star>1?checked:null} className="fa fa-star"></span>
                <span style={ this.state.star>2?checked:null} className="fa fa-star"></span>
                <span style={ this.state.star>3?checked:null} className="fa fa-star"></span>
                <span style={ this.state.star==='5'?checked:null} className="fa fa-star"></span>
            </span>
        );
    }
}

export default StarRating;
