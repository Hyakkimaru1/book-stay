import React,{useState, useEffect} from 'react';
import './BodyPage';
import $ from 'jquery';
const config = require('../../config/default.json'); 

let temp = 0;

const Slide = (props) => {
    const [id,setId] = useState(0);
    const [imgSlide,setImgSlide] = useState([]);
    useEffect(() => {
        $.get(`${config.url}/room/img/${props.id}`, (data) => {
            let imgSlideTemp = [];
            data.map(src=>imgSlideTemp.push(src.img));
            setImgSlide(imgSlideTemp);
            document.getElementById("loader").style.display="none";
        });
        
    }, [props.id]);
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
