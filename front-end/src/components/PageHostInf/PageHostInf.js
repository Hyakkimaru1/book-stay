import React, { useEffect, useState } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import $ from 'jquery';
import moment from 'moment';
import CardDetail from '../CardDetail/CardDetail';
const config = require('../../config/default.json');

const PageHostInf = () => {
    const { id } = useParams();
    const [hostInf,setHostInf] = useState(null);
    const history = useHistory();
    const [rooms,setRooms] = useState(null);
    useEffect(() => {
        $.get(`${config.url}/host/${id}`,val => {
            if (val!=='fasle'){
                setHostInf(val);
            }
            else {
                history.push('/ERROR');
            }
        });
        $.get(`${config.url}/host/roomowner/${id}`,val => {
            console.log(val);
            if (val !== "false"){
                setRooms(val);
            }
            else {
                history.push('/ERROR');
            }
        });

    }, []);
    return (
        <div className="row" style={{marginTop:'8rem'}}>
            <div className="col-1-of-4 PageHostInf__inf">
                <img className="PageHostInf__inf--img" src={hostInf && hostInf.avatar} alt=""/>
                <hr className="PageHostInf__inf--hr"/>
                <h1 className="PageHostInf__inf--name">{hostInf && hostInf.ten}</h1>
                <p className="PageHostInf__inf--time">Từ {hostInf&&moment(hostInf.timeCreate).format('DD/MM/YYY')}</p>
                <p className="PageHostInf__inf--intro">{hostInf&&hostInf.gioiThieu}</p>
            </div>
            <div className="col-3-of-4 PageHostInf__rooms" >
             {rooms && rooms.map(val => {
                 let star=0;
                 for (let i = 0;i < val.danhgia.length;i++)
                 {
                    star+=val.danhgia[i].danhGia;
                 }
                 if (val.danhgia.length){
                    star=star/val.danhgia.length;
                    return <CardDetail id={val.id} ten={val.ten} diaChi={val.diaChi} giaNgayThuong={val.giaNgayThuong} img={val.img} soKhachToiDa={val.soKhachToiDa} soPhong={val.soPhong} soGiuong={val.soGiuong} star={parseInt(star, 10)}/>
                 }
                 return <CardDetail/>
                 
             })}
            </div>
        </div>
    );
}

export default PageHostInf;
