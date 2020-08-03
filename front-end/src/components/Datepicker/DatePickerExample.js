import React, { Component } from 'react';
import DatePicker, { DateRangePicker } from 'calcite-react/DatePicker'
class DatePickerExample extends React.Component {
    constructor(props) {
    super(props)
    this.state = {
        date: null,
        datePickerFocused: false,
    }
    this.onDateChange = this.onDateChange.bind(this)
    this.onFocusChange = this.onFocusChange.bind(this)
    }

    onDateChange(date) {
        this.setState({
            date,
        })
        this.props.onDateChange(date);
    }

    onFocusChange({ focused }) {
    this.setState({
        datePickerFocused: focused,
    })
    }
    componentDidMount(){
        document.getElementById('basicDatePicker').style.marginTop = '0.8rem'; 
    }

    render() {
    return (
        <DatePicker
        id="basicDatePicker"
        date={this.state.date}
        onDateChange={this.onDateChange}
        focused={this.state.datePickerFocused}
        onFocusChange={this.onFocusChange}
        numberOfMonths={1}
        placeholder="Hết phòng"
        />
    )
    }
}
export default DatePickerExample;
