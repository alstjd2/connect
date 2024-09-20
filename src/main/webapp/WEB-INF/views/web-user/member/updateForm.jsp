<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${cPath}/resources/webUser/assets/css/custom/jhj_ta.css">

 <section class="join-us m-auto" id="sectionPath" data-cpath="${cPath }" >
    <form:form  method="post" action="${cPath }/w/mypage/updateProcess.do" modelAttribute="member">
        <h1 class="h3 fw-bold wow fadeInDown">회원정보 수정</h1>

        <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
            <input type="text" class="form-control" id="memNm" name="memNm" placeholder="이름을 입력해주세요." value="${member.memNm == null ? '' : member.memNm }" >
            <label for="floatingName">이름</label>
            <form:errors path="memNm" class="text-danger" element="span" />
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
            <input type="radio" class="btn-check" name="memGender" id="option1" value="M" autocomplete="off" ${member.memGender == 'M' ? 'checked' : ''}>
            <label class="btn btn-outline-light" for="option1">남자</label>

            <input type="radio" class="btn-check" name="memGender" id="option2" value="F" autocomplete="off" ${member.memGender == 'F' ? 'checked' : ''}>
            <label class="btn btn-outline-light" for="option2">여자</label>
        </div>
        <div class="button wow fadeInUp" data-wow-delay=".8s">
            <button class="btn w-100 py-2" id="updateBtn" type="submit">정보수정</button>
        </div>
        <input type="hidden" id="memNo" name="memNo" value="${member.memNo == null ? '' : member.memNo }" />
    </form:form>
</section> 

<%-- <script src="${cPath }/resources/js/app/jhjTa/web/memberUpdate.js"></script> --%>
