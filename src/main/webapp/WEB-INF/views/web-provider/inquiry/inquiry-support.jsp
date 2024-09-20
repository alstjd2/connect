<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-xxl flex-grow-1 container-p-y ">
    <div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
        <h3 class="fw-bold mb-0">초기지원문의</h3>
    </div>
    <div class="mt-4 card">
	    <div class="list-group">
	        <c:forEach var="early" items="${earlyList}">
	        
	            <a href="${cPath }/w/early/inquiryEarlyDetail.do?what=${early.earlyNo}"
	               class="list-group-item list-group-item-action flex-column align-items-start border-end-0 border-start-0">
	              <!-- 상태에 따라 배지 색상 변경 -->
				<c:choose>
				    <c:when test="${early.earlyStatus == '작업완료'}">
				        <small class="badge rounded-pill bg-label-success mt-2 mb-1">작업완료</small>
				    </c:when>
				    <c:when test="${early.earlyStatus == '작업중'}">
				        <small class="badge rounded-pill bg-label-warning mt-2 mb-1">작업중</small>
				    </c:when>
				    <c:when test="${early.earlyStatus == '작업보류'}">
				        <small class="badge rounded-pill bg-label-secondary mt-2 mb-1">작업보류</small>
				    </c:when>
				    <c:otherwise>
				        <small class="badge rounded-pill bg-label-info mt-2 mb-1">작업전</small>
				    </c:otherwise>
				</c:choose>
	                <div class="d-flex justify-content-between w-100">
	                    <!-- 기업명 -->
	                    <h5 class="mb-1 fw-bold">기업명 : <c:out value="${early.comNm}" /></h5>
	                    <!-- 전화번호 및 이메일 -->
	                    <small><c:out value="${early.earlyPhone}" /> (<c:out value="${early.earlyEmail}" />)</small>
	                </div>
	            </a>
	        </c:forEach>
	         <nav aria-label="Page navigation" class="pt-10">
				<ul class="pagination pagination-rounded justify-content-center">
					<!-- 기존 페이징 HTML을 이 div 안에 넣습니다 -->
					<div class="paging-area">${pagingHTML}</div>
				</ul>
			</nav>
	    </div>
	</div>
</div>
        <form:form id="searchform" method="get" modelAttribute="condition">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/paging.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/hjadr/addressList.js"></script>
