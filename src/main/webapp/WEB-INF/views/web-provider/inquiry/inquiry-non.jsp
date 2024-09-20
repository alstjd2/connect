<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-xxl flex-grow-1 container-p-y ">
	<div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
		<h3 class="fw-bold mb-0">비회원문의</h3>
	</div>
	<div class="mt-4 card">
		<div class="list-group">
			<c:forEach var="non" items="${nonList}">
				<a href="${cPath}/w/non/inquiryNonDetail.do?what=${non.nonNo}"
					class="list-group-item list-group-item-action flex-column align-items-start border-end-0 border-start-0">
					<!-- 상태에 따라 배지 색상 변경 --> <c:choose>
						<c:when test="${non.nonStatus == '미응답'}">
							<small class="badge rounded-pill bg-label-danger my-1">미응답</small>
						</c:when>
						<c:when test="${non.nonStatus == '답변완료'}">
							<small class="badge rounded-pill bg-label-success my-1">답변완료</small>
						</c:when>
						<c:otherwise>
							<small class="badge rounded-pill bg-label-secondary my-1">답변전</small>
						</c:otherwise>
					</c:choose>
					<div class="d-flex justify-content-between w-100">
						<h5 class="mb-1 fw-bold">${non.nonTitle}</h5>
						<small>${non.nonNm}(${non.nonEmail})</small>
					</div>
					<p class="mb-1">${non.nonContent}</p>
				</a>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation" class="pt-10">
			<ul class="pagination pagination-rounded justify-content-center">
				<!-- 기존 페이징 HTML을 이 div 안에 넣습니다 -->
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
<script type="text/javascript" src="${cPath}/resources/js/app/hjadr/addressList.js"></script>