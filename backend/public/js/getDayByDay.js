var moment = require('moment');

module.exports = function dayByDay(start, end) {
  start = moment(start); // use a clone
  end = moment(end);
  var arrayDays = []; 
  while (start < end) {
    arrayDays.push(moment(start).format('YYYY-MM-DD'));
    start = start.dayOfYear(start.dayOfYear() + 1);
  }
  return arrayDays;
}
