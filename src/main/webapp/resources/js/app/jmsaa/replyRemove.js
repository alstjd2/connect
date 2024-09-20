function toggleGubunYN(element) {
    var grbReplyNo = element.closest('label').querySelector('.trash-checkbox').getAttribute('data-reply-no');
    console.log("grbGubunNo:", grbReplyNo);

    var userConfirmed = confirm("삭제하시겠습니까?");
    if (!userConfirmed) {
        return; // 사용자가 '취소'를 선택한 경우 함수 종료
    }

    fetch('toggleReplyY.do', {  // 휴지통 관련 엔드포인트
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ grbReplyNo: grbReplyNo })
    })
    .then(response => response.json())  // JSON 응답 처리
    .then(data => {
        if (data.status === 'MovedToTrash') {
            console.log('휴지통으로 이동 성공');
        } else {
            location.reload(true); // 실패했을 경우 페이지 새로고침
            console.log('휴지통 이동 실패');
        }
    })
    .catch(error => console.error('Error:', error));
}
