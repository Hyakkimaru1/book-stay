import React,{useEffect} from 'react';
import {ReactComponent as Policy} from '../../icons/policy.svg'
const CancellationPolicy = () => {
    useEffect(() => {
        window.scrollTo(0, 0)
      }, [])
    return (
        <div className="row" style={{marginTop:'10rem',textAlign:'center'}}>
            <h1 style={{fontSize:'7.2rem'}}>Chính sách hủy phòng</h1>
            <div style={{fontSize:'1.6rem',marginBottom:'5rem'}}>
                Miễn phí hủy phòng trong vòng 48h sau khi đặt phòng thành công và trước 1 ngày so với thời gian check-in. Sau đó, hủy phòng trước 1 ngày so với thời gian check-in, được hoàn lại 100% tổng số tiền đã trả (trừ phí dịch vụ)
            </div>
            <div>
                <Policy/>
            </div>
        </div>
    );
}

export default CancellationPolicy;
