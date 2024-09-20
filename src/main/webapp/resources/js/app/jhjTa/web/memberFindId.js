/**
 * 
 */

document.addEventListener("DOMContentLoaded", () => {
	const memberNm = document.querySelector("#memNm");
	const memberEmail = document.querySelector("#memEmail");
	const idFindModal = document.querySelector("#idFindModal");
	
//	const modal = idFindModal.addEventListener("hidden.bs.modal", ({target})=>{
//		target.querySelector(".modal-body").innerText = '';
//	});
//	const myModal = new bootstrap.Modal(modal); // 
	const btn = document.querySelector('#idFindBtn');
	const sectionPath = document.querySelector('#sectionPath')
	const cPath = sectionPath.dataset.cpath;
	
	
	btn.addEventListener("click", e =>{
		e.preventDefault();
		let formData = new FormData();
		let memNm = memberNm.value;
		let memEmail = memberEmail.value;
		
		formData.append("memNm", memNm);
		formData.append("memEmail", memEmail);
		
		
		fetch(`${cPath}/w/member/idFind.do`,{
			method:"post",
			headers:{
				"accept":"application/json"
			},
			body:formData
		}).then(response => response.json())
		.then(({message, result}) =>{
			let modalBody = idFindModal.querySelector(".modal-body");
			if(result){
				modalBody.innerText = '회원 아이디 : ' + message;
			}else{
				modalBody.innerText = message;
			}
		});
		
	});
	
});