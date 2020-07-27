import React,{useEffect} from 'react';
import {toast } from 'react-toastify';

import 'react-toastify/dist/ReactToastify.css';

const OptionBar = (props) => {
    
    function handleClick(e){
        const id = e.target.id;
        props.updateInfFill();
        if (id!=='form_create_room_5'){ 
            if (props.current==="form_create_room_1"){ 
                if (!props.checkNameRoomFill()){
                    document.getElementById('navCreate_fill_1').classList.add("navCreate__info--hide");
                }
                else {
                    document.getElementById('navCreate_fill_1').classList.remove("navCreate__info--hide");
                }
            }
            else if (props.current==="form_create_room_2"){ 
                if (!props.checkMoreInfFill()){
                    document.getElementById('navCreate_fill_2').classList.add("navCreate__info--hide");
                }
                else {
                    document.getElementById('navCreate_fill_2').classList.remove("navCreate__info--hide");
                }
            }
            else if (props.current==="form_create_room_3"){ 
                if (!props.checkImgsFill()){
                    document.getElementById('navCreate_fill_3').classList.add("navCreate__info--hide");
                }
                else {
                    document.getElementById('navCreate_fill_3').classList.remove("navCreate__info--hide");
                }
            }
            else if (props.current==="form_create_room_4"){ 
                if (!props.checkPriceFill()){
                    document.getElementById('navCreate_fill_4').classList.add("navCreate__info--hide");
                }
                else {
                    document.getElementById('navCreate_fill_4').classList.remove("navCreate__info--hide");
                }
            }
            props.onClick(id);
            document.getElementById(props.current).classList.add("navCreate__info--notAcvite");
            document.getElementById(id).classList.remove("navCreate__info--notAcvite");
        }
        else {
            if (props.checkImgsFill() && props.checkNameRoomFill() && props.checkMoreInfFill() && props.checkPriceFill()){
                props.onClick(id);
                document.getElementById(props.current).classList.add("navCreate__info--notAcvite");
                document.getElementById(id).classList.remove("navCreate__info--notAllowed");
                document.getElementById(id).classList.remove("navCreate__info--notAcvite");
            }
            else {
                document.getElementById('form_create_room_5').classList.add("navCreate__info--notAllowed");
                toast.error('Vui lòng điền đủ thông tin');
            }
        }
    }
    useEffect(() => {
        if (props.prev){
            document.getElementById(props.prev).classList.add("navCreate__info--notAcvite");
        }
        if (props.current==='form_create_room_5'){
            document.getElementById(props.current).classList.remove("navCreate__info--notAllowed");
            document.getElementById(props.current).classList.remove("navCreate__info--notAcvite");
        }
        else document.getElementById(props.current).classList.remove("navCreate__info--notAcvite");

        if (props.removeInfFill!==''){
            document.getElementById(props.removeInfFill).classList.add("navCreate__info--hide");
        }

        if (props.checkInfFill!==''){
            document.getElementById(props.checkInfFill).classList.remove("navCreate__info--hide");
        }
        
    }, [props]);

    return (
        <div className="navCreate">
            
                <div className="navCreate__info navCreate__info--notAcvite" id="form_create_room_1" onClick={handleClick}>
                    Tên và địa điểm
                    <svg id="navCreate_fill_1" className="navCreate__info--tick navCreate__info--hide" viewBox="0 0 128 128" width="1em" height="1em" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm38.2 42.2l-44 44a6 6 0 0 1-8.4 0l-24-24a6 6 0 0 1 8.4-8.4L54 81.5l39.8-39.7a6 6 0 1 1 8.5 8.4z"></path></svg>
                </div>
                <div className="navCreate__info navCreate__info--notAcvite" id="form_create_room_2" onClick={handleClick}>
                    Cài đặt chỗ nghỉ
                    <svg id="navCreate_fill_2" className="navCreate__info--tick navCreate__info--hide" viewBox="0 0 128 128" width="1em" height="1em" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm38.2 42.2l-44 44a6 6 0 0 1-8.4 0l-24-24a6 6 0 0 1 8.4-8.4L54 81.5l39.8-39.7a6 6 0 1 1 8.5 8.4z"></path></svg>
                </div>
                <div className="navCreate__info navCreate__info--notAcvite" id="form_create_room_3" onClick={handleClick}>
                    Ảnh
                    <svg id="navCreate_fill_3" className="navCreate__info--tick navCreate__info--hide" viewBox="0 0 128 128" width="1em" height="1em" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm38.2 42.2l-44 44a6 6 0 0 1-8.4 0l-24-24a6 6 0 0 1 8.4-8.4L54 81.5l39.8-39.7a6 6 0 1 1 8.5 8.4z"></path></svg>
                </div>
                <div  className="navCreate__info navCreate__info--notAcvite" id="form_create_room_4" onClick={handleClick}>
                    Giá và lịch
                    <svg id="navCreate_fill_4" className="navCreate__info--tick navCreate__info--hide" viewBox="0 0 128 128" width="1em" height="1em" focusable="false"><path d="M64 8a56 56 0 1 0 56 56A56 56 0 0 0 64 8zm38.2 42.2l-44 44a6 6 0 0 1-8.4 0l-24-24a6 6 0 0 1 8.4-8.4L54 81.5l39.8-39.7a6 6 0 1 1 8.5 8.4z"></path></svg>
                </div>
                <div className="navCreate__info navCreate__info--notAllowed navCreate__info--notAcvite" id="form_create_room_5" onClick={handleClick}>
                    Xem và hoàn tất
                </div>
        </div>
    );
}

export default OptionBar;
