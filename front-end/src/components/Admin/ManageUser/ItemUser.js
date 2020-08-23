import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Avatar from "@material-ui/core/Avatar";
import { useHistory } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
import Swal from "sweetalert2";
import $ from "jquery";
const config = require("../../../config/default.json");

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
    "& > *": {
      margin: theme.spacing(1),
    },
  },
  large: {
    width: theme.spacing(7),
    height: theme.spacing(7),
  },
}));

const ItemUSer = (props) => {
  const history = useHistory();
  const [trangThai, settrangThai] = useState(null);
  const [upHost, setupHost] = useState(null);
  const classes = useStyles();
  const handleChangeToggle = (e) => {
    settrangThai(e.target.checked);
  };

  const handleChangeHost = (params) => {
    setupHost(params);
  };

  useEffect(() => {
    if (upHost != null) {
      Swal.fire({
        title: "Bạn có chắc muốn thay đổi?",
        text: "Điều này sẽ thay đổi trạng thái người dùng.!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Đồng ý!",
        cancelButtonText: "Cân nhắc lại",
      }).then((result) => {
        if (result.value) {
          $.ajax({
            url: `${config.url}/user/${props.data.id}/upHost`,
            type: "post",
            data: { upHost },
            xhrFields: {
              withCredentials: true,
            },
            success: () => {
              toast.success("Cập nhật thành công");
              if (upHost == 2) {
                let btnUp = document.getElementById(`btnUp${props.data.id}`);
                btnUp.style.color = "gray";
                btnUp.disable = true;
              } else if (upHost == 0) {
                let btnUp = document.getElementById(`btnDown${props.data.id}`);
                btnUp.style.color = "gray";
                btnUp.disable = true;
              }
            },
            statusCode: {
              403: () => {
                toast.error(
                  "Bạn không đủ quyền hạn, vui lòng liên hệ quản trị.",
                );

                setupHost(null);
              },
              404: () => {
                toast.error("Không tìm thấy người này");

                setupHost(null);
              },
              500: () => {
                toast.error("Cập nhật thất bại");

                setupHost(null);
              },
            },
          });
        } else {
          setupHost(null);
        }
      });
    }
  }, [upHost]);

  useEffect(() => {
    if (trangThai != null) {
      Swal.fire({
        title: "Bạn có chắc muốn thay đổi?",
        text:
          "Điều này sẽ thay đổi trạng thái người dùng. Tài khoản của người dùng sẽ bị khoá hoặc mở khoá tuỳ vào trạng thái hiện tại!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Đồng ý!",
        cancelButtonText: "Cân nhắc lại",
      }).then((result) => {
        if (result.value) {
          $.ajax({
            url: `${config.url}/user/${props.data.id}/update`,
            type: "post",
            data: { trangThai },
            xhrFields: {
              withCredentials: true,
            },
            success: () => {
              toast.success("Cập nhật thành công");
            },
            statusCode: {
              403: () => {
                toast.error(
                  "Bạn không đủ quyền hạn, vui lòng liên hệ quản trị.",
                );
                document.getElementById(`toggleCheck${props.data.id}`).checked =
                  !trangThai;
                settrangThai(null);
              },
              404: () => {
                toast.error("Không tìm thấy người này");
                document.getElementById(`toggleCheck${props.data.id}`).checked =
                  !trangThai;
                settrangThai(null);
              },
              500: () => {
                toast.error("Cập nhật thất bại");
                document.getElementById(`toggleCheck${props.data.id}`).checked =
                  !trangThai;
                settrangThai(null);
              },
            },
          });
        } else {
          document.getElementById(`toggleCheck${props.data.id}`).checked =
            !trangThai;
          settrangThai(null);
        }
      });
    }
  }, [trangThai]);

  return (
    <div className="UserItem">
      <div className="UserItem__wrap" style={{ marginTop: "0rem" }}>
        <div className="UserItem__wrap--info">
          <div className="avatar">
            <Avatar
              alt="Remy Sharp"
              src={props.data.avatar}
              className={classes.large}
            />
          </div>
          <div className="name">
            {props.data.ten}
          </div>
          <div className="email">
            <span>{props.data.email}</span>
          </div>
        </div>
        <div className="UserItem__wrap--status">
          {props.data.upHost == 2
            ? <div className="upHost">
              <span class="tooltiptext">Người dùng là host</span>
              <i
                class="fas fa-user-tie fa-2x"
              >
              </i>
            </div>
            : <div></div>}
          <div className="upHost" onClick={() => handleChangeHost(2)}>
            <span class="tooltiptext">Duyệt host người dùng</span>
            <i
              class={props.data.upHost !== 1
                ? "fas fa-arrow-up fa-2x disable"
                : "fas fa-arrow-up fa-2x"}
              id={`btnUp${props.data.id}`}
            >
            </i>
          </div>
          <div className="upHost" onClick={() => handleChangeHost(0)}>
            <span class="tooltiptext">Huỷ host người dùng</span>
            <i
              class={props.data.upHost === 0
                ? "fas fa-arrow-down fa-2x disable"
                : "fas fa-arrow-down fa-2x"}
              id={`btnDown${props.data.id}`}
            >
            </i>
          </div>
          <div
            className="isBan"
            style={{
              gridColumnStart: "1",
              gridColumnEnd: "3",
              textAlign: "center",
            }}
          >
            <p
              className="ListBookRoom__detail--label"
              style={{ color: "black", fontSize: "1.4rem" }}
            >
              Hoạt động
            </p>
            <label className="switch">
              <input
                id={`toggleCheck${props.data.id}`}
                onChange={handleChangeToggle}
                type="checkbox"
                defaultChecked={props.data.isBan !== 1 ? true : false}
              />

              <span className="slider round"></span>
            </label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ItemUSer;
