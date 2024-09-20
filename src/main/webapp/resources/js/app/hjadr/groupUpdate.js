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


$(document).ready(function() {
    $('.btn-primary').on('click', function(e) {
        e.preventDefault();

        var form = $(this).closest('form'); // 버튼을 클릭한 폼을 찾습니다
        var formData = form.serialize(); // 폼 데이터를 직렬화하여 URL 인코딩 형식으로 변환합니다
		var groupName = form.find('input[name="grpNm"]').val();
		
        console.log("Form action URL:", form.attr('action'));
        console.log("Sending data:", formData); // 전송할 데이터 콘솔에 찍기
		
		// 그룹명이 비어 있는지 확인
        if (!groupName) {
            showToast('그룹명을 입력해주세요.', 'danger');
            return; // 폼 제출을 중지
        }
		
        // 그룹 추가 요청
        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            data: formData, // 직렬화된 폼 데이터 전송
            success: function(response) {
                // 폼 제출 후 추가 작업
                var grpNo = $('#jsongrp').val(); 
                if (grpNo) {
                    // 태그 데이터 수집
                    
					var tags = TagifyUserList ? TagifyUserList.value : [];

                    // 태그 데이터가 배열이 아닐 경우 적절히 처리
                    if (!Array.isArray(tags)) {
                        console.error('Tags is not an array:', tags);
                        // 배열로 변환 시도
                        try {
                            tags = JSON.parse(tags); // 문자열이라면 JSON.parse로 배열로 변환
                        } catch (e) {
                            console.error('Failed to parse tags:', e);
                            tags = []; // 변환 실패 시 빈 배열로 초기화
                        }
                    }
					if (tags.length === 0) {
                        console.warn('No tags found, sending empty data');
                    }



                    var tagData = tags.map(tag => ({ empNo: tag.value }));
					
					console.log(tags);
					console.log(tagData);
                    // 태그 추가 요청
                    $.ajax({
                        url: 'addTagsToGroup.do', // 태그 추가를 위한 별도 URL 설정
                        type: 'POST',
						contentType: 'application/json; charset=UTF-8',
                        data: JSON.stringify({ grpNo: grpNo, tags: tagData }), // URL 인코딩 형식으로 데이터 전송
                        success: function() {
                            window.location.href = 'addressgroupList.do';
                        },
                        error: function(xhr, status, error) {
                            var errorMessages = xhr.responseJSON || { message: '태그 추가에 실패했습니다.' };
                            console.error('Error adding tags to group:', errorMessages);
                            $('#modalCenter .modal-body').append('<div class="alert alert-danger">' + errorMessages.message + '</div>');
                        }
                    });
                } else {
                    $('#modalCenter .modal-body').append('<div class="alert alert-danger">그룹 수정에 실패했습니다.</div>');
                }
            },
            error: function(xhr, status, error) {
				showToast('그룹명을 입력해주세요.', 'danger');
                var errorMessages = xhr.responseJSON || { message: '그룹 수정에 실패했습니다.' };
                console.error('Error adding group:', errorMessages);
                $('#modalCenter .modal-body').append('<div class="alert alert-danger">' + errorMessages.message + '</div>');
            }
        });
    });
});
