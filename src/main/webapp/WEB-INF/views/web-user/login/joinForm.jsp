<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${cPath}/resources/webUser/assets/css/custom/jhj_ta.css">

<section class="join-us m-auto" id="sectionPath" data-cpath="${cPath }" >
    <form:form  method="post" action="${cPath }/w/member/joinFormData.do" modelAttribute="member">
        <h1 class="h3 fw-bold wow fadeInDown">회원가입</h1>
        <p class="mb-4 wow fadeInDown" data-wow-delay=".2s">회원가입하여 Connect 서비스를 경험하세요.</p>

        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="memNm" name="memNm" placeholder="이름을 입력해주세요." value="${member.memNm == null ? '' : member.memNm }" >
            <label for="floatingName">이름</label>
            <form:errors path="memNm" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" id="infoId" data-wow-delay=".4s">
            <input type="text" class="form-control" id="memId" name="memId" placeholder="아이디를 입력해주세요." value="${member.memId == null ? '' : member.memId }">
            <label for="floatingId">아이디</label>
            <button class="btn btn-info" id="memIdChkBtn" >중복확인</button>
            <form:errors path="memId" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="password" class="form-control" id="memPw" name="memPw" placeholder="비밀번호를 입력해주세요.">
            <label for="floatingPassword">비밀번호(문자+숫자조합의 8~16자)</label>
            <form:errors path="memPw" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="password" class="form-control" id="memPwChk" name="memPwChk" placeholder="비밀번호를 입력해주세요.">
            <label for="floatingPasswordChk">비밀번호 체크</label>
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="memEmail" name="memEmail" placeholder="이메일를 입력해주세요." value="${member.memEmail == null ? '' : member.memEmail }">
            <label for="floatingEmail">이메일</label>
            <form:errors path="memEmail" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="연락처를 입력해주세요." value="${member.memPhone == null ? '' : member.memPhone }">
            <label for="floatingPhone">연락처</label>
            <form:errors path="memPhone" class="text-danger" element="span" />
        </div>
        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="date" class="form-control" id="memBir" name="memBir" placeholder="생년월일을 입력해주세요." value="${member.memBir == null ? '' : member.memBir }">
            <label for="floatingPhone">생년월일</label>
            
        </div>
        <div class="form-group wow fadeInUp" data-wow-delay=".4s">
            <span class="pe-2">성별 선택</span>
            <input type="radio" class="btn-check" name="memGender" id="option1" value="M" autocomplete="off" checked>
            <label class="btn btn-outline-light" for="option1">남자</label>

            <input type="radio" class="btn-check" name="memGender" id="option2" value="F" autocomplete="off">
            <label class="btn btn-outline-light" for="option2">여자</label>
        </div>
        <div class="button wow fadeInUp" data-wow-delay=".8s">
            <button class="btn w-100 py-2" id="joinBtn" type="submit">회원가입</button>
        </div>
        <div class="button wow fadeInUp" data-wow-delay=".8s">
        	<button class="btn w-10 py-1" id="dataInsertBtn" type="button">자동생성</button>
        </div>
    </form:form>
</section>

<script src="${cPath }/resources/js/app/jhjTa/join.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>