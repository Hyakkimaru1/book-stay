import React from 'react';
import { DateRangePicker } from 'calcite-react/DatePicker';
export class RangeDayPicker extends React.Component {
      constructor(props) {
        super(props)
        this.state = {
          startDate: null,
          endDate: null,
          focusedInput: null,
        }
        this.onDatesChange = this.onDatesChange.bind(this)
        this.onFocusChange = this.onFocusChange.bind(this)
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
  