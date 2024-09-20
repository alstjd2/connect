/**
 *
 */


  $(document).ready(function() {
  $("#insertForm").submit(function(event) {
    const contextPath = document.body.dataset.contextPath;
    event.preventDefault();
	console.log(this);
    // AJAX를 이용한 폼 제출 (선택 사항)
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: $(this).serialize(),
      success: function(response) {
        Swal.fire({
          icon: 'success',
          title: '성공',
          text: '특별휴가 부여가 성공적으로 완료되었습니다.',
          confirmButtonText: '확인',
          showDenyButton: false,
          showCancelButton: false,
	      customClass: {
			    confirmButton: 'swal2-confirm btn btn-primary'
			  }
        }).then((result) => {
          if (result.isConfirmed) {
            // 성공 후 처리 (예: 페이지 이동)
            location.href = `${contextPath}/gw/application/vacation.do` ;
          }
        });
      },
      error: function(xhr, status, error) {
        // 에러 처리
        Swal.fire({
          icon: 'error',
          title: '오류',
          text: '특별휴가 부여에 실패했습니다.',
          confirmButtonText: '확인',
          showDenyButton: false,
          showCancelButton: false,
		  customClass: {
			    confirmButton: 'swal2-confirm btn btn-primary'
			  }

        });
      }
    });
  });
});