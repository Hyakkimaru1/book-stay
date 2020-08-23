import React, { useState, useEffect, useContext } from "react";
import BookItem from "./MyBookingItem";

//import { Redirect, useLocation, useHistory } from 'react-router-dom';
import { ReactComponent as Empty } from "../../icons/journal.svg";

function BookHomestay(props) {
  const [allBooked, setAllBooked] = useState([]);

  var type = 1;
  if (props.data && props.data.length === 0) {
    type = 2;
  }
  if (props.data) {
  } else type = 2;

  let myBooked = props.data;
  const checkType = (type) => {
    switch (type) {
      case 1:
        return (
          <ul style={{ listStyle: "none" }}>
            {myBooked.map((p) => {
              return <BookItem
                refresh={props.refresh}
                id={p.id}
                idphong={p.phong}
                img={p.img[0]}
                danhgia={p.danhgia}
                trangthai={p.trangthai}
                trangthaiphong={p.trangthaiphong}
                name={p.ten}
                diaChi={p.diaChi}
                ngaycheckin={p.ngaycheckin}
                ngaycheckout={p.ngaycheckout}
                gia={p.gia}
                sokhach={p.sokhach}
              />;
            })}
          </ul>
        );

        break;

      default:
        return (
          <div className="homestay__empty" style={{ textAlign: "center" }}>
            <Empty />
            <span
              style={{
                fontSize: "1.6rem",
                marginLeft: "4rem",
                marginTop: "2rem",
              }}
            >
              Danh sách trống!
            </span>
          </div>
        );

        break;
    }
  };

  return (
    <div className="homestay">
      {checkType(type)}
    </div>
  );
}

export default BookHomestay;
