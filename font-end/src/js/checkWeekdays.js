var moment = require('moment');

function checkWeekdays(start, end) {
    start = moment(start); // use a clone
    var weekdays = 0; 
    while (start < end) {
      if (start.day() === 6 || start.day() === 0) {
        weekdays ++;
      }
      start = start.dayOfYear(start.dayOfYear() + 1);
    }
    return weekdays;
}

function checkNormalDays(start, end) {
    start = moment(start); // use a clone
    var normalDays = 0; 
    while (start < end) {
      if (start.day() !== 6 && start.day() !== 0) {
        normalDays ++;
      }
      start = start.dayOfYear(start.dayOfYear() + 1);
    }
    return normalDays;
}

function checkDays(start, end) {
  start = moment(start); // use a clone
  var normalDays = 0; 
  while (start < end) {
      normalDays ++;
    start = start.dayOfYear(start.dayOfYear() + 1);
  }
  if (normalDays === 0){
    return '';
  }
  return normalDays+' ';
}


export {checkWeekdays,checkNormalDays,checkDays}
