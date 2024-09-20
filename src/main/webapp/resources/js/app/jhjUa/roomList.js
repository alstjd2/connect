/**
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
	const roomDetailModal = document.getElementById('roomDetailModal');
	const contextPath = document.body.dataset.contextPath;

	roomDetailModal.addEventListener('show.bs.modal', function(event) {
		const button = event.relatedTarget;
		const roomNm = button.getAttribute('data-roomnm');
		const roomLoc = button.getAttribute('data-roomloc');
		const roomEmpmax = button.getAttribute('data-roomempmax');
		const roomNo = button.getAttribute('data-roomno'); // Get roomNo from data attribute

        // 모달이 열릴 때 닫기 버튼에 포커스 강제 설정
        const closeButton = roomDetailModal.querySelector('.btn-close');
        closeButton.focus();

		// Populate modal fields
		roomDetailModal.querySelector('#roomNm').value = roomNm;
		roomDetailModal.querySelector('#roomLoc').value = roomLoc;
		roomDetailModal.querySelector('#roomEmpmax').value = roomEmpmax;

		// Set the update link dynamically
		const updateLink = roomDetailModal.querySelector('#roomUpdateLink');
		updateLink.href = `${contextPath}/gw/room/roomUpdate.do?what=${roomNo}`;

		// Set up the delete functionality
		const deleteButton = roomDetailModal.querySelector("#roomDelete");
		deleteButton.addEventListener('click', function() {
			Swal.fire({
				title: '정말로 회의실을 삭제하시겠습니까?',
				text: "이 작업은 되돌릴 수 없습니다!",
				icon: 'warning',
				showCancelButton: true,
				showDenyButton: false, // Deny 버튼 숨김
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소',
				willOpen: () => {
					// Deny 버튼이 생성되었을 때 삭제
					const denyButton = document.querySelector('.swal2-deny');
					if (denyButton) {
						denyButton.remove(); // 버튼을 DOM에서 완전히 제거
					}
				}
			}).then((result) => {
				if (result.isConfirmed) {
					// Create a form and submit it to perform the delete action
					const deleteForm = document.createElement('form');
					deleteForm.method = 'POST';
					deleteForm.action = `${contextPath}/gw/room/roomDelete.do`;

					const input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'roomNo';
					input.value = roomNo;

					deleteForm.appendChild(input);
					document.body.appendChild(deleteForm);
					deleteForm.submit();
				}
			});
		});
	});
});

