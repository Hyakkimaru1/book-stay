var moment = require('moment');
const config = require('../config/default.json');

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

function cast(newStartDay,newEndDate,caseNormal,caseWeekend){
  return checkNormalDays(newStartDay,newEndDate)*caseNormal+checkWeekdays(newStartDay,newEndDate)*caseWeekend
}

function castService(newStartDay,newEndDate,caseNormal,caseWeekend){
  return (checkNormalDays(newStartDay,newEndDate)*caseNormal+checkWeekdays(newStartDay,newEndDate)*caseWeekend)*config.castService;
}

function castTotal(newStartDay,newEndDate,caseNormal,caseWeekend){
  const castTotal = cast(newStartDay,newEndDate,caseNormal,caseWeekend);
  return castTotal+castTotal*config.castService;
}


export {checkWeekdays,checkNormalDays,checkDays,cast,castService,castTotal}
