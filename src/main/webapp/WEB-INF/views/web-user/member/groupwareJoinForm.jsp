<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="join-us m-auto" id="sectionPath" data-cpath="${cPath }" >
    <form:form  method="post" action="${cPath }/w/member/groupwareInsert.do" modelAttribute="employee">
        <h1 class="h3 fw-bold wow fadeInDown">그룹웨어 관리자 계정 생성</h1>
        <br>
        <div class="form-floating wow fadeInUp" id="infoId" data-wow-delay=".4s">
            <input type="text" class="form-control" id="empId" name="empId" placeholder="아이디를 입력해주세요." value="${employee.empId == null ? '' : employee.empId }">
            <label for="floatingId">아이디</label>
            <button class="btn btn-info" id="empIdChkBtn" >중복확인</button>
            <form:errors path="empId" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="password" class="form-control" id="empPw" name="empPw" placeholder="비밀번호를 입력해주세요.">
            <label for="floatingPassword">비밀번호(문자+숫자조합의 8~16자)</label>
            <form:errors path="empPw" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="password" class="form-control" id="empPwChk" name="empPwChk" placeholder="비밀번호를 입력해주세요.">
            <label for="floatingPasswordChk">비밀번호 체크</label>
        </div>
        
        <div class="button wow fadeInUp" data-wow-delay=".8s">
            <button class="btn w-100 py-2" id="joinBtn" type="submit">계정생성</button>
        </div>
    </form:form>
</section>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", () => {
	const empIdChkBtn = document.querySelector("#empIdChkBtn");
	const empId = document.querySelector("#empId");
	const sectionPath = document.querySelector("#sectionPath");
	let cPath = sectionPath.dataset.cpath;
	let boolByIdChk = false;
	const empPw = document.querySelector("#empPw");
	const empPwChk = document.querySelector("#empPwChk");
	
	empIdChkBtn.addEventListener("click", (e)=>{
		let formData = new FormData(); 
		let inputId = empId.value;
		formData.append("inputId",inputId);
		
		e.preventDefault();
		
		if(inputId === null || inputId === ""){
			errorSwal("값을 넣어주세요")
		}else{
			fetch(`${cPath}/w/member/groupwareIdChk.do`,{
				method:"post",
				headers:{
					"accept":"application/json"
				},
				body:formData
			}).then(response => response.json())
			.then(data =>{
				if(data.result){
					errorSwal("아이디 중복입니다.");
				}else{
					successSwal("사용가능한 아이디 입니다.");
					boolByIdChk = true;
				};
			});
		}
	});
	
	
	const form = document.querySelector('form');
	form.addEventListener("submit", e=>{
		e.preventDefault();
		
		let empPwVal = empPw.value;
		let empPwChkVal = empPwChk.value;
		
		if(empPwVal!==empPwChkVal){
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
	
});
</script>