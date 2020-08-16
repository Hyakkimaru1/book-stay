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

    function all(all, type) {
        switch (type) {
            case 'Tất cả chỗ đặt':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Chờ xác nhận':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Chờ thanh toán':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Đã chấp nhận':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Từ chối':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Thành công':
                return all.filter(a => a.trangthai == 1);
                break;
            case 'Không thành công':
                return all.filter(a => a.trangthai == 1);
                break;
            default:
                return all
        }
        return all;
    }
    useEffect(() => {
        $.ajax({
            url: `${config.url}/user/mybooking/${id}`,
            type: 'get',
            //contentType: 'application/json; charset=utf-8',
            xhrFields: {
                withCredentials: true
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
                                return <BookItem id={p.id} name={p.ten} diaChi={p.diaChi} gia={p.gia} soPhong={p.soPhong} />

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

