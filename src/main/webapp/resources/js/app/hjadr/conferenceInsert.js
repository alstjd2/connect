/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('createRoomForm');
    if (!form) {
        console.error("Form not found");
        return;
    }
    const startDateInput = document.getElementById('startDate');
	console.log(startDateInput);
    if (!startDateInput) {
        console.error("Start date input not found");
        return;
    }

	dataBtn.addEventListener('click', ()=>{
	roomTitle.value = '개발 1팀 회의';
	roomUrlId.value = 'hdcconference11';
	passwd.value = 'java';
	startDate.value = '2024-09-20T11:00';
	});
	

    form.addEventListener('submit', function(event) {
        event.preventDefault();  // 기본 폼 제출 동작을 막음

        // ISO 형식의 startDate 값을 읽어와서
        const localDateTime = startDateInput.value;
        const startDate = startDateInput.value;
        if (localDateTime) {
            const dateObj = new Date(localDateTime);

            // 서버에서 요구하는 형식으로 변환
            const formattedDate = dateObj.toString();

            // 변환된 값을 startDateInput에 다시 설정
            startDateInput.value = formattedDate;
        } else {
            console.error("No start date value found");
        }

        // 기본값 설정
        const roomTypeInput = document.getElementById('roomType');
        if (roomTypeInput) {
            roomTypeInput.value = roomTypeInput.value || 'edu';
        }

        const callTypeInput = document.getElementById('callType');
        if (callTypeInput) {
            callTypeInput.value = callTypeInput.value || 'P2P';  
        }

        const liveModeInput = document.getElementById('liveMode');
        if (liveModeInput) {
            liveModeInput.value = liveModeInput.value || 'false';
        }

        const maxJoinCountInput = document.getElementById('maxJoinCount');
        if (maxJoinCountInput) {
            maxJoinCountInput.value = maxJoinCountInput.value || '16';
        }

        const liveMaxJoinCountInput = document.getElementById('liveMaxJoinCount');
        if (liveMaxJoinCountInput) {
            liveMaxJoinCountInput.value = liveMaxJoinCountInput.value || '5';
        }
        const sfuIncludeRoleInput = document.getElementById('sfuIncludeRole');
        if (sfuIncludeRoleInput) {
            sfuIncludeRoleInput.value = sfuIncludeRoleInput.value || 'false';
        }

		new Promise((resolve, reject) => {
            try {
                const formData = new FormData(form);
				formData.set('startDate', startDate);
                fetch('conferenceInsert.do', {
                    method: 'POST',
                    body: formData,
                })
                .then(response => response.text())
                .then(text => {
                    let data;
                    try {
                        data = JSON.parse(text);
                    } catch (e) {
                        console.error("Failed to parse JSON:", e);
                    }
                    return new Promise((resolve, reject) => {
		                form.addEventListener('submit', function() {
		                    resolve(); 
		                }, { once: true }); 
		                form.submit();
		            });
		                })
                .catch(error => {
                    console.error("Error during fetch submission:", error);
                    reject(error);
                });
            } catch (error) {
                reject(error);
            }
        }).then(() => {
            window.location.href = 'conferenceList.do';
        }).catch(error => {
        });
    });

const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success') && urlParams.get('success') === 'true') {
        console.log("Success parameter found");
        Swal.fire({
            icon: 'success',
            title: '화상회의가 생성되었습니다.',
            showConfirmButton: false,
            timer: 1500
        }).then(() => {
            // 알림이 표시된 후 URL 파라미터에서 success 제거
            urlParams.delete('success');
            window.history.replaceState({}, '', `${window.location.pathname}?${urlParams.toString()}`);
        });
    }


});


