import React, { useEffect, useState } from 'react';
import LiReview from './LiReview';
import $ from 'jquery';
var moment = require('moment');
const config = require('../../../../config/default.json');


const ListReview = (props) => {
    const [comment,setComment] = useState([]); 
    useEffect(() => {
        $.get(`${config.url}/room/comment/${props.id}`,val=>{
            setComment(val);
        }); 
    }, [props.id]);
    let commentShow=[];
    if (props.number!=='full'){
        if (comment.length>=3){
            for (let i = 0; i < 3;i++){
                commentShow.push(comment[i]);
            }
        }
        else commentShow=comment;
    }
    else commentShow = comment;
    
    return (
        <div>
             <ul className="review">
                {
                    commentShow.map(cm=>{
                        return  <LiReview name={cm.ten} days={moment(cm.timeCreate).format('DD/MM/YYYY')} star={cm.danhGia.toString()} img={cm.avatar} review={cm.comment}/>
                     }
                    )
                }
                </ul>
          
        </div>
    );
}

export default ListReview;
