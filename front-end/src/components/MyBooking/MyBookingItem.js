import React from 'react';
import { ReactComponent as Heart } from '../../icons/icons8_heart_outline.svg';
import { ReactComponent as Quick } from '../../icons/icons8_lightning_bolt_1.svg';
import { ReactComponent as Star } from '../../icons/icons8_star.svg';

const MyBookingItem = (props) => {
    return (

        <li className="row">
            <div className="col-3-of-4">
                <div className="item">
                    <div className="item__picture">
                        <div className="item__picture--src">
                            <img width="215" height="155" src="https://cdn.luxstay.com/users/170204/vopvKF2uSyomu130qFjYS0Nt.jpg">
                            </img>
                        </div>
                        <div className="item__picture--heart">
                            <Heart />
                        </div>

                    </div>
                    <div className="item__info">
                        <div className="item__info--type">
                            CĂN HỘ DỊCH VỤ
                                </div>
                        <div className="item__info--name">
                            <a href="" className="item__title">
                                <div className="item__title--icon">
                                    <Quick />
                                </div>
                                <span class="item__title--contain">{props.name}</span>
                            </a>
                        </div>
                        <div className="item__info--subcontent">
                            <div className="subcontent__left">
                                <div className="subcontent__left--location">
                                    <a>{props.diaChi}</a>

                                </div>
                                <div className="subcontent__left--room">
                                   {props.soPhong? props.soPhong:1} phòng
                                        </div>
                                <div className="subcontent__left--rating">
                                    <Star />
                                </div>

                            </div>
                            <div className="subcontent__right">
                                <div className="subcontent__right--price">
                                    <div className="subcontent__right--price-sub">
                                        <p>Giá cho một đêm</p>
                                    </div>
                                    <div className="subcontent__right--price-num">
                                        <span>{props.gia}</span>
                                    </div>

                                </div>



                            </div>

                        </div>

                    </div>

                </div>
            </div>


        </li>

    );
}

export default MyBookingItem;
