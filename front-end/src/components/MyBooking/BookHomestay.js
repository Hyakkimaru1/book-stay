import React, { useState, useEffect, useContext } from 'react'
import { UserContext } from '../../UserContext';
import BookItem from './MyBookingItem';
import $ from 'jquery';

//import { Redirect, useLocation, useHistory } from 'react-router-dom';
import { ReactComponent as Empty } from '../../icons/journal.svg';


const config = require('../../config/default.json');

function BookHomestay(props) {

    const [allBooked, setAllBooked] = useState([]);
    const [state, dispatch] = useContext(UserContext);
    var type = 1;
    const id = 1;

    useEffect(() => {
        $.ajax({
            url: `${config.url}/user/mybooking/${id}`,
            type: 'get',
            //contentType: 'application/json; charset=utf-8',

            xhrFields: {
                withCredentials: false
            }, success: (result) => {
                setAllBooked(result);
                 console.log(result);   

            }
        });


    }, [state.user]);
    let myBooked = allBooked;
    const checkType = (type) => {

        switch (type) {
            case 1:
                return (
                    <ul>
                        {
                            myBooked.map(p => {
                                return <BookItem name = {p.ten} diaChi = {p.diaChi} gia = {p.gia} soPhong={p.soPhong}/>

                            })
                        }
                    </ul>


                )

                break;

            default:
                return (
                    <div className="homestay__empty">
                        <Empty />
                        <span> Danh sách trống!</span>

                    </div>
                )

                break;
        }
    }




    return (

        <div className="homestay">
            {
                checkType(1)

            }


        </div>



    )
}




export default BookHomestay

