import React, {useState, Component } from 'react';
import {ReactComponent as DownIcon} from '../../icons/down-arrow.svg';
import {ReactComponent as Car} from '../../icons/pickup-car.svg';
import {ReactComponent as Home} from '../../icons/browser.svg';
import MBDropdown from './MBDropdown';
import BookHomestay from './BookHomestay';
import BookCar from './BookCar';
import {RangeDayPicker} from '../PageRoom/RangeDayPicker';

const MyBooking = () => {
    const [open, setOpen] = useState(false);
 
    const [homestay, setHomestay] = useState(false);
    const [select, setSelect] = useState("Tất cả chỗ đặt");

    const [quantity,setQuantity] = useState(1);
    const [startDay,setStartDay] = useState(null);
    const [endDate,setEndDate] = useState(null);

    const handleChange = (e) =>{
        setSelect(e);
       
    }



    return (
        <div className="mybooking">
            <div className="mybooking__info">
                <div className="mybooking__info--tag">
                    <div className="row">
                        <div className="col-2-of-3 ">
                            <div className="col-1-of-3">
                            <div className="mybooking__info--tag-box">
                            <a className="mybooking__place" onClick={()=> setOpen(!open)}>
                                <div className="mybooking__place--select">
                                <span>{select}</span>

                                <div className="mybooking__place--icon">
                                <DownIcon/>
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
                                    <div className="row">
                                        <div className="col-2-of-3">
                                            <div className="mybooking__frommonth">
                                                <span>Chọn khoảng thời gian</span>

                                                <div className="mybooking__frommonth--range">
                                                        <RangeDayPicker onDatesChange={
                                                        (newStartDay,newEndDate)=>{
                                                            setStartDay(newStartDay);
                                                            setEndDate(newEndDate);
                                                            
                                                        }}/>
                                                </div>

                                                    
                                                                        </div>
                                           
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
                        <a className={homestay?"mybooking__contain--typebar-active":" "} onClick={()=> setHomestay(true)}>
                            <Home/>
                            <span>Homestay</span>
                        </a>
                        <a className={homestay?"":"mybooking__contain--typebar-active"}onClick={()=> setHomestay(false)}>
                            <Car/>
                            <span>Thuê xe ô tô</span>
                        </a>
                    </div>                                    
                </div>
                <div className="mybooking__contain--detail">
                    <div className="mybooking__contain--detail-infor">
                       {homestay? <BookHomestay/>:<BookCar/>}                                 
                    </div>
                </div>                                        



            </div>

        </div>
    )
}

export default MyBooking;