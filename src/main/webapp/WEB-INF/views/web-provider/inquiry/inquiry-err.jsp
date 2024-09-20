<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

<div class="container-xxl flex-grow-1 container-p-y">
    <div class="py-4 mb-6 d-flex justify-content-between align-items-center">
        <h3 class="fw-bold mb-0">오류문의</h3>
    </div>
    <div class="mt-4 card"> 
        <div class="list-group">
            <c:forEach var="errBoard" items="${errBoardList}">
                <!-- errWorkProgress가 null인 경우 작업전으로 기본값 설정 -->
                <c:if test="${empty errBoard.errWorkProgress}">
                    <c:set var="errWorkProgress" value="작업전" />
                </c:if>
                <a href="${cPath}/w/err/inquiryErrDetail.do?what=${errBoard.errNo}"
                   class="list-group-item list-group-item-action flex-column align-items-start border-end-0 border-start-0">
                    <!-- 상태 배지 -->
                    <small class="badge rounded-pill bg-label-${
                        errBoard.errWorkProgress == '작업완료' ? 'success' : 
                        errBoard.errWorkProgress == '작업중' ? 'info' : 
                        errBoard.errWorkProgress == '작업전' ? 'warning' : 
                        errBoard.errWorkProgress == '작업보류' ? 'danger' : 
                        'secondary'} mt-2 mb-1">
                        <c:out value="${errBoard.errWorkProgress != null ? errBoard.errWorkProgress : '작업전'}" />
                    </small>
                    <div class="d-flex justify-content-between w-100">
                        <!-- 에러 제목 -->
                        <h5 class="mb-1 fw-bold"><c:out value="${errBoard.errTitle}" /></h5>
                        <!-- 에러 발생 위치 -->
                        <small><c:out value="${errBoard.errLoc}" /></small>
                    </div>
                    <!-- 에러 내용 요약 -->
                    <p class="mb-1"><c:out value="${errBoard.errContent}" /></p>
                </a>
            </c:forEach>
        </div>
        <!-- 페이지네이션 -->
        <nav aria-label="Page navigation" class="pt-10">
            <ul class="pagination pagination-rounded justify-content-center">
                <div class="paging-area">${pagingHTML}</div>
            </ul>
        </nav>
    </div>

    <form:form id="searchform" method="get" modelAttribute="condition">
        <form:hidden path="searchType" />
        <form:hidden path="searchWord" />
        <input type="hidden" name="page" />
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/paging.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
