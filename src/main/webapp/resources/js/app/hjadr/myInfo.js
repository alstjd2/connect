function showToast(message, type = 'success') {
    var toastContainer = document.getElementById('toast-container');
    if (!toastContainer) {
        console.error('Toast container not found!');
        return;
    }

    var toastTemplate = document.getElementById('toast-template');
    if (!toastTemplate) {
        console.error('Toast template not found!');
        return;
    }

    var toastClone = toastTemplate.cloneNode(true);
    toastClone.querySelector('.toast-body').textContent = message;
    toastClone.classList.add('bg-' + type);

    // Remove the ID to prevent duplicate IDs
    toastClone.removeAttribute('id');

    toastContainer.appendChild(toastClone);

    var toast = new bootstrap.Toast(toastClone);
    toast.show();

    // 자동으로 토스트를 숨기기 위해 타이머 설정
    setTimeout(function () {
        toast.hide(); // 토스트 숨기기
    }, 1000); // 3초 후
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('submitbtn').addEventListener('click', function(event) {
        event.preventDefault();
        
        var form = document.getElementById('formAccountSettings');
        var currentPassword = document.getElementById('currentPassword').value;
        var newPassword = document.getElementById('newPassword').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
		var empNo = document.querySelector('input[name="empNo"]').value;
		
		if (!currentPassword || !newPassword || !confirmPassword) {
            showToast('모든 데이터를 입력해주세요.', 'danger');
            return;
        }
		
        // 비밀번호 확인 로직
        if (newPassword !== confirmPassword) {
			showToast('변경 비밀번호와 확인 비밀번호가 일치하지 않습니다.', 'danger');
            return;
        }

        var formData = new FormData(form);
		formData.append('empNo', empNo); 
        fetch('changePassword.do', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
				showToast('비밀번호가 변경되었습니다.');
				 form.reset();
            } else {
				showToast('현재 비밀번호가 올바르지 않습니다.', 'danger');
            }
        })
        .catch(error => console.error('Error:', error));
    });
	document.getElementById('upload').addEventListener('change', function() {
    	document.getElementById('imageModified').value = 'true';
	});
	
	 document.getElementById('upload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('uploadedAvatar').src = e.target.result;
            };
            reader.readAsDataURL(file);
            document.getElementById('imageModified').value = 'true';
        }
    });
	// 이벤트 리스너 추가
	document.getElementById('empComtel').addEventListener('input', function() {
	    checkByteLimit(this, 19, '사내번호');
	});
	
	document.getElementById('empTel').addEventListener('input', function() {
	    checkByteLimit(this, 19, '휴대폰번호');
	});
	document.getElementById('empMail').addEventListener('input', function() {
	    checkByteLimit(this, 49, '개인이메일');
	});

const urlParams = new URLSearchParams(window.location.search);
if (urlParams.has('success') && urlParams.get('success') === 'true') {
    Swal.fire({
        icon: 'success',
        title: '수정이 완료되었습니다.',
        showConfirmButton: false,
        timer: 1500
    }).then(() => {
        // 알림이 표시된 후 URL 파라미터에서 success 제거
        urlParams.delete('success');
        window.history.replaceState({}, '', `${window.location.pathname}?${urlParams.toString()}`);
    });
}
    


});


// 바이트 수 계산 함수
function getByteLength(str) {
    return new TextEncoder().encode(str).length;
}

// 입력 제한 함수
function checkByteLimit(inputField, maxBytes, warningMessage) {
    const byteLength = getByteLength(inputField.value);
    if (byteLength > maxBytes) {
        Swal.fire({
            icon: 'warning',
            title: '입력 초과',
            text: `${warningMessage}의 글자 제한을 초과하였습니다. `,
            showConfirmButton: false, // 확인 버튼 비활성화
            timer: 1500 // 2초 후 자동 닫힘
        });
        inputField.value = inputField.value.slice(0, maxBytes);
    }
}

