import React, { useEffect, useState,useContext } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import ItemRoom from './ItemRoom';
import $ from 'jquery';
import moment from 'moment';
import { UserContext } from '../../UserContext';

const config = require('../../config/default.json');


const ManageRooms = () => {
    const { id } = useParams();
    const [state] = useContext(UserContext);
    const history = useHistory();
    const [data,setData] = useState(null);

    useEffect(() => {
        if (state.user === null){
            history.push('/ERROR');
        }
        $.ajax({
            url:`${config.url}/host/managerooms`,
            type:'get',
            xhrFields: {
                withCredentials: true
            }, success: (val)=>{
                console.log(val);
                setData(val);
            }});
    }, []);

    const handleClickAdd = () => {
        history.push('/host/create');
    }

    return (
        <div style={{backgroundColor: '#F8F8F8'}}>
            <div style={{marginTop:'10rem'}} className="row">
                <div style={{display:'flex',justifyContent:'flex-end'}}>
                    <button onClick={handleClickAdd} style={{marginTop:'2rem',backgroundColor:'#f68a39'}} type="" class="bt__default OutOfRoom__bt"> <i class="fas fa-plus"></i> Thêm</button>
                </div>
                <div>
                    {
                        data&&data.map((val,i)=><ItemRoom key="i" data={val}/>)
                    } 
                </div>
            </div>
        </div>
        );
}

export default ManageRooms;
