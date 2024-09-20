/**
 * 
 */

document.addEventListener("DOMContentLoaded", () => {
	const memIdChkBtn = document.querySelector("#memIdChkBtn");
	const memId = document.querySelector("#memId");
	const sectionPath = document.querySelector("#sectionPath");
	let cPath = sectionPath.dataset.cpath;
	let boolByIdChk = false;
	const memPw = document.querySelector("#memPw");
	const memPwChk = document.querySelector("#memPwChk");
	
	// 임시값 넣어주자~
	const dataInsertBtn = document.querySelector('#dataInsertBtn');
	const memNm = document.querySelector('#memNm');
	const memEmail = document.querySelector('#memEmail');
	const memPhone = document.querySelector('#memPhone');
	const memBir = document.querySelector('#memBir');
	
	memIdChkBtn.addEventListener("click", (e)=>{
		let formData = new FormData(); // key value쌍은 여기 없다 우리가 만들어줘야함
		let inputId = memId.value;
		formData.append("inputId",inputId);
		
		e.preventDefault();
		
		if(inputId === null || inputId === ""){
			errorSwal("값을 넣어주세요")
		}else{
			fetch(`${cPath}/w/member/memIdChk`,{
				method:"post",
				headers:{
					"accept":"application/json"
				},
				body:formData
			}).then(response => response.json())
			.then(data =>{
				if(data.valid){
					successSwal(data.message);
					boolByIdChk = true;
				}else{
					errorSwal(data.message);
				};
			});
		}
	});
	
	
	const form = document.querySelector('form');
	form.addEventListener("submit", e=>{
		e.preventDefault();
		
		let memPwVal = memPw.value;
		let memPwChkVal = memPwChk.value;
		
		if(memPwVal!==memPwChkVal){
			errorSwal("비밀번호와 비밀번호체크가 다릅니다.")
		}else if(!boolByIdChk){
			errorSwal("아이디체크를 해주세요.")
		}else{
			form.submit();
		};
		
	})
	
	function errorSwal(msg){
    	swal({
			title : msg,
			icon  : "error",
			closeOnClickOutside : false
			});
    }
	function successSwal(msg){
    	swal({
			title : msg,
			icon  : "success",
			closeOnClickOutside : false
			});
    }

	dataInsertBtn.addEventListener('click', ()=>{
		memNm.value = '김도현';
		memId.value = 'dhkim1212';
		memPw.value = 'java1212';
		memPwChk.value = 'java1212';
		memEmail.value = 'dhkim1212@gmail.com';
		memPhone.value = '010-8273-1802';
		memBir.value = '1995-05-27';
	});
	
	
});