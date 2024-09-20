<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
	
<div class="container-xxl flex-grow-1 container-p-y pt-10">
	
	<c:choose>
		<c:when test="${principal.realUser.empRole eq 'ROLE_ADMIN'}">
			<c:url value="list.do" var="backUrl"/>
		</c:when>
		<c:when test="${principal.realUser.empRole eq 'ROLE_EMPLOYEE'}">
			<c:url value="create/myList.do" var="backUrl"/>
		</c:when>
	</c:choose>
	<div class="mb-10 mt-5">
		<a href="${backUrl}" class="btn rounded-pill btn-label-primary">
         	<span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>뒤로가기
        </a>
	    <button type="button" class="btn rounded-pill btn-label-secondary" onclick="populateForm()">
	        자동입력
	    </button>
	</div>
	
    <div class="col-md-9 m-auto ">
        <form action="" id="surveyCreate" method="post">
            <div class="card">
                <h5 class="card-header">
                    설문생성
                </h5>
                <div class="card-body">
                    <div class="mb-3">
                    	<input type="hidden" name="comNo" value="${principal.realUser.comNo}" />
                        <label for="svyNm" class="form-label">*설문지 제목</label>
                        <input type="text" class="form-control" id="svyNm" name="svyNm" placeholder="설문지 제목을 입력하세요">
                    </div>
                    <div class="mb-4 pb-3 border-bottom px-2 row align-items-center">
                    	<div class="col-md-6 d-flex gap-5 flex-wrap ">
	                        <div class="form-check form-switch mb-0">
	                            <input class="form-check-input" type="checkbox" id="svyImpYn" name="svyImpYn">
	                            <label class="form-check-label" for="svyImpYn">중요 설문 여부 </label>
	                        </div>
	                        <div class="form-check form-switch mb-0">
	                            <input class="form-check-input" type="checkbox" id="svyAnyYn" name="svyAnyYn">
	                            <label class="form-check-label" for="svyAnyYn">익명 투표 여부 </label>
	                        </div>
	                        <div class="form-check form-switch mb-0">
	                            <input class="form-check-input" type="checkbox" id="svyAllYn" name="svyAllYn">
	                            <label class="form-check-label" for="svyAllYn">응답자 모두 응답 여부 </label>
	                        </div>
                    	</div>
                    	<div class="col-md-6 d-flex gap-5 flex-wrap "> 
	                    	<div class="d-flex mx-0 align-items-center gap-2"> 
		                        <label for="svyStrDate">*시작일시</label> 
		                        <div> 
		                          <input class="form-control w-100" type="date" id="svyStrDate" name="svyStrDate">
		                        </div>
	                       </div>
	                    	<div id="endDate" class="d-flex mx-0 align-items-center gap-2">
		                        <label for="svyEndDate">*종료일시</label>  
		                        <div>
		                          <input class="form-control w-100" type="date" id="svyEndDate" name="svyEndDate">
		                        </div>
	                       </div> 
                    	</div>
                    </div>
                    <div class="pb-3 border-bottom">
                        <label for="svyNm" class="form-label">*응답자 선택</label>
                        <div class="d-flex align-items-center list-unstyled w-100" >
	                         <input type="text" id="empRefList" name="svyAnsListString" class="form-control" value=""/>
	                    </div>
                    </div>
                    <table class="w-100 ">
                        <tbody id="survey-list" class="pb-5">
                            <tr class="survey-container border-white border-bottom-10" id="chiList[0]">
                                <td class=" p-5 bg-light-subtle rounded">
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="chiList[0].chiOvlYn" name="chiList[0].chiOvlYn">
                                        <label class="form-check-label" for="chiList[0].chiOvlYn">복수 선택 여부</label>
                                    </div>
                                    <input type="text" class="form-control bg-white mb-4" id="chiList[0].chiNm" name="chiList[0].chiNm" placeholder="*설문1 | 제목을 입력하세요.">
                                    <div class="questions-list" id="questions-list-1">
                                        <div class="question-container mb-2 ms-0 row w-100">
                                            <label for="chiList[0].clsList[0].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*1</label>
                                            <div class="col-md-11 p-0">
                                                <input type="text" name="chiList[0].clsList[0].clsCnt" id="chiList[0].clsList[0].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요">
                                            </div>
                                        </div>
                                        <div class="question-container mb-2 ms-0 row w-100">
                                            <label for="chiList[0].clsList[1].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*2</label>
                                            <div class="col-md-11 p-0">
                                                <input type="text" name="chiList[0].clsList[1].clsCnt" id="chiList[0].clsList[1].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요">
                                            </div>
                                        </div>
                                        <!-- 항목이 추가되는 영역 -->
                                    </div>
                                    <button type="button" class="btn  btn-label-secondary btn-sm w-100" onclick="addQuestion(1)">
                                        <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                                        항목 추가
                                    </button>
                                </td>
                            </tr>
                            <!-- 설문 폼이 추가되는 영역 -->
                        </tbody>
                        <tfoot class="w-100">
                            <tr class="survey-container">
                                <td>
                                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="addSurvey()">
                                        <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                                        설문 추가
                                    </button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-primary w-100" onclick="submitForm()">생성하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script defer src="${cPath}/resources/groupwareMember/assets/js/document-ref-selects.js"></script>