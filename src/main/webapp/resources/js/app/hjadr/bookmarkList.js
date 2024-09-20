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
    var markNo = element.getAttribute('data-mark-no');
    var empNo = element.getAttribute('data-emp-no');
    var isChecked = element.classList.contains('bxs-star'); // 현재 상태 확인
    var url = isChecked ? 'orgbookmarkD' : 'orgbookmarkY'; // URL 설정

    var data = {
        markNo: markNo, 
        empNo: empNo
    };
//    console.log(markNo);
//    console.log(empNo);

    // AJAX 요청
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        if (result.status === 'success') {
            // 상태에 따라 아이콘 클래스 변경
            if (isChecked) {
                element.classList.remove('bxs-star');
                element.classList.add('bx-star');
                showToast('즐겨찾기가 해제되었습니다.', 'warning');
            } else {
                element.classList.remove('bx-star');
                element.classList.add('bxs-star');
                showToast('즐겨찾기가 추가되었습니다.');
				const newMarkNo = result.markNo; // 서버에서 받은 markNo
                element.setAttribute('data-mark-no', newMarkNo);
            }
        } else {
            showToast('처리 중 오류가 발생했습니다.', 'danger');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showToast('처리 중 오류가 발생했습니다.', 'danger');
    });
}

