/**
 * 
 */
document.addEventListener("DOMContentLoaded", () => {
	const groupwareModal = document.querySelector('#groupwareModal');
	const groupwareBtn = document.querySelector('#groupwareBtn');
	const contextPath = document.body.dataset.contextPath;
	const grModal = new bootstrap.Modal(groupwareModal);
	let modalListBody = document.querySelector('#modal-list-body');
	let modalListBtn = document.querySelector('#modal-list-btn');
	
	groupwareBtn.addEventListener('click', ()=>{
		let url = `${contextPath}/w/member/findGroupwareId`;
		fetch(url,{
			headers: {
				"method":"get",
				"accept": "application/json"
			}
		})
		.then(resp=>resp.json())
		.then(element=>{
			if(element.result){
				modalListBody.innerHTML =
					`
					<div class="border border-light p-3">
						<h5 class="pb-2">계정 아이디</h5>
						<p>${element.groupwareId}</p>
						<a href="${contextPath }/gw/login/loginForm.do">그룹웨어 로그인</a>
					</div>
					`;
				modalListBtn.innerHTML = 
					`
					<button type="button" class="btn btn-no" data-bs-dismiss="modal">
						<i class="las la-times">취소</i> 
					</button>
					`;
			}else{
				modalListBody.innerHTML = 
					`
					<div class="border border-light p-3">
						<h5 class="pb-2">계정 아이디</h5>
						<p>계정정보가 없습니다. <a href="${contextPath}/w/member/groupwareJoinForm.do">생성하러 가기</a></p>
					</div>
					`;
				modalListBtn.innerHTML = 
					`
					<button type="button" class="btn btn-no" data-bs-dismiss="modal">
						<i class="las la-times">취소</i> 
					</button>
					`;
			}
		});
		grModal.show();
	});
	
});