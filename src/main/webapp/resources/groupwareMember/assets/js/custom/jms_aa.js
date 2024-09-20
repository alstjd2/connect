function toggleBoardmark(element) {
 event.stopPropagation(); // 이벤트 전파 중단
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

dataBtn.addEventListener('click', () => {
    // 게시판 제목과 내용을 자동으로 채움
    title.value = '2024년 09월 19일 개발 3팀 회의록';
    content.value = '신규로 들어온 개발 3팀의 OT에 대한 내용을 정리하여 자료로 올려드립니다. 내용은 파일을 첨부하였으니 확인해주세요.';
	grbAttentionYN.checked = true;
});

function toggleTrashYN(element) {
    var grbNo = element.getAttribute('data-adr-no');
    var empNo = element.getAttribute('data-emp-no');
    
    event.stopPropagation(); // 이벤트 전파 중단

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-primary",
            cancelButton: "btn btn-secondary"
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: "이 항목을 휴지통으로 보내시겠습니까?",
        text: "이 작업은 되돌릴 수 없습니다!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "네, 보내겠습니다!",
        cancelButtonText: "아니요, 취소합니다!"
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '확인'을 선택한 경우
            fetch('toggleTrash.do', {  // 휴지통 관련 엔드포인트
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ grbNo: grbNo, empNo: empNo })
            })
            .then(response => response.json())  // JSON 응답 처리
            .then(data => {
                if (data.status === 'MovedToTrash') {
                    swalWithBootstrapButtons.fire({
                        title: "실패!",
                        text: "휴지통 이동에 실패했습니다.",
                        icon: "error"
                    });
                    console.log('휴지통 이동 성공');
                } else {
                    swalWithBootstrapButtons.fire({
                        title: "삭제되었습니다!",
                        text: "항목이 휴지통으로 이동되었습니다.",
                        icon: "success"
                    }).then(() => {
                        location.reload(true);  // 휴지통으로 이동 후 페이지 리로드
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                swalWithBootstrapButtons.fire({
                    title: "삭제되었습니다!",
                    text: "게시글이 완전히 삭제되었습니다.",
                    icon: "success"
                }).then(() => {
                    location.reload(true);  // 페이지 리로드
                });
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            // 사용자가 '취소'를 선택한 경우
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다",
                text: "취소",
                icon: "error"
            });
        }
    });
}


function toggleTrashN(element) {
    event.stopPropagation(); // 이벤트 전파 중단

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-primary",
            cancelButton: "btn btn-secondary"
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: "이 항목을 복원하시겠습니까?",
        text: "복원된 항목은 다시 활성화됩니다.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "네, 복원합니다!",
        cancelButtonText: "아니요, 취소합니다!"
    }).then((result) => {
        if (result.isConfirmed) {
            var grbNo = element.getAttribute('data-adr-no');
            var empNo = element.getAttribute('data-emp-no');

            fetch('toggleTrashN.do', {  // 복원 관련 엔드포인트
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ grbNo: grbNo, empNo: empNo })
            })
            .then(response => response.json())  // JSON 응답 처리
            .then(data => {
                if (data.status === 'Restored') {
                    swalWithBootstrapButtons.fire({
                        title: "복원되었습니다!",
                        text: "항목이 성공적으로 복원되었습니다.",
                        icon: "success"
                    }).then(() => {
                        location.reload(true);  // 복원 후 페이지 리로드
                    });
                } else {
                    swalWithBootstrapButtons.fire({
                        title: "실패!",
                        text: "복원에 실패했습니다.",
                        icon: "error"
                    });
                    console.log('복원 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                swalWithBootstrapButtons.fire({
                    title: "오류!",
                    text: "항목을 복원하는 중 오류가 발생했습니다.",
                    icon: "error"
                });
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다",
                text: "항목이 변경되지 않았습니다 :)",
                icon: "error"
            });
        }
    });
}



function permanentDelete(element) {
    event.stopPropagation(); // 이벤트 전파 중단

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-primary",
            cancelButton: "btn btn-secondary"
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: "정말 삭제하시겠습니까?",
        text: "이 작업은 되돌릴 수 없습니다!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "네, 삭제합니다!",
        cancelButtonText: "아니요, 취소합니다!"
    }).then((result) => {
        if (result.isConfirmed) {
            var grbNo = element.getAttribute('data-adr-no');
            var empNo = element.getAttribute('data-emp-no');
            var trashNo = element.getAttribute('data-trash-no');

            fetch('permanentDelete.do', {  // 영구 삭제 관련 엔드포인트
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ grbNo: grbNo, empNo: empNo, trashNo: trashNo })
            })
            .then(response => response.json())  // JSON 응답 처리
            .then(data => {
                if (data.status === 'Deleted') {
                    swalWithBootstrapButtons.fire({
                        title: "삭제되었습니다!",
                        text: "항목이 영구적으로 삭제되었습니다.",
                        icon: "success"
                    }).then(() => {
                        location.reload(true);  // 삭제 후 페이지 리로드
                    });
                } else {
                    swalWithBootstrapButtons.fire({
                        title: "실패!",
                        text: "항목 삭제에 실패했습니다.",
                        icon: "error"
                    });
                    console.log('영구 삭제 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                swalWithBootstrapButtons.fire({
                    title: "실패!",
                    text: "항목 삭제에 실패했습니다.",
                    icon: "error"
                });
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다",
                text: "삭제 작업이 취소되었습니다 :)",
                icon: "error"
            });
        }
    });
}