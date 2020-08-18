import React from 'react';

const CardPlace = (props) => {
    return (
        <div className="Home__card">
            <img className="Home__card--img" src={props.img} alt=""></img>
            <div className="Home__card--name">
                <h3>
                    {props.name}
                </h3>
                <p>
                    {props.places} chỗ ở
                </p>
            </div>
        </div>
    );
}

export default CardPlace;
