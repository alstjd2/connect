document.addEventListener('DOMContentLoaded', function() {
    const replyViewParent = document.getElementById('app-email-view');
    
    replyViewParent.addEventListener('submit', function(event) {
        if(event.target.id !== 'writeForm') {
            return false;
        }

        event.preventDefault(); // 폼 제출 기본 동작 막기

        const replyForm = event.target;
        const replyContent = replyForm.replyContent;
        const grbNo = replyForm.grbNo;
        const content = replyContent.value;

        if (content.trim() === '') {
            alert('댓글 내용을 입력하세요.');
            return;
        }

        const replyData = {
            grbNo: grbNo.value,
            replyContent: replyContent.value
        };

        fetch('insertReply.do', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify(replyData)
})
		.then(response => response.json())
		.then(data => {
		    if (data.status === "success") {
		        const replyListContainer = document.getElementById('replyListContainer');
		
		        // "등록된 댓글이 없습니다" 메시지가 있으면 제거
		        const noReplyMessage = document.getElementById('noReplyMessage');
		        if (noReplyMessage) {
		            noReplyMessage.remove();
		        }
		
		        // 새 댓글 요소 생성
		        const li = document.createElement('li');
		        li.classList.add('media', 'mb-3');
		        li.setAttribute('style', 'display: flex; width: 100%; align-items: center;');
		
		        // 서버에서 받은 profileUrl 사용, 없으면 기본 아바타 사용
		        const profileUrl = data.profileUrl || 'assets/img/avatars/default-avatar.png';
		
		        // HTML 문자열 생성 (프로필 사진과 댓글 내용 포함)
		        const avatar = `<img src="${profileUrl}" class="mr-3 rounded-circle" width="38" height="38" alt="프로필 사진">
					<div style="display: flex;justify-content: space-between;width: 100%;">`
		        const replyBody = `<div class="media-body" style="margin-left: 20px;">
		                               <h6 class="mt-0 mb-1 fw-bold">${data.reply.employee.empNm}</h6>
		                               <p style="margin-bottom: 0;">${data.reply.replyContent}</p>
		                           </div>`;
		        
		        // 여기에 trashIcon 적용
		        const trashIcon = `<div class="media-options" style="align-items: center; display: flex;">
		                               <i class="bx bx-trash bx-md" onclick="toggleReplyYN(this)" data-reply-no="${data.reply.grbReplyNo}" style="margin-right: 10px;"></i>
		                           </div>`;
		
		   // 최종 댓글 요소 조립
                li.innerHTML = avatar + replyBody + trashIcon;

				console.log('trach')
				
                // 마지막에만 구분선 추가하지 않음
                if (replyListContainer.children.length > 0) {
                    const hr = document.createElement('hr');
                    hr.classList.add('my-4');
                    replyListContainer.appendChild(hr);
                }
                replyListContainer.appendChild(li);

                // 폼 초기화
                replyContent.value = '';
            } else {
                alert('댓글 등록에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('댓글 등록 중 오류 발생:', error);
            alert('댓글 등록 중 오류가 발생했습니다.');
        });
    });
});


function toggleReplyYN(element) {
    var grbReplyNo = element.getAttribute('data-reply-no');
    console.log("grbReplyNo:", grbReplyNo);

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
        cancelButtonText: "아니요, 취소합니다!",
    }).then((result) => {
        if (result.isConfirmed) {
            fetch('toggleReplyY.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ grbReplyNo: grbReplyNo })
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'MovedToTrash') {
                    swalWithBootstrapButtons.fire({
                        title: "오류!",
                        text: "댓글을 삭제하는 중 오류가 발생했습니다.",
                        icon: "error"
                    });
                } else {
                    swalWithBootstrapButtons.fire({
                        title: "삭제되었습니다!",
                        text: "댓글이 삭제되었습니다.",
                        icon: "success"
                    }).then(() => {
                        const replyElement = element.closest('.media');
                        if (replyElement) {
                            const nextElement = replyElement.nextElementSibling;

                            // 댓글 요소 삭제
                            replyElement.remove();

                            // 다음 요소가 <hr class="my-6">인 경우 삭제
                            if (nextElement && nextElement.tagName === 'HR' && nextElement.classList.contains('my-6')) {
                                nextElement.remove();
                            }

                            // 댓글이 모두 삭제되었는지 확인
                            const replyListContainer = document.getElementById('replyListContainer');
                            if (replyListContainer.children.length === 0) {
                                // "등록된 댓글이 없습니다" 메시지 추가
                                const noReplyMessage = document.createElement('p');
                                noReplyMessage.id = 'noReplyMessage';
                                noReplyMessage.textContent = '등록된 댓글이 없습니다.';
                                replyListContainer.appendChild(noReplyMessage);
                            }
                        }
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                swalWithBootstrapButtons.fire({
                    title: "오류!",
                    text: "댓글을 삭제하는 중 오류가 발생했습니다.",
                    icon: "error"
                });
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다",
                text: "취소됨",
                icon: "error"
            });
        }
    });
}