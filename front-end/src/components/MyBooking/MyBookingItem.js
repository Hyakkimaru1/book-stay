import React, { useState } from "react";
import { ReactComponent as Heart } from "../../icons/icons8_heart_outline.svg";
import { ReactComponent as Quick } from "../../icons/icons8_lightning_bolt_1.svg";
import DiaglogRating from "./DialogRating";
import Rating from "@material-ui/lab/Rating";
import { makeStyles } from "@material-ui/core/styles";
import moment from "moment";
import $ from "jquery";
import { toast } from "react-toastify";
import { useHistory } from "react-router-dom";
import Swal from "sweetalert2";
// import Button from '@material-ui/core/Button';

const config = require("../../config/default.json");
const MyBookingItem = (props) => {
  const [rating, setRating] = useState(false);
  const ratingClick = (a) => {
    setRating(a);
  };
  const history = useHistory();
  const curDate = new Date();
  const cancelBooking = () => {
    Swal.fire({
      title: "Bạn có chắc huỷ phòng?",
      text: "Việc huỷ phòng sẽ được hoàn tiền nếu huỷ trước 3 ngày!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Đồng ý!",
      cancelButtonText: "Cân nhắc lại",
    }).then((result) => {
      if (result.value) {
        $.ajax({
          url: `${config.url}/user/cancelbooking`,
          type: "post",
          //contentType: 'application/json; charset=utf-8',
          data: { id: props.id },
          xhrFields: {
            withCredentials: true,
          },
          success: (result) => {
            toast.error("Huỷ phòng thành công");
            props.refresh();
          },
        }).fail(function () {
          toast.error("Huỷ thất bại");
        });
      }
    });
  };

  const getQRagain = () => {
    $.ajax({
      url: `${config.url}/room/momo`,
      type: "post",
      //contentType: 'application/json; charset=utf-8',
      data: { id: props.id },
      xhrFields: {
        withCredentials: true,
      },
      success: (result) => {
        window.location.href = result.urlQR;
      },
    }).fail(function () {
      toast.error("Thanh toán lại thất bại");
    });
  };

  return (
    <li className="row">
      <div className="col-3-of-4">
        <div className="item">
          <div className="item__picture">
            <div className="item__picture--src" style={{ height: "100%" }}>
              <img
                width="215"
                height="205"
                src={props.img.img}
              >
              </img>
            </div>
            <div className="item__picture--heart">
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  flexDirection: "column",
                }}
              >
                <p className="item__picture--heart-word">Ngày nhận</p>
                <p className="item__picture--heart-date">
                  {moment(props.ngaycheckin).format("DD/MM/YYYY")}
                </p>
              </div>
              <div
                style={{
                  width: "1px",
                  height: "3.5rem",
                  backgroundColor: "#bec2c9",
                  margin: "0 1rem",
                }}
              >
              </div>
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  flexDirection: "column",
                }}
              >
                <p className="item__picture--heart-word">Ngày trả</p>
                <p className="item__picture--heart-date">
                  {moment(props.ngaycheckout).format("DD/MM/YYYY")}
                </p>
              </div>
            </div>
          </div>
          <div className="item__info">
            <div className="item__info--name">
              {props.trangthai === -1
                ? <div className="item__title--incomplete">
                  Incomplete
                </div>
                : null}
              {props.trangthai === 1 &&
                  moment(props.ngaycheckin).isBefore(curDate)
                ? <div className="item__title--complete">
                  Complete
                </div>
                : null}
              {props.trangthai === 1 &&
                  moment(props.ngaycheckin).isAfter(curDate)
                ? <div className="item__title--complete">
                  Soon
                </div>
                : null}
              {props.trangthai === 0
                ? <div className="item__title--wait">
                  pendding
                </div>
                : null}
              <a href="" className="item__title">
                <span class="item__title--contain">{props.name}</span>
              </a>
            </div>
            <div className="item__info--subcontent">
              <div className="subcontent__left">
                <div className="subcontent__left--location">
                  <a>{props.diaChi}</a>
                </div>
                <div className="subcontent__left--room">
                  {props.sokhach} khách
                </div>
                <div className="subcontent__left--rating">
                  {props.trangthaiphong === 1 && props.trangthai !== 0
                    ? <button
                      type=""
                      class="bt__default"
                      id="changeAvt"
                      onClick={() => history.push(`/rooms/${props.idphong}`)}
                    >
                      Đặt lại
                    </button>
                    : null}
                  {moment(props.ngaycheckin).isBefore(curDate) &&
                      props.danhgia === 1 && props.trangthai === 1
                    ? <button
                      type=""
                      class="bt__default"
                      id="ratingbutton"
                      onClick={() => ratingClick(true)}
                    >
                      Đánh giá
                    </button>
                    : null}
                  {moment(props.ngaycheckin).isAfter(curDate) &&
                      props.trangthai === 1
                    ? <button
                      type=""
                      class="bt__default"
                      id="changeAvt"
                      onClick={cancelBooking}
                    >
                      Huỷ phòng
                    </button>
                    : null}
                  {props.trangthai === 0 && props.trangthaiphong === 1
                    ? <button
                      type=""
                      class="bt__default"
                      style={{
                        backgroundColor: "#222",
                        border: "1px solid #222",
                      }}
                      id="changeAvt"
                      onClick={getQRagain}
                    >
                      Thanh toán lại
                    </button>
                    : null}
                  <DiaglogRating
                    refresh={props.refresh}
                    id={props.id}
                    idphong={props.idphong}
                    onChange={rating}
                    onClose={() => ratingClick(false)}
                    name={props.name}
                  >
                  </DiaglogRating>
                </div>
              </div>

              <div className="subcontent__right">
                <div className="subcontent__right--price">
                  <div className="subcontent__right--price-sub">
                    <p>Tổng tiền</p>
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
};

export default MyBookingItem;
