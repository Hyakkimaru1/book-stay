import React from "react";
import Rating from "@material-ui/lab/Rating";
import { ReactComponent as Flash } from "../../icons/icons8_lightning_bolt.svg";
import { useHistory } from "react-router-dom";

export default function SearchItem(props) {
  const history = useHistory();

  const currency = props.data.giaNgayThuong.toString().replace(
    /(\d)(?=(\d\d\d)+(?!\d))/g,
    "$1,",
  );

  return (
    <div
      className="room__item"
      onClick={() => history.push(`/rooms/${props.data.id}`)}
    >
      <div className="room__item--wrap">
        <div className="room__img">
          <img
            width="270"
            height="192"
            src={props.data.img}
          >
          </img>
        </div>
        <div className="room__info">
          <div className="room__info--type">
            CĂN HỘ
          </div>
          <div className="room__info--name">
            <Flash />
            {props.data.ten}
          </div>
          <div className="room__info--rooms">
            {props.data.soPhong} phòng · {props.data.soGiuong} giường/phòng ·
            {props.data.dienTich} m2
          </div>
          <div className="room__info--price">
            {currency}đ/đêm
          </div>
          <div className="room__info--address">
            {props.data.diaChi}
          </div>
          <Rating
            name="half-rating-read"
            defaultValue={0}
            value={props.data.rate}
            precision={0.5}
            readOnly
          />
        </div>
      </div>
    </div>
  );
}
