/**
 * 앱 간반 (Kanban)
 */

document.addEventListener('DOMContentLoaded', function(e) {
	const myOffcanvas = document.getElementById('offcanvasRight')
	myOffcanvas.addEventListener('show.bs.offcanvas', event => {
		let offcanvas = event.target;
		let offcanvasBody = offcanvas.querySelector(".offcanvas-body");
		console.log(event);
		let aTag = event.relatedTarget;
		let url = aTag.dataset.detailUrl;
		console.log(url);
		fetch(url, {
			headers: {
				"accept": "text/html"
			}
		}).then(resp => {
			if (resp.ok) {
				return resp.text();
			} else {
				throw new Error(`상태코드 : ${resp.status}, ${resp.statusText}`);
			}
		}).then((html) => {
			offcanvasBody.innerHTML = html
		}).catch(err => console.error(err));
	})


	function submitTodo() {
		// Form submission logic with validation
		event.preventDefault();

		var startDate = new Date($('#startDate').val());
		var endDate = new Date($('#todoEnd').val());

		if (endDate < startDate) {
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '종료 날짜는 시작 날짜보다 이후여야 합니다.'
			});
		} else {
			// Form submission (if validation passes)
			this.submit();
		}



}
		function submitTodoList() {
			// 폼 제출 막기
			event.preventDefault();

			// 성공 알림
			Swal.fire({
				title: '일정 추가 완료!',
				text: '새로운 일정이 등록되었습니다.',
				icon: 'success',
				confirmButtonText: '확인',
			}).then(() => {
				// 확인 버튼 클릭 시 모달 닫기
				$('#modalCenter').modal('hide');
			});
			// 옵션: 서버 응답 처리 (성공/실패)
			// fetch API 등을 이용하여 서버 응답을 받아 성공/실패에 따라 알림 내용 변경 가능
			return false;
		}

 const deleteButtons = document.querySelectorAll('.deleteButton');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function () {
                const form = this.closest('form');

                Swal.fire({
                    title: '삭제하시겠습니까?',
                    text: "이 작업은 되돌릴 수 없습니다!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '예, 삭제합니다!',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                    }
                });
            });
        });

  const startDateInput = document.getElementById('startDate');
  const endDateInput = document.getElementById('todoEnd');

  const config = {
    enableTime: true, // Enable time input for both pickers
    // Other Flatpickr options (e.g., dateFormat)
    onChange: function(selectedDates, dateStr, instance) {
      endDateInput.value = dateStr; // Set end date to the same value as start date
    }
  };

  flatpickr(startDateInput, config);
  flatpickr(endDateInput, config);

	});


