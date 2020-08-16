import React, {  useContext,useEffect,useState } from 'react';
import {UserContext} from './UserContext';
import {
  Route,
  Redirect,
  useHistory
} from 'react-router-dom';

import $ from 'jquery';
const config = require('./config/default.json');

function ProtectHostFixRoom({ children, ...rest }) {
    const [state] = useContext(UserContext);
    const arr = rest.location.pathname.split('/');
    const history = useHistory();
    const id = arr[3];
    const [data,setData] = useState(null);
    useEffect(() => {
      if (state.type==='login'){
        if (isNaN(id)){
          history.push('/ERROR');
        }
        else {
          let imgSlideTemp = [];
          fetchImg();
          async function fetchImg(){
            await $.get(`${config.url}/room/img/${id}`, (data) => {
              data.map(src=>imgSlideTemp.push(src.img));
            });
            $.ajax({
              url: `${config.url}/room/${id}`,
              type: 'get',
              xhrFields: {
                  withCredentials: true
              },
              success: function( val ) {
                  if (!state.admin){
                    if (val.nguoiDang!=state.user){
                      history.push('/ERROR');
                    }
                  }
                  
                  const newData = {
                    option: "form_create_room_1",
                    prev:"",
                    ten:val.ten,
                    diaChi:val.diaChi,
                    dienTich:val.dienTich,
                    soPhong:val.soPhong,
                    soGiuong:val.soGiuong,
                    soKhachToiDa:val.soKhachToiDa,
                    danhSachTienNghi:[],
                    tiennghi:[],
                    hinhAnh: imgSlideTemp,
                    giaNgayThuong:val.giaNgayThuong,
                    giaNgayCuoiTuan:val.giaNgayCuoiTuan,
                    giaNgayLe:val.giaNgayLe,
                    giaThang:-val.giaThang,
                    checkedMorePrice:val.giaNgayLe?true:false||val.giaThang?true:false,
                    gioiThieu:val.gioiThieu,
                    luuY:val.luuY,
                    thoiGianNhan:val.thoiGianNhan,
                    thoiGianTra:val.thoiGianTra,
                    checkInfFill:'',
                    removeInfFill:'',
                    isCheckAgain: false,
                  };
                setData(newData);
                }
              })
              .fail(function() {
                  history.push('/ERROR');
          });
          }
        }
      }
    }, []);
    var childrenWithProps = React.cloneElement(children, {data: data,id:id});
    return (
      <Route
        {...rest}
        render={() =>
          state.type==='login' ? (
            childrenWithProps
          ) : (
            <Redirect
              to={{
                pathname: '/login',
                state: {from:`/host/fix/${id}`}
              }}
            />
          )
        }
      />
    );
}

export default ProtectHostFixRoom;