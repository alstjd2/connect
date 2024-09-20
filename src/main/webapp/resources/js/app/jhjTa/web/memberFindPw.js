/**
 * 
 */

document.addEventListener("DOMContentLoaded", () => {
	const memberId = document.querySelector("#memId");
	const memberEmail = document.querySelector("#memEmail");
	
//	const modal = pwFindModal.addEventListener("hidden.bs.modal", ({target})=>{
//		target.querySelector(".modal-body").innerText = '';
//	});
	const btn = document.querySelector('#pwFindBtn');
	const sectionPath = document.querySelector('#sectionPath')
	const cPath = sectionPath.dataset.cpath;
	
	
	btn.addEventListener("click", e =>{
		e.preventDefault();
		let formData = new FormData();
		let memId = memberId.value;
		let memEmail = memberEmail.value;
		let pwFindModal = document.querySelector("#pwFindModal");
		const myModal = new bootstrap.Modal(pwFindModal);
		
		formData.append("memId", memId);
		formData.append("memEmail", memEmail);
		
		fetch(`${cPath}/w/member/pwFind.do`,{
			method:"post",
			headers:{
				"accept":"application/json"
			},
			body:formData
		}).then(response => response.json())
		.then(({message, result}) =>{
			let modalBody = pwFindModal.querySelector(".modal-body");
			if(result){
				modalBody.innerText = message;
				myModal.show();
			}else{
				modalBody.innerText = message;
				myModal.show();
			}
		});
		
	});
	
});