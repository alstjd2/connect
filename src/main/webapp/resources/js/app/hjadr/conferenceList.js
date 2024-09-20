
document.addEventListener('DOMContentLoaded', function() {
    let currentPage = 1;
    const itemsPerPage = 5;


    function loadConferenceList(page) {
        fetch(`conferenceList?page=${page}&itemsPerPage=${itemsPerPage}`)
            .then(response => response.json())
            .then(data => {
                const conferenceListTable = document.getElementById('conferenceList');
                conferenceListTable.innerHTML = ''; // 기존 테이블 내용 초기화

                if (data.conferenceList.length > 0) {
                    data.conferenceList.forEach(conference => {
                        const row = document.createElement('tr');
						const [startDate, startTime] = conference.startDate.split('T');
						const formattedTime = formatTime(startTime);
                        row.innerHTML = `
                            <td>${conference.rnum}</td>
                            <td>${conference.roomTitle}</td>
                            <td>${startDate}</td> 
                            <td>${formattedTime}</td>
                            <td><a href="#" data-room-url-id="${conference.roomUrlId}" data-emp-no="${conference.empNo}" class="btn bg-label-primary me-1" style="border-radius: 40px;">입장</a></td>
                        `;
                        conferenceListTable.appendChild(row);
                    });

                    // 페이지네이션 업데이트
                    updatePagination(page, data.totalPages);
                } else {
                    conferenceListTable.innerHTML = '<tr><td colspan="6">등록된 화상회의가 없습니다.</td></tr>';
                }
            })
            .catch(error => console.error('Error fetching conference list:', error));
    }
	function formatTime(time24) {
        const [hour, minute] = time24.split(':');
        const hour12 = hour % 12 || 12; // 12시간 형식으로 변환
        const period = hour < 12 ? 'AM' : 'PM';
        return `${period} ${hour12}:${minute} `;
    }

    function updatePagination(currentPage, totalPages) {
        const paginationElement = document.getElementById('pagination');
        paginationElement.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const pageItem = document.createElement('li');
            pageItem.classList.add('page-item');
            if (i === currentPage) {
                pageItem.classList.add('active');
            }
            pageItem.innerHTML = `<a class="page-link" href="#">${i}</a>`;
            pageItem.addEventListener('click', function(e) {
                e.preventDefault(); // 링크 클릭 시 페이지 새로고침 방지
                loadConferenceList(i);
            });
            paginationElement.appendChild(pageItem);
        }
    }

	document.getElementById('conferenceList').addEventListener('click', function(e) {
        if (e.target && e.target.matches('a[data-room-url-id]')) {
            e.preventDefault();
            const roomUrlId = e.target.getAttribute('data-room-url-id');
			const empNo = e.target.getAttribute('data-emp-no');
            fetch(`room/${roomUrlId}`)
                .then(response => response.text())
                .then(roomId => {
                    const username = currentEmpNm;  // 사용자의 이름 설정
                    const roleId = currentEmpNo === empNo  ? 'emcee' : 'speaker';  // 역할 설정
                    joinMeetingRoom(roomId, username, roleId);
                })
                .catch(error => console.error('Error fetching roomId:', error));
        }
	});
	
	function joinMeetingRoom(roomId, username, roleId) {
    fetch('meeting/join', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            roomId: roomId,
            username: username,
            roleId: roleId,
            apiUserId: 'gooroomee-tester',  // 기본값
            ignorePasswd: false  // 기본값
        })
    })
    .then(response => response.text())
    .then(url => {
        // URL을 받아서 페이지 이동
        if (url.startsWith('http')) {  // URL 형식 확인
	        window.open(url, '_blank');  // '_blank'는 새 창 또는 새 탭에서 열리도록 함
	    } else {
	        console.error('Invalid URL:', url);
	    }
    })
    .catch(error => console.error('Error joining meeting:', error));
}

    // 초기 데이터 로드
    loadConferenceList(currentPage);
});