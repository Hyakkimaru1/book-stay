import React,{useEffect, useState} from 'react';
import Slide from './Slide';
import BodyPage from './BodyPage';
import CardDetail from '../CardDetail/CardDetail';
import $ from 'jquery';
import { ToastContainer } from 'react-toastify';
import {
    useParams, Redirect 
} from "react-router-dom";

const config = require('../../config/default.json'); 

const PageRoom = () => {
    const { id } = useParams();
    const [checkLength,setCheckLength] = useState(true);
    useEffect(() => {
        $.get(`${config.url}/room/isRoom/${id}`, (data) => {
            if (!data.val){
                setCheckLength(false);
            }
        });
        /*
        history.push({
            pathname: `/rooms/${id}`,
          });
        console.log(history); */
    }, [id]);

    if (!isNaN(id) && checkLength)
    {  return (
        <div>
            <div id="loader" className="loaderBackground">
                <div className="loader"></div>
            </div>
            
            <div>
                <ToastContainer/>
                <Slide id={id}/>
                <BodyPage id={id}/>
                <div className="cozy__title row" style={{ padding: '.2rem' }}>
                    <div style={{ marginBottom: '1.6rem' }} className="cozy__title">Chỗ ở tương tự</div>
                    <CardDetail />
                </div>

            </div>
        </div>
        );
    }
    else {
        return (<Redirect to="/error"></Redirect>)
    }
}

export default PageRoom;

