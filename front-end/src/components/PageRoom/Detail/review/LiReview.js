import React, { Component } from 'react';
import StarRating from '../../StarRating';
class LiReview extends Component {
    render() {
        return (
            <li className="review__elements">
                <div className="review__elements--detail">
                        <div className="review__elements--detail-img">
                            <img className="review__elements--detail-img-show" alt="" src={this.props.img} />
                        </div>
                        <div className="review__elements--detail-name">
                            <p className="review__elements--detail-name-main" >{this.props.name} &nbsp;&nbsp; <StarRating star={this.props.star}/></p>
                            <p  className="review__elements--detail-name-detail" >lúc {this.props.days}</p>
                        </div>
                </div>
                
                <div className="review__elements--comment">
                    {this.props.review}
                </div>
            </li>
        );
    }
}

export default LiReview;

