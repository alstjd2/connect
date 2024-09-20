function toggleBoardmark(element) {
 var contextPath = "${pageContext.request.contextPath}";
    var grbNo = element.getAttribute('data-adr-no');
    var empNo = element.getAttribute('data-emp-no');
    var attNo = element.getAttribute('data-att-no');
    fetch('toggleBoardmark.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ grbNo: grbNo, empNo: empNo, attNo: attNo })
    })
    .then(response => response.json())  // JSON 응답 처리
    .then(data => {
        if (data.status === 'Marked') {
            console.log('북마크 추가 성공');
            // 북마크가 추가되었으므로, 별을 채운 상태로 바꾼다
            element.classList.remove('bx-star');
            element.classList.add('bxs-star');
        } else if (data.status === 'Unmarked') {
            console.log('북마크 제거 성공');
            // 북마크가 제거되었으므로, 별을 빈 상태로 바꾼다
            element.classList.remove('bxs-star');
            element.classList.add('bx-star');
        } else {
            console.log('북마크 처리 실패');
        }
    })
    .catch(error => console.error('Error:', error));
}

	