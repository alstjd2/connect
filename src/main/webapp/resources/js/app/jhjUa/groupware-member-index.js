/**
 *
 */

function submitAttendance(action) {
	const contextPath = document.body.dataset.contextPath;
	var url = contextPath + "/gw/attendance/attendanceInsert.do";
	var data = $("#attendanceForm").serialize() + "&action=" + action;

	// Disable the buttons to prevent multiple clicks
	$('button').prop('disabled', true);

	$.ajax({
		type: "POST",
		url: url,
		data: data,
		success: function(response) {
			// Determine the success message based on the action
			let successMessage = action === 'start' ? '출근처리가 완료되었습니다.' : '퇴근처리가 완료되었습니다.';

			Swal.fire({
				icon: 'success',
				title: '성공',
				text: successMessage,
				confirmButtonText: '확인',
				showDenyButton: false,
				showCancelButton: false,
				customClass: {
					confirmButton: 'swal2-confirm btn btn-primary'
				}
			}).then((result) => {
				if (result.isConfirmed) {
					// If check-in, disable the check-in button and enable the check-out button
					if (action === 'start') {
						$('button[onclick="submitAttendance(\'start\')"]').prop('disabled', true);
						$('button[onclick="submitAttendance(\'end\')"]').prop('disabled', false);
					} else if (action === 'end') {
						// If check-out, disable both buttons
						$('button').prop('disabled', true);
					}

					// Optionally reload or redirect to the main page
					location.href = `${contextPath}/gw/index.do`;
				}
			});
		},
		error: function(xhr, status, error) {
			alert("오류가 발생했습니다. 다시 시도해주세요.");
			console.error("AJAX Error:", status, error);

			// Re-enable the buttons if there's an error
			$('button').prop('disabled', false);
		}
	});



}


