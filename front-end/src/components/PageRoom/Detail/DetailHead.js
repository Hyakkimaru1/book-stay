import React,{useState} from 'react';

const styleIcon = {
    width: 18,
    height: 16,
    paddingLeft: 3.5
}

const DetailHead = (props) => {
    const [readMore,setReadMore] = useState(true);
    return (
        <section className="detail__head">
                <div className="detail__head--title">
                    <p>
                        {props.data && props.data.ten}
                    </p>    
                </div>
                <div className="detail__head--locState">
                    <p >
                    <span className="bg__icon"><i style={styleIcon} className="fas fa-map-marker-alt icon"></i></span>
                    {props.data && props.data.diaChi}
                    <a href="#place_map" className="bt__watchMap"> Xem bản đồ</a>
                    </p>
                    <p >
                    <span className="bg__icon"> <i className="fas fa-home icon"></i></span>
                    Căn hộ dịch vụ { props.data && props.data.dienTich} m<sup>2</sup>
                    </p> 
                    <p style={{fontWeight:'300'}}>
                        Phòng riêng . { props.data && props.data.soPhong} phòng, { props.data && props.data.soGiuong} giường, { props.data && props.data.soKhachToiDa} khách tối đa
                    </p> 
                </div>
                <div className="detail__head--intro">
                    <div id = "introPara" style={{lineHeight:'1.5'}} className="detail__head--intro-para">
                       <td dangerouslySetInnerHTML={{__html: props.data && props.data.gioiThieu}} />
                    </div>
                    <p onClick={_ => {
                        if (readMore){
                            document.getElementById("introPara").classList.remove("detail__head--intro-para");
                            document.getElementById("readMore").innerHTML = "Thu gọn";
                        }
                        else {
                            document.getElementById("introPara").classList.add("detail__head--intro-para");
                            document.getElementById("readMore").innerHTML = "Đọc thêm";
                        }
                        setReadMore(!readMore);
                    }} className="detail__head--intro-bt" id="readMore" >Đọc thêm </p>
                </div>
                
            </section>
    );
}

export default DetailHead;
