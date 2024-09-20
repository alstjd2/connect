/**
 * 
 */

document.addEventListener("DOMContentLoaded", () => {
	const memIdChkBtn = document.querySelector("#memIdChkBtn");
	const memId = document.querySelector("#memId");
	const sectionPath = document.querySelector("#sectionPath");
	let cPath = sectionPath.dataset.cpath;
	let boolByIdChk = false;

	
	memIdChkBtn.addEventListener("click", (e)=>{
		let formData = new FormData();
		let inputId = memId.value;
		formData.append("inputId",inputId);
		
		e.preventDefault();
		
		fetch(`${cPath}/w/member/memIdChk`,{
			method:"post",
			headers:{
				"accept":"application/json"
			},
			body:formData
		}).then(response => response.json())
		.then(data =>{
			if(data.valid){
				alert(data.message);
				boolByIdChk = true;
			}else{
				alert(data.message);
			};
		});
	});
	
	
	const form = document.querySelector('form');
	form.addEventListener("submit", e=>{
		e.preventDefault();
		
		if(!boolByIdChk){
			alert("아이디체크를 해주세요.")
		}else{
			form.submit();
		};
		
	})
	
	
});