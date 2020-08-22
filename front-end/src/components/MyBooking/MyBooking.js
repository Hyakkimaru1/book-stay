import React, { useState, Component,useContext,useEffect } from 'react';
import { ReactComponent as DownIcon } from '../../icons/down-arrow.svg';
import { ReactComponent as Car } from '../../icons/pickup-car.svg';
import { ReactComponent as Home } from '../../icons/browser.svg';
import MBDropdown from './MBDropdown';
import BookHomestay from './BookHomestay';
import queryString from "query-string";
import BookCar from './BookCar';

import { UserContext } from '../../UserContext';
import { RangeDayPickerNav } from '../PageRoom/RangeDayPickerNav';

import $ from 'jquery';

const config = require('../../config/default.json');

const MyBooking = () => {
    const [open, setOpen] = useState(false);

    const [homestay, setHomestay] = useState(true);
    const [select, setSelect] = useState("Tất cả chỗ đặt");
    const [state, dispatch] = useContext(UserContext);
    const [filter,setFilter] = useState({});
    const [data,setData] = useState([]);
    const [startDay, setStartDay] = useState(null);
    const [endDate, setEndDate] = useState(null);

    useEffect(() => {
        const paramString = queryString.stringify(filter);
        $.ajax({
            url: `${config.url}/user/mybooking/${state.user}?`+paramString,
            type: 'get',
            //contentType: 'application/json; charset=utf-8',
            xhrFields: {
                withCredentials: true
            }, success: (result) => {
                setData(result);
            }
        });


    }, [filter]);

    const refresh = ()=>{
        setFilter({...filter});
    }

    const handleChange = (e) => {
        setSelect(e);
        switch (e) {
            case 'Tất cả chỗ đặt':
                setFilter({...filter,trangthai: null,hoantat:null});
                break;
            case 'Sắp tới':
                setFilter({...filter,trangthai: 1,hoantat:true});
                break;
            case 'Chờ thanh toán':
                setFilter({...filter,trangthai: 0,hoantat:null});
                break;
            case 'Hoàn tất thanh toán':
                setFilter({...filter,trangthai: 1,hoantat:null});
                break;
            case 'Không thành công':
                setFilter({...filter,trangthai: -1,hoantat:null});
                break;
            default:
                break;
        }
    }

    return (
        <div className="mybooking">
            <div className="mybooking__info">
                <div className="mybooking__info--tag">
                    <div className="row">
                        <div className="col-2-of-3 ">
                            <div className="col-1-of-3">
                                <div className="mybooking__info--tag-box">
                                    <a className="mybooking__place" onClick={() => setOpen(!open)}>
                                        <div className="mybooking__place--select">
                                            <span>{select}</span>

                                            <div className="mybooking__place--icon">
                                                <DownIcon />
                                            </div>
                                        </div>
                                        {open && <MBDropdown
                                            onClick={handleChange}
                                        />
                                        }
                                    </a>
                                    <div className="mybooking__textbelow">
                                        <span> Tổng số</span>
                                    </div>
                                </div>
                            </div>

                            <div className="col-2-of-3 ">
                                <div className="mybooking__info--tag-boxdate">
                                    <div className="mybooking__frommonth">
                                        <span>Chọn khoảng thời gian check in</span>

                                        <div className="mybooking__frommonth--range">
                                            <RangeDayPickerNav onDatesChange={
                                                (newStartDay, newEndDate) => {
                                                    if (newStartDay!=null && newEndDate!=null){
                                                        setFilter({...filter,ngaycheckin:newStartDay.format('YYYY-MM-DD'),ngaycheckout:newEndDate.format('YYYY-MM-DD')});
                                                    }
                                                    else if (newStartDay!=null){
                                                        setFilter({...filter,ngaycheckin:newStartDay.format('YYYY-MM-DD')});
                                                    }
                                                    else if (newEndDate!=null){
                                                        setFilter({...filter,ngaycheckout:newEndDate.format('YYYY-MM-DD')});
                                                    }
                                                }} />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div className="mybooking__contain">
                <div className="mybooking__contain--typebar">
                    <div className="mybooking__contain--typebar-type">
                        <a className={homestay ? "mybooking__contain--typebar-active" : " "} onClick={() => setHomestay(true)}>
                            <Home />
                            <span>Homestay</span>
                        </a>
                    </div>
                </div>
                <div className="mybooking__contain--detail">
                    <div className="mybooking__contain--detail-infor">
                        <BookHomestay refresh={refresh} data={data} select={select} />
                    </div>
                </div>



            </div>

        </div>
    )
}

export default MyBooking;