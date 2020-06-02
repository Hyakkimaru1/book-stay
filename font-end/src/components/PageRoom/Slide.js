import React,{useState} from 'react';
import './BodyPage';
const imgSlide = [
    "https://cdn.luxstay.com/rooms/14008/large/1533543259_2c3a127aa3293fa539387cc7bbe4d17d.jpg",
    "https://cdn.luxstay.com/rooms/14008/large/1533543286_268a2c1ed9f673df23b287dffe6dc8dd.jpg",
    "https://cdn.luxstay.com/rooms/14008/large/1533543292_678c03d50142720f3207ca454ef40153.jpg",
    "https://cdn.luxstay.com/rooms/14008/large/1533543297_920168cb2d25d1537a2cd1cafc3c8275.jpg",
    "https://cdn.luxstay.com/rooms/14008/large/1533543345_4942635_18043006330065132835.jpg",
    "https://cdn.luxstay.com/rooms/14008/large/1533543393_20180502_163053.jpg"
]
let temp = 0;
const Slide = () => {
    const [id,setId] = useState(0);
    return (
        <div style={{overflow:'hidden'}}>
            <div className="slide">
            <i onClick={() => {
                if (id > 0){
                    console.log(temp);
                    temp = temp - 63;
                    document.getElementById('slide_img').style.left = - temp + 'rem';
                    console.log(temp);
                    setId(id-1);
                    if (id <= imgSlide.length-3){
                        document.getElementById('right').style.cursor = 'pointer';
                    }
                    if (id -1 ===0){
                        document.getElementById('left').style.cursor = 'not-allowed';
                    }
                } else {
                    document.getElementById('left').style.cursor = 'not-allowed';
                }
                }
                } 
                className="fas fa-chevron-left slide__left" 
                id="left"></i>
            <div className="slide__img" id="slide_img">
                {
                        imgSlide.map((src,i)=>
                            { 
                                return <div key={i} className = "slide__img--parent"> <img id={i} className="slide__img--pic" key={i+'a'} src={src} alt=""/> </div>;
                            }
                        )
                }
            
                </div>
            <i onClick={() => 
                {
                    if (id < imgSlide.length-3){
                    temp = temp + 63;
                    document.getElementById('slide_img').style.left = - temp + 'rem';
                    setId(id+1);
                    if (id >= 0){
                        document.getElementById('left').style.cursor = 'pointer';
                    }
                    if (id + 1 === imgSlide.length - 3){
                        document.getElementById('right').style.cursor = 'not-allowed';
                    }
                    } else {
                    document.getElementById('right').style.cursor = 'not-allowed';
                    }
                }
                }  className="fas fa-chevron-right slide__right" id="right"></i>       
            </div>
        </div>
    );
}

export default Slide;
