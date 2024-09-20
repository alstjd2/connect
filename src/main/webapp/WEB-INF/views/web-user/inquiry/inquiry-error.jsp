<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<section class="team-details section container">
   <div class="button text-end mb-4">
       <a href="${cPath }/w/mypage/ErrInsert.do" class="btn py-2 px-4">오류작성</a>
   </div>
  <div class="row">
    <div class="col-12">
        <div class="details-info text-center">
            <div class="heading d-flex align-items-center flex-wrap justify-content-between gap-3 my-0">
                <h3>
                    오류접수문의
                    <strong class="fs-5 ps-2 text-secondary"> 총 <c:out value="${fn:length(errList)}"/>개</strong>
                </h3>
               <div id="searchUI">
                    <!-- Search Type Dropdown -->
                    <select id="searchType" name="searchType" class="form-select border-0 py-0" aria-label="검색 유형 선택">
                        <option value="" >전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <!-- Search Input -->
                    <input id="searchWord" name="searchWord" placeholder="게시판명을 검색하세요." type="text" class="form-control addr-search-input border-0 py-0" aria-label="게시판명을 검색하세요." value="">
                </div>
            </div>
            <ul>
                <li class="row py-3 head">
                    <h6 class="col-md-1 px-2 fw-bold">번호</h6>
                    <h6 class="col-md-6 px-2 fw-bold">제목</h6>
                    <h6 class="col-md-3 px-2 fw-bold">등록날짜</h6>
                    <h6 class="col-md-2 px-2 fw-bold">진행사항</h6>
                </li>
                
                <!-- 데이터를 반복하여 출력 -->
				<c:forEach items="${errList}" var="err" varStatus="status">
				    <li>
				        <c:url value="/w/mypage/inquiryErrorDetail.do" var="inquiryErrorViewUrl">
				            <c:param name="what" value="${err.errNo}" />
				        </c:url>
				        <a href="${inquiryErrorViewUrl}" class="row py-3 list">
				        
				            <p class="col-md-1 px-2 m-0">
				                <b>번호</b>
				                <c:out value="${status.index + 1}"/>
				            </p>
				            <p class="col-md-6 px-2 m-0">
				                <b>제목</b>
				                <c:out value="${err.errTitle}"/>
				            </p>
				            <p class="col-md-3 px-2 m-0">
				                <b>등록날짜</b>
				                <c:out value="${err.errDate.substring(0,16)}"/>
				            </p>
				            <p class="col-md-2 px-2 m-0">
				                <b>진행사항</b>
				                <c:out value="${err.errWorkProgress}"/>
				            </p>
				        </a>
				    </li>
				</c:forEach>
            </ul>
        </div>
        
        
        <!-- 페이지 네비게이션 -->
        <nav aria-label="Page navigation" class="pt-10">
			<ul class="pagination pagination-rounded justify-content-center">
				<!-- 기존 페이징 HTML을 이 div 안에 넣습니다 -->
				<div class="paging-area">${pagingHTML}</div>
			</ul>
		</nav>
    </div>
</div>
</section>
    
    <form:form id="searchform" method="get" modelAttribute="condition">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/paging.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/app/hjadr/addressList.js"></script>
