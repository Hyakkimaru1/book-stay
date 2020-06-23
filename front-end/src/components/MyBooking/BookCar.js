import React from 'react'
import PropTypes from 'prop-types'
import {ReactComponent as Empty} from '../../icons/journal.svg';
function BookCar(props) {
    return (
        <div className="car">
            <div className="car__list">
            <Empty/>
            <span> Danh sách trống!</span>
          
            </div>
            
        </div>
    )
}


export default BookCar

