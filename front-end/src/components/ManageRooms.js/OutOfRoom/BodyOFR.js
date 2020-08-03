import React, { useEffect } from 'react';
import moment from 'moment';

const BodyOFR = (props) => {
    const curDate = new Date();
    let showOrNot;
    const handeClickDel = ()=>{
        props.onClick(props.data.id);
    }
    if (props.data.permission==1){
        if (moment(props.data.ngayHetPhong).isAfter(curDate)){
            showOrNot = <button  type="" onClick={handeClickDel} class="bt__default OutOfRoom__bt" >Xoá</button> 
        }
    }else {
        showOrNot = <div className="OutOfRoom__item--invalid">
                    Khách đặt
                    </div>
    }
    return (
        <div className="OutOfRoom__item">
            <div className="OutOfRoom__item--date">
                <p style={{display:'inline-block',color:'#666'}}>
                Ngày hết phòng &nbsp;
                </p>
                
                <p style={{display:'inline-block',fontWeight:'700'}}>
                    {  
                        moment(props.data.ngayHetPhong).format('DD/MM/YYYY')
                    }
                </p>
                
            </div>
            <div className="OutOfRoom__item--show">
                
                {showOrNot }
                
            </div>
        </div>
    );
}

export default BodyOFR;
