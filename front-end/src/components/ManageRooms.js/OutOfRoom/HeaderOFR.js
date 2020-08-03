import React, { useState } from 'react';
import DatePickerExample from '../../Datepicker/DatePickerExample';
import { toast } from 'react-toastify';
const HeaderOFR = (props) => {
    const [datePick,setDatePick] = useState(null);
    const handeChange = (val) => {
        setDatePick(val);
    }
    const handeClick = () => {
        if (datePick){
            props.onClick(datePick);
        }
        else {
            toast.error('Vui lòng chọn ngày.');
        }
    }
    return (
        <div className="OutOfRoom__header">
            <div>
                <DatePickerExample onDateChange={handeChange}></DatePickerExample>
            </div>
            <div className="OutOfRoom__containBT">
                <button onClick={handeClick} type="" class="bt__default OutOfRoom__bt" style={{marginLeft: '5rem'}}><i class="fas fa-plus"></i> Thêm</button> 
            </div>
                            
        </div>
    );
}

export default HeaderOFR;
