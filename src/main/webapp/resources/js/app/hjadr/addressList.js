/**
외부주소록
 */

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



function toggleBookmark(element) {
    var contextPath = "${pageContext.request.contextPath}";
    var adrNo = element.getAttribute('data-adr-no');
    var markyn = element.classList.contains('bxs-star') ? 'N' : 'Y';

    fetch('toggleBookmark.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ adrNo: adrNo, markyn: markyn })
    })
    .then(response => response.json())  // JSON 응답 처리
    .then(data => {
        if (data.status === 'Success') {
            showToast('즐겨찾기가 변경되었습니다.');
            element.classList.toggle('bxs-star');
            element.classList.toggle('bx-star');
        } else {
            showToast('처리 중 오류가 발생했습니다.', 'danger');
        }
    })
    .catch(error => console.error('Error:', error));
}

	dataBtn.addEventListener('click', ()=>{
	adrNm.value = '김정우';
	adrAff.value = '대덕';
	adrPos.value = '대리';
	adrOnepos.value = '일반직';
	adrDep.value = '개발부';
	adrTel.value = '010-8462-4695';
	adrMail.value = 'hwanghyewon8@gmail.com';
});

$(document).ready(function() {
	
	
	
	$('#modalCenter .btn-primary').on('click', function(e) {
    e.preventDefault(); 

    var form = $('#modalCenter form');
    var formData = form.serializeArray();
    var data = {};
    
    $.each(formData, function() {
        if (data[this.name]) {
            if (!data[this.name].push) {
                data[this.name] = [data[this.name]];
            }
            data[this.name].push(this.value || '');
        } else {
            data[this.name] = this.value || '';
        }
    });

    // 필수 필드 확인
    if (!data['adrTel']) {
		showToast('전화번호는 필수 입력 항목입니다.', 'danger');
        return;
    }
    if (!data['adrNm']) {
		showToast('이름은 필수 입력 항목입니다.', 'danger');
        return;
    }
	// 전화번호 글자 수 확인
        if (data['adrTel'].length > 13) {
            showToast('전화번호는 13자 이하로 입력해주세요.', 'danger');
            return;
        }

    $.ajax({
        url: form.attr('action'),
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),

        success: function(response) {
                $('#modalCenter').modal('hide');
                Swal.fire({
                    icon: 'success',
                    title: '확인!',
                    text: '외부 주소록이 성공적으로 추가되었습니다.',
                    confirmButtonText: '확인'
                }).then(() => {
                    location.reload(); // 페이지 새로고침
                });
            },
        error: function(xhr, status, error) {
            var errorMessages = xhr.responseJSON;
            console.error('Error adding address:', errorMessages);
            $('#modalCenter .modal-body').append('<div class="alert alert-danger">주소록 추가에 실패했습니다.</div>');
        }
    });
});

});

document.addEventListener('DOMContentLoaded', function() {
	    // 페이지 로드 시 성공적으로 수정되었다면 알림을 표시
	    const urlParams = new URLSearchParams(window.location.search);
	    if (urlParams.has('success') && urlParams.get('success') === 'true') {
	        console.log("Success parameter found");
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
