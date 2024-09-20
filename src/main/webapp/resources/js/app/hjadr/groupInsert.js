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

dataBtn.addEventListener('click', ()=>{
	grpNm.value = '개발3팀 교육';
	grpCm.value = '개발 3팀의 교육을 위한 그룹입니다.';
	});
	
$('#modalCenter .btn-primary').on('click', function(e) {
    e.preventDefault();

    var form = $('#modalCenter form');
    var formData = form.serializeArray();
    var data = {
        group: {},
        empNos: []
    };

    $.each(formData, function() {
        if (this.name === 'empNos') {
            data.empNos.push(parseInt(this.value, 10)); // 숫자형으로 변환
        } else {
            data.group[this.name] = this.value || '';
        }
    });

    // 필수 필드 확인
    if (!data.group['grpNm']) {
		showToast('그룹명은 필수 입력 항목입니다.', 'warning');
        return;
    }

    console.log("Sending data:", JSON.stringify(data)); // 전송할 데이터 콘솔에 찍기
	// Tagify 인스턴스 확인
	console.log("TagifyUserList instance:", TagifyUserList);


    // 그룹 추가 요청
    $.ajax({
        url: form.attr('action'),
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            if (response.grpNo) {
                var grpNo = response.grpNo; // 그룹 번호 받기

                // 태그 데이터 수집
                var tags = TagifyUserList ? TagifyUserList.value : []; // TagifyUserList.value에서 태그 데이터 추출
                var tagData = tags.map(tag => ({ empNo: tag.value }));
                

                // 태그 추가 요청
                $.ajax({
                    url: 'addTagsToGroup.do', // 태그 추가를 위한 별도 URL 설정
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ grpNo: grpNo, tags: tagData }), // 그룹 번호와 태그 데이터 전송
					
                    success: function() {
                        $('#modalCenter').modal('hide');
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        var errorMessages = xhr.responseJSON || { message: '태그 추가에 실패했습니다.' };
                        console.error('Error adding tags to group:', errorMessages);
                        $('#modalCenter .modal-body').append('<div class="alert alert-danger">' + errorMessages.message + '</div>');
                    }
                });
            } else {
				showToast('그룹명은 필수 입력 항목입니다.', 'warning');
                $('#modalCenter .modal-body').append('<div class="alert alert-danger">그룹 추가에 실패했습니다.</div>');
            }
        },
        error: function(xhr, status, error) {
			showToast('그룹명은 필수 입력 항목입니다.', 'warning');
            var errorMessages = xhr.responseJSON || { message: '그룹 추가에 실패했습니다.' };
            console.error('Error adding group:', errorMessages);
            $('#modalCenter .modal-body').append('<div class="alert alert-danger">' + errorMessages.message + '</div>');
        }
    });
});
