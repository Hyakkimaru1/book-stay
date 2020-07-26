import React,{useState} from 'react';
import StarRating from '../PageRoom/StarRating';
import { useHistory } from 'react-router-dom';
import numberWithCommas from '../../js/numberWithCommas'
const CardDetail = (props) => {
  const history = useHistory();
     // eslint-disable-next-line no-unused-vars
  //const [room,setRoom] = useState(5);
  /* useEffect(() => {
     //$.get('')
     return () => {
       cleanup
     };
     //Call only one first Mount
   }, []); */ 
    return (
      <div className="col-1-of-4" onClick={() => history.push(`/rooms/${props.id}`)}>
        <div className="App">
          <div className="card">
            <header className="card__header"><img className="card__header--img" alt="" src={props.img}/></header>
            <div className="card__body"> 
              <h3 className="card__body--name">{props.ten}</h3> 
              <div className="card__body--room">{props.soKhachToiDa} khách · {props.soPhong} phòng ngủ · {props.soGiuong} giường</div>
              <div className="card__body--price">{props.giaNgayThuong && numberWithCommas(props.giaNgayThuong)}₫/đêm</div>
              <div className="card__body--place">{props.ten}</div>
            </div>
            <footer className="start" style={{textAlign:'left'}}>{props.star && <StarRating star={props.star}/>}</footer>
          </div>
        </div>
      </div>
    );
}

export default CardDetail;
