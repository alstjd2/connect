/**
 *
 */

$(document).ready(function() {
  // 모달이 열릴 때마다 Select2 초기화
  $('#modalCenter').on('shown.bs.modal', function () {
    $('#empNoSelect').select2({
      dropdownParent: $('#modalCenter') // 드롭다운의 부모 요소를 모달로 설정
    });
  });
});
