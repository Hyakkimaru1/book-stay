import React, { useEffect,useState,useContext } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import $ from 'jquery';
import { UserContext } from '../../../UserContext';
import HeaderOFR from './HeaderOFR';
import moment from 'moment';
import BodyOFR from './BodyOFR';
import { toast } from 'react-toastify';
import Swal from 'sweetalert2';
const config = require('../../../config/default.json');

const OutOfRoom = () => {
    const {id} = useParams();
    const history = useHistory();
    const [state] = useContext(UserContext);
    const [data,setData] = useState();
    const curDate = new Date();
    const [option,setOption] = useState('valid');
    const [idDel,setIdDel] = useState(-1);
    const [addRow,setAddrow] = useState(null);
    useEffect(() => {
        async function fetchDel() {
            if (idDel!==-1){
                await Swal.fire({
                    title: 'Bạn có chắc muốn thay đổi?',
                    text: "Điều này sẽ làm thay đổi phòng bạn đã đăng!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Đồng ý!',
                    cancelButtonText:'Cân nhắc lại'
                  }).then( async (result) => {
                    if (result.value) {
                        await $.ajax({
                            url:`${config.url}/host/outofroom/${id}`,
                            type:'post',
                            data:{id:idDel},
                            xhrFields: {
                                withCredentials: true
                            }, success: ()=>{                           
                                toast.success('Xoá thành công')
                            },fail: (()=>{
                                toast.error('Xoá thất bại.')
                            })
                        });
                    }
                }) 
                setIdDel(-1); 
            }

            if (addRow){
                let allowAdd=true;
                for (let index=0;index<data.ngayHetPhong.length;index++){
                    if (moment(data.ngayHetPhong[index].ngayHetPhong).isSame(addRow)){
                        allowAdd=false;
                        break;
                    }
                }
                if (allowAdd){
                    await $.ajax({
                        url:`${config.url}/host/addoutofroom`,
                        type:'post',
                        data:{phong:id,ngayHetPhong:addRow,permission:1},
                        xhrFields: {
                            withCredentials: true
                        }, success: ()=>{                           
                            toast.success('Thêm thành công')
                        },fail: (()=>{
                            toast.error('Thêm thất bại.')
                        })
                    });
                }
                else {
                    toast.error('Ngày này đã tồn tại.')
                }
                setAddrow(null);
            }

            $.get(`${config.url}/room/${id}`,val => {
                if (val.nguoiDang!==state.user)
                    history.push('/ERROR');
                //Set data
                setData(val);
            }).fail(()=>history.push('/ERROR'));
        }
        fetchDel();
        //get data out of room in SV
        
       
    }, [idDel,addRow]);

    const changeIdDel = (newId)=>{
        setIdDel(newId);
    }

    const handleOnChangeOption = (e)=>{
        setOption(e.target.value);
    }
    const handeAddRow = (newRow) => {
        setAddrow(newRow.format('YYYY-MM-DD'));
    }
    return (
        <div style={{backgroundColor: '#F8F8F8'}}>
        <div style={{marginTop:'10rem'}} className="row OutOfRoom">
            <h3 className="OutOfRoom__title">Thêm ngày mà phòng bạn hết phòng để tránh khách hàng đặt vào hôm đấy</h3>
           <div>
               <HeaderOFR onClick={handeAddRow}></HeaderOFR>
           </div>
           <hr style={{margin:'2rem 1rem',border:'0',borderTop:'1px solid #CCC'}}/>
           <select onClick={handleOnChangeOption} className="OutOfRoom__header--sel">
                <option value="valid">Chưa diễn ra</option>
                <option value="all">Tất cả</option>
            </select>
           <div className="OutOfRoom__body">
               {
                 data && data.ngayHetPhong.map( val =>{
                    if (option==='valid'){
                        if (moment(val.ngayHetPhong).isBefore(curDate)){
                            return
                        }
                        else {
                            return <BodyOFR onClick={changeIdDel} key={val.id} data={val}/>
                        }
                    }
                    else {
                        return <BodyOFR onClick={changeIdDel} key={val.id} data={val}/>
                    }
                    
                 })
               }
           </div>
        </div>
    </div>
    );
}

export default OutOfRoom;
