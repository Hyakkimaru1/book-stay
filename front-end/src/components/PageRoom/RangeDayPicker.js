import React from 'react';
import { DateRangePicker } from 'calcite-react/DatePicker';
export class RangeDayPicker extends React.Component {
      constructor(props) {
        super(props)
        this.state = {
          startDate: null,
          endDate: null,
          focusedInput: this.props.focusedInput,
        }
        this.onDatesChange = this.onDatesChange.bind(this)
        this.onFocusChange = this.onFocusChange.bind(this)
      }
  
      componentWillReceiveProps(props){
        this.setState({
          focusedInput:props.focusedInput,
        });
      }

      onDatesChange({ startDate, endDate }) {
        this.setState({
          startDate,
          endDate,
        });
        this.props.onDatesChange(startDate,endDate);
      }
  
      onFocusChange(focusedInput) {
        this.setState({
          focusedInput,
        });
        if (this.props.handleFocused){
          this.props.handleFocused(focusedInput);
        }
      }
  
      render() {
        return (
          <div>
            <DateRangePicker
              startDate={this.state.startDate}
              startDateId="basicStartDate"
              endDate={this.state.endDate}
              endDateId="basicEndDate"
              onDatesChange={this.onDatesChange}
              focusedInput={this.state.focusedInput}
              onFocusChange={this.onFocusChange}
            />
          </div>
        )
      }
}
  