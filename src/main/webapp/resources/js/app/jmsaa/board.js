document.addEventListener('DOMContentLoaded', function () {
	const divAppEmail = document.querySelector(".app-email");
    const divListBody = document.querySelector('#div-list-body');
    // 모든 email-list-item 요소들을 선택
    const bodyLiItems = document.querySelectorAll('.body-li');
	const divListUnstyled = document.querySelector('.divListUnstyled'); // 최신 게시글 리스트를 담고 있는 div
	
	  if (divListUnstyled) {
        const boardItems = divListUnstyled.querySelectorAll('div[data-grb-no]');
        
        // 각 게시글 항목에 클릭 이벤트 추가
        boardItems.forEach(boardItem => {
            boardItem.addEventListener('click', function() {
                const grbNo = this.getAttribute('data-grb-no');
                fetchBoardDetail(grbNo); // 게시글 상세 정보 요청
            });
        });
    }

    if (divListBody && bodyLiItems.length > 0) {
        bodyLiItems.forEach(bodyLi => {
            bodyLi.addEventListener('click', e => {
                e.preventDefault();  // 기본 링크 동작 방지
                const grbNo = bodyLi.getAttribute('data-grb-no'); // 클릭한 항목의 데이터 속성(grbNo) 가져오기
                console.log('클릭 이벤트 발생:', e, '게시글 번호:', grbNo);

                const clickedElement = e.target;

                // 클릭된 요소가 수정 아이콘(.bx-edit)인지 확인
                if (clickedElement.classList.contains('bx-edit')) {
	   				event.stopPropagation(); // 이벤트 전파 중단
                    // 수정 폼을 비동기로 가져오기
                    fetchEditForm(grbNo);
                } else {
                    // 게시글 상세 정보를 가져오기
                    const appEmailView = document.querySelector('#app-email-view');
                    if (appEmailView) {
                        fetchBoardDetail(grbNo); // 비동기 처리로 게시글 상세 정보 가져오기
                    } else {
                        console.error('appEmailView 요소를 찾을 수 없습니다.');
                    }
                }
            });
        });
    } else {
        console.error('divListBody 또는 bodyLi 요소를 찾을 수 없습니다.');
    }

	
    // 게시글 상세 정보를 가져오는 함수
    function fetchBoardDetail(grbNo) {
        fetch(`grbBoardDetail.do?what=${grbNo}`) // 서버에 게시글 번호로 요청
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답이 정상적이지 않습니다.');
                }
                return response.text(); // 서버에서 HTML 형식의 응답을 받아옴
            })
            .then(data => {
                const emailViewContainer = document.querySelector('.app-email-view');
                if (emailViewContainer) {
                    emailViewContainer.innerHTML = data; // 가져온 데이터를 emailViewContainer에 삽입하여 화면에 표시
                    emailViewContainer.classList.add('show'); // 상세 보기 표시
                }
            })
            .catch(error => {
                console.error('게시글 상세 정보를 가져오는 중 오류 발생:', error);
            });
    }
	
	if(divAppEmail.dataset.updatedGrb){
		fetchBoardDetail(divAppEmail.dataset.updatedGrb);
	}

    // 게시글 수정 폼을 비동기적으로 가져오는 함수
    function fetchEditForm(grbNo) {
        fetch(`editPostForm.do?grbNo=${grbNo}`) // 서버에 게시글 번호로 요청
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답이 정상적이지 않습니다.');
                }
                return response.text(); // 서버에서 HTML 형식의 응답을 받아옴
            })
            .then(data => {
                const emailViewContainer = document.querySelector('.app-email-view');
                if (emailViewContainer) {
                    emailViewContainer.innerHTML = data; // 가져온 데이터를 emailViewContainer에 삽입하여 수정 폼 표시
                    emailViewContainer.classList.add('show'); // 수정 폼 표시
                }
            })
            .catch(error => {
                console.error('수정 폼을 가져오는 중 오류 발생:', error);
            });
    }
		
function deleteItem(element) {
    var grbNo = element.getAttribute('data-grb-no');

    if (confirm("정말로 삭제하시겠습니까?")) {
        fetch('gw/board/updatePost.do', {  // 삭제 처리 관련 엔드포인트
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ grbNo: grbNo})
        })
        .then(response => response.json())  // JSON 응답 처리
        .then(data => {
            if (data.status === 'Deleted') {
                console.log('삭제 성공');
                // 여기서 아이템을 화면에서 제거하거나, 스타일을 변경할 수 있습니다.
                  document.getElementById("attachment-section").innerHTML = '<span>첨부파일 없음</span>';
            } else {
                console.log('삭제 실패');
                alert('삭제에 실패했습니다.');
            }
        })
        .catch(error => console.error('Error:', error));
    }
}
    // app-email-view 닫기 버튼 처리 (Optional)
    document.getElementById("app-email-view").addEventListener("click", (e) => {
        if (e.target.dataset.target == "#app-email-view") {
            document.querySelector(e.target.dataset.target).classList.remove('show');
        }
    });
});
