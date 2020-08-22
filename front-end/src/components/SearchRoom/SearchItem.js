import React from "react";
import Rating from "@material-ui/lab/Rating";
import { ReactComponent as Flash } from "../../icons/icons8_lightning_bolt.svg";

export default function SearchItem(props) {
  const currency = props.data.giaNgayThuong.toString().replace(
    /(\d)(?=(\d\d\d)+(?!\d))/g,
    "$1,",
  );

  return (
    <div className="room__item">
      <div className="room__item--wrap">
        <div className="room__img">
          <img
            width="270"
            height="192"
            src="https://cdn.luxstay.com/users/170204/vopvKF2uSyomu130qFjYS0Nt.jpg"
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
            defaultValue={2.5}
            precision={0.5}
            readOnly
          />
        </div>
      </div>
    </div>
  );
}
