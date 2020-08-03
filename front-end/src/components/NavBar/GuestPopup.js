import React, {useState, useEffect } from 'react';


const GuestPopup = (props) => {

    const [adult, setAdult] = useState(0);
    const [child, setChild] = useState(0);
    const [baby, setBaby] = useState(0);
    const [sum, setSum] = useState(0);

    



    useEffect(() => {
    if(adult<=0) {
        document.getElementById("adult-decrease").classList.add("is-disabled");
        setAdult(0)
    }
    else document.getElementById("adult-decrease").classList.remove("is-disabled");

    if(child<=0) {
        document.getElementById("child-decrease").classList.add("is-disabled");
        setChild(0);
    }
    else document.getElementById("child-decrease").classList.remove("is-disabled");

    if(baby<=0) {
        document.getElementById("baby-decrease").classList.add("is-disabled");
        setBaby(0);
    }
    else document.getElementById("baby-decrease").classList.remove("is-disabled");

    if((child>0 || baby>0) && adult==0) setAdult(1);
    setSum(adult+child);
    props.Total(sum,baby);
        
    }, [adult,child,baby,sum])
       const clearAll = ()=>
       {
           setAdult(0);
           setBaby(0);
           setChild(0);
       }

    return (
        <div className="guestpopup">

           <div className="guestpopup__item mt-1">
               <div className="guestpopup__item--title">
                   <p>Người lớn</p>
                   
               </div>
              
               <div className="guestpopup__item--input">
               <span role="button" id="adult-decrease" class="guestpopup__item--input-decrease " onClick={()=>setAdult(adult-1)}>
               <p>-</p>
                </span>
                <span role="button" class="guestpopup__item--input-increase "onClick={()=>setAdult(adult+1)}>
                   <p>+</p>
                </span>
                <div className="guestpopup__item--input-number">
                <p >{adult}</p>
                </div>

               </div>


            </div>


            <div className="guestpopup__item mt-4">
               <div className="guestpopup__item--title">
                   <p>Trẻ em</p>
                   <p className="small-text"> Tuổi từ 2-12</p>
                   
               </div>
              
               <div className="guestpopup__item--input mt-6">
               <span role="button" id="child-decrease" class="guestpopup__item--input-decrease " onClick={()=>setChild(child-1)}>
               <p>-</p>
                </span>
                <span role="button" class="guestpopup__item--input-increase "onClick={()=>setChild(child+1)}>
                <p>+</p>
                </span>
                <div className="guestpopup__item--input-number">
                <p >{child}</p>
                </div>

               </div>


            </div>




            
            <div className="guestpopup__item mt-3">
               <div className="guestpopup__item--title">
                   <p>Trẻ sơ sinh</p>
                   <p className="small-text"> Dưới 2 tuổi</p>
                   
               </div>
              
               <div className="guestpopup__item--input mt-6">
               <span role="button" id="baby-decrease" class="guestpopup__item--input-decrease " onClick={()=>setBaby(baby-1)}>
               <p>-</p>
                </span>
                <span role="button" class="guestpopup__item--input-increase "onClick={()=>setBaby(baby+1)}>
                <p>+</p>
                </span>
                <div className="guestpopup__item--input-number">
                <p >{baby}</p>
                </div>

               </div>


            </div>


            <div className="guestpopup__item mt-3">
               
            <span role="button" id="erase" class="guestpopup__item--erase " onClick={clearAll}>
                Xóa
                </span>
                <span role="button" id="apply" class="guestpopup__item--apply " >
                Áp dụng
                </span>



            </div>


        </div>
    );
};





export default GuestPopup;

