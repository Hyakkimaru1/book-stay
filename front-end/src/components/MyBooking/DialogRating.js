import React, { useContext, useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import Select from "@material-ui/core/Select";
import Switch from "@material-ui/core/Switch";
import Rating from "@material-ui/lab/Rating";
import { UserContext } from "../../UserContext";
import queryString from "query-string";
import {toast} from 'react-toastify'

import $, { data } from "jquery";

const config = require("../../config/default.json");

const useStyles = makeStyles((theme) => ({
  form: {
    display: "flex",
    flexDirection: "column",
    margin: "auto",
    width: "fit-content",
  },
  formControl: {
    marginTop: theme.spacing(2),
    minWidth: 120,
  },
  formControlLabel: {
    marginTop: theme.spacing(1),
  },
}));

export default function DiaglogRating(props) {
  const [state] = useContext(UserContext);
  const [open, setOpen] = useState(true);
  const [value, setValue] = useState(2);

  const handleClick = () => {
    const content = document.getElementById("feedback-content").value;
    const point = value;
    console.log(content + " + " + point);
    let ratingContent = {
      nguoiDung: state.user,
      danhGia: point,
      comment: content,
      phong: props.idphong,
      dondatphong:props.id
    };

    if (content !== "") {
      $.ajax({
        url: `${config.url}/user/mybooking/feedback`,
        type: "post",
        //contentType: 'application/json; charset=utf-8',
        data: ratingContent,
        xhrFields: {
          withCredentials: true,
        },
        success: (result) => {
          props.onClose();
          props.refresh();
          toast.success('Đánh giá thành công');
        },
      }).fail(function () {
        props.onClose();
        toast.error('Đánh giá thất bại');
      });
    }
  };

  const handleClose = () => {
    setOpen(false);
  };

  return (
    <React.Fragment>
      <Dialog
        fullWidth={true}
        maxWidth="sm"
        onClose={props.onClose}
        open={props.onChange}
        aria-labelledby="max-width-dialog-title"
      >
        <DialogTitle id="max-width-dialog-title">Đánh giá phòng</DialogTitle>
        <DialogContent>
          <div className="rating">
            <hr />
            <div className="rating__room">
              <img
                width="60"
                height="60"
                src="https://cdn.luxstay.com/users/170204/vopvKF2uSyomu130qFjYS0Nt.jpg"
              >
              </img>
              <div className="rating__room--name">{props.name}</div>
            </div>
            <div className="rating__star">
              <Rating
                value={value}
                onChange={(event, newValue) => {
                  setValue(newValue);
                }}
                name="half-rating-read"
                id="rating-point"
                size="large"
                precision={0.5}
              />
            </div>
            <div className="rating__content">
              <textarea
                className="rating__content--text"
                id="feedback-content"
                style={{ resize: "none" }}
                placeholder="Hãy chia sẻ cảm nhận của bạn về dịch vụ nơi đây nhé"
              >
              </textarea>
            </div>
          </div>
        </DialogContent>
        <DialogActions>
          <div className="rating__button">
            <Button onClick={props.onClose} class="bt__close" color="primary">
              Cancel
            </Button>
            <Button onClick={handleClick} class="bt__default" color="primary">
              Hoàn thành
            </Button>
          </div>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  );
}
