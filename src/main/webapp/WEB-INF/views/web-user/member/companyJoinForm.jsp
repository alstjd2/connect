<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${cPath }/resources/js/app/jhjTa/css/companyJoin.css"  >

<section class="join-us m-auto" id="sectionPath" data-cpath="${cPath }" >
    <form:form  method="post" action="${cPath }/w/member/companyJoinFormData.do" modelAttribute="company" enctype="multipart/form-data">
        <h1 class="h3 fw-bold wow fadeInDown">기업등록</h1>
        <p class="mb-4 wow fadeInDown" data-wow-delay=".2s">기업등록하여 Connect 서비스를 경험하세요.</p>

        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="comNm" name="comNm" placeholder="기업명을 입력해주세요." value="${company.comNm == null ? '' : company.comNm }" >
            <label for="floatingName">기업명</label>
            <form:errors path="comNm" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="comBsnm" name="comBsnm" placeholder="대표명를 입력해주세요." value="${company.comBsnm == null ? '' : company.comBsnm }">
            <label for="floatingId">대표명</label>
            <form:errors path="comBsnm" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="comBsno" name="comBsno" placeholder="사업자번호를 입력해주세요." value="${company.comBsno == null ? '' : company.comBsno }">
            <label for="floatingId">사업자번호</label>
            <form:errors path="comBsno" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="comAdr" name="comAdr" placeholder="주소를 입력해주세요." value="${company.comAdr == null ? '' : company.comAdr }">
            <label for=floatingName>주소</label>
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="number" class="form-control" id="comSapr" name="comSapr" placeholder="매출규모를 입력해주세요." value="${company.comSapr == null ? '' : company.comSapr }">
            <label for="floatingId">매출규모</label>
            <form:errors path="comSapr" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="comTel" name="comTel" placeholder="회사 전화번호를 입력해주세요." value="${company.comTel == null ? '' : company.comTel }">
            <label for="floatingPhone">회사 전화번호</label>
            <form:errors path="comTel" class="text-danger" element="span" />
        </div>
        
        <div class="filebox wow fadeInUp" data-wow-delay=".4s">
            <input class="upload-name" id="comClogoLabel" value="회사 컬러로고(기본 이미지 제공)" placeholder="회사 컬러로고">
            <label for="comClogoFile">파일첨부</label>
            <input type="file" id="comClogoFile" name="comClogoFile">
        </div>
        <div class="filebox wow fadeInUp" data-wow-delay=".4s">
        	<input class="upload-name" id="comFaviconLabel" value="회사 파비콘(기본 이미지 제공)" placeholder="회사 파비콘">
            <label for="comFaviconFile">파일첨부</label>
            <input type="file" id="comFaviconFile" name="comFaviconFile" accept=".ico">
        </div>
        
        <div class="button wow fadeInUp" data-wow-delay=".8s">
            <button class="btn w-100 py-2" id="joinBtn" type="submit">기업등록</button>
        </div>
        <div class="button wow fadeInUp" data-wow-delay=".8s">
        	<button class="btn w-10 py-1" id="dataInsertBtn" type="button">자동생성</button>
        </div>
    </form:form>
</section>

<script>
const comColgoFile = document.querySelector("#comClogoFile");
const comFaviconFile = document.querySelector("#comFaviconFile");
const comClogoLabel = document.querySelector("#comClogoLabel");
const comFaviconLabel = document.querySelector("#comFaviconLabel");

// 임시값 넣기~
const dataInsertBtn = document.querySelector("#dataInsertBtn");
const comNm = document.querySelector("#comNm");
const comBsnm = document.querySelector("#comBsnm");
const comBsno = document.querySelector("#comBsno");
const comAdr = document.querySelector("#comAdr");
const comSapr = document.querySelector("#comSapr");
const comTel = document.querySelector("#comTel");

comColgoFile.addEventListener('change', function(){
	let fileName = comColgoFile.value.split('/').pop().split('\\').pop();
	comClogoLabel.value = fileName;
}); 
comFaviconFile.addEventListener('change',function(){
	let fileName = comFaviconFile.value.split('/').pop().split('\\').pop();
	comFaviconLabel.value = fileName;
}); 

dataInsertBtn.addEventListener('click', ()=>{
	comNm.value = '대덕인재개발원';
	comBsnm.value = '김대덕';
	comBsno.value = '527-35-6179';
	comAdr.value = '대전 중구 계룡로 846 3층';
	comSapr.value = '97000000000';
	comTel.value = '042-222-8202';
});

</script>