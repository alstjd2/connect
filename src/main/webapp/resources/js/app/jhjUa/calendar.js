document.addEventListener('DOMContentLoaded', function(e) {

  // 개인일정 시작일과 종료일
  const personalStartDateInput = document.getElementById('startDate');
  const personalEndDateInput = document.getElementById('todoEnd');

  const personalConfigStartDate = {
    enableTime: true, // 시간 입력 가능
    locale: 'ko', // 한국어 로케일 사용
    onChange: function(selectedDates, dateStr, instance) {
      if (!personalEndDateInput.value || new Date(personalEndDateInput.value) < new Date(dateStr)) {
        personalEndDateInput.value = dateStr;
        personalEndPicker.setDate(dateStr);
      }
    }
  };

  const personalConfigEndDate = {
    enableTime: true,
    locale: 'ko'
  };

  const personalStartPicker = flatpickr(personalStartDateInput, personalConfigStartDate);
  const personalEndPicker = flatpickr(personalEndDateInput, personalConfigEndDate);

  // 부서일정 시작일과 종료일
  const departmentStartDateInput = document.getElementById('todoStart');
  const departmentEndDateInput = document.getElementById('todoDepEnd');

  const departmentConfigStartDate = {
    enableTime: true,
    locale: 'ko',
    onChange: function(selectedDates, dateStr, instance) {
      if (!departmentEndDateInput.value || new Date(departmentEndDateInput.value) < new Date(dateStr)) {
        departmentEndDateInput.value = dateStr;
        departmentEndPicker.setDate(dateStr);
      }
    }
  };

  const departmentConfigEndDate = {
    enableTime: true,
    locale: 'ko'
  };

  const departmentStartPicker = flatpickr(departmentStartDateInput, departmentConfigStartDate);
  const departmentEndPicker = flatpickr(departmentEndDateInput, departmentConfigEndDate);

});
