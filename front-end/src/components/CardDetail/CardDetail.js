import React,{useState} from 'react';

const CardDetail = () => {
     // eslint-disable-next-line no-unused-vars
  const [room,setRoom] = useState(5);
  /* useEffect(() => {
     //$.get('')
     return () => {
       cleanup
     };
     //Call only one first Mount
   }, []); */ 
    return (
            <div className="row">
      <div className="col-1-of-4">
        <div className="App">
          <div className="card">
            <header className="card__header"><img className="card__header--img" alt="" src="https://cdn.luxstay.com/rooms/70274/large/288A2591-HDR.jpg"/></header>
            <div className="card__body"> 
              <h3 className="card__body--name">Cozy Apartment 150m to BEACH</h3> 
              <div className="card__body--room">{room} khách · 1 phòng ngủ · 1 phòng tắm</div>
              <div className="card__body--price">1,000,000₫/đêm</div>
              <div className="card__body--place">Hội An, Quảng Nam, Vietnam</div>
            </div>
            <footer className="start"></footer>
          </div>
        </div>
      </div>
      <div className="col-1-of-4">
        <div className="App">
          <div className="card">
            <header className="card__header"><img className="card__header--img" alt="" src="https://cdn.luxstay.com/rooms/32985/large/room_32985_52_1568967191.jpg"/></header>
            <div className="card__body"> 
              <h3 className="card__body--name">RedDoorz Deluxe Room, Central Da Nang - DA 2219</h3> 
              <div className="card__body--room">{room} khách · 1 phòng ngủ · 1 phòng tắm</div>
              <div className="card__body--price">1,000,000₫/đêm</div>
              <div className="card__body--place">Hội An, Quảng Nam, Vietnam</div>
            </div>
            <footer className="start"></footer>
          </div>
        </div>
      </div>
      <div className="col-1-of-4">
        <div className="App">
          <div className="card">
            <header className="card__header"><img className="card__header--img" alt="" src="https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg"/></header>
            <div className="card__body"> 
              <h3 className="card__body--name">Family Suite - Hoi An Reverie Villas</h3> 
              <div className="card__body--room">{room} khách · 1 phòng ngủ · 1 phòng tắm</div>
              <div className="card__body--price">1,000,000₫/đêm</div>
              <div className="card__body--place">Hội An, Quảng Nam, Vietnam</div>
            </div>
            <footer className="start"></footer>
          </div>
        </div>
      </div>
      <div className="col-1-of-4">
        <div className="App">
          <div className="card">
            <header className="card__header">
              <img className="card__header--img" alt="" src="https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg"/>
            </header>
            <div className="card__body"> 
              <h3 className="card__body--name">Family Suite - Hoi An Reverie Villas</h3> 
              <div className="card__body--room">{room} khách · 1 phòng ngủ · 1 phòng tắm</div>
              <div className="card__body--price">1,000,000₫/đêm</div>
              <div className="card__body--place">Hội An, Quảng Nam, Vietnam</div>
            </div>
            <footer className="start"></footer>
          </div>
        </div>
      </div>
    </div>
    );
}

export default CardDetail;
