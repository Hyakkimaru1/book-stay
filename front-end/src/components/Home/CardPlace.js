import React from "react";
import { useHistory } from "react-router-dom";
const CardPlace = (props) => {
  const history = useHistory();
  const handleClick = (params) => {
    history.push(`/search?key=${props.name}`);
    props.onChange(props.name);
  };

  return (
    <div
      className="Home__card"
      onClick={handleClick}
    >
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
};

export default CardPlace;
