function toggleGubunYN(element) {
    var grbGubunNo = element.closest('label').querySelector('.trash-checkbox').getAttribute('data-gubun-no');
    console.log("grbGubunNo:", grbGubunNo);

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
           confirmButton: "btn btn-primary",
           cancelButton: "btn btn-secondary"
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: "삭제하시겠습니까?",
        text: "이 작업은 되돌릴 수 없습니다!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "네",
        cancelButtonText: "아니요"
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '확인'을 선택한 경우
            fetch('toggleGubunY.do', {  // 휴지통 관련 엔드포인트
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ grbGubunNo: grbGubunNo })
            })
            .then(response => response.json())  // JSON 응답 처리
            .then(data => {
                if (data.status === 'MovedToTrash') {
                    swalWithBootstrapButtons.fire({
                        title: "실패",
                        text: "항목을 삭제하는데 실패했습니다.",
                        icon: "error"
                    });
                    console.log('휴지통으로 이동 성공');
                } else {
                    swalWithBootstrapButtons.fire({
                        title: "삭제되었습니다!",
                        text: "항목이 삭제되었습니다.",
                        icon: "success"
                    });
                    location.reload(true); // 실패했을 경우 페이지 새로고침
                    console.log('휴지통 이동 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                swalWithBootstrapButtons.fire({
                    title: "삭제되었습니다!",
                    text: "항목이 삭제되었습니다.",
                    icon: "success"
                }).then(() => {
                    location.reload(true); // 페이지 새로고침
                });
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            // 사용자가 '취소'를 선택한 경우
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다",
                text: "삭제 작업이 취소되었습니다 :)",
                icon: "error"
            });
        }
    });
}

autoinsertBtn.addEventListener('click', () => {
    // 게시판 제목과 내용을 자동으로 채움
    gubunTitle.value = '개발3팀 교육 게시판';
    gubunDesc.value = '개발신규인원의 교육을 위한 게시판입니다.';
});
