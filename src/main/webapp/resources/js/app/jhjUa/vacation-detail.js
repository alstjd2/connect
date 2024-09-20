/**
 *
 */



$(document).ready(function() {

  const contextPath = document.body.dataset.contextPath;
  const approvedState = "BB01120"; // Approved state code
  const pendingState = "BB01110"; // Pending state code

  $("#ok-btn").click(function() {
    const currentState = $("#appState").val(); // Get application state from hidden field (or modify selector if needed)

    if (currentState === pendingState) {
      Swal.fire({
        title: '승인하시겠습니까?',
        text: "한번 승인하면 수정이 불가능합니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
         confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
          $("#vacationForm").submit();
        }
      });
    } else {
      Swal.fire('이미 처리된 휴가신청입니다.', '', 'info');
    }
  });

  $("#no-btn").click(function() {
    const currentState = $("#appState").val();

    if (currentState === pendingState) {
      Swal.fire({
        title: '반려하시겠습니까?',
        text: "한번 반려하면 수정이 불가능합니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
         confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
          $("#vacationForm").attr("action", `${contextPath}/gw/department/compaionApplication.do`);
          $("#vacationForm").submit();
        }
      });
    } else {
      Swal.fire('이미 처리된 휴가신청입니다.', '', 'info');
    }
  });
});
