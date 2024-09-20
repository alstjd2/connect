<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<a href="<c:url value='/address/addressInsert.do'/>">새로운 연락처 등록</a>
<table class="table">
	<thead>
		<tr>

			<th>번호</th>
			<th>즐겨찾기</th>
			<th>이름</th>
			<th>부서</th>
			<th>직책 / 직급</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bookmark" items="${bookmarkList}">
			<tr>
				<td>${bookmark.rnum}</td>
					<td>
						<input type="checkbox" name="markNo" class="bookmark-checkbox" data-mark-no="${bookmark.markNo}" checked="checked" />
					</td>
						
				<td><c:url value="/address/addressBookMarkDetail.do"
						var="bookmarkDetailUrl">
						<c:param name="what" value="${bookmark.employee.empNo}"></c:param>
					</c:url> <a href="#offcanvasRight" type="button" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"
					data-detail-url="${bookmarkDetailUrl}">
						${bookmark.employee.empNm} </a></td>


				<td><c:forEach var="organization"
						items="${bookmark.employee.company.organizationList}">
                    ${organization.orgDep}<br />
					</c:forEach></td>
				<td><c:forEach var="position"
						items="${bookmark.employee.company.positionList}">
                    ${position.posNm} / 
                    ${position.ONEPOSNM}
                	</c:forEach></td>
				<td>${bookmark.employee.empTel}</td>
				<td>${bookmark.employee.empMail}</td>
			</tr>

		</c:forEach>
		<c:if test="${empty bookmarkList}">
			<tr>
				<td colspan="5">북마크 데이터가 없습니다.</td>
			</tr>
		</c:if>



	</tbody>

	<tfoot>
		<tr>
			<td colspan="6">
				<div class="paging-area">${pagingHTML}</div>
				<div id="searchUI">
					<form:select path="condition.searchType">
						<option value="" label="전체" />
						<option value="name" label="이름" />
						<option value="buyer" label="직급" />
					</form:select>
					<form:input path="condition.searchWord" />
					<button id="searchBtn">검색</button>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
<form:form id="searchform" method="get" modelAttribute="condition">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasRightLabel">상세정보</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<div class="offcanvas-body"></div>
</div>
<script type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script type="text/javascript"
	src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="${cPath}/resources/js/app/hjadr/bookmarkList.js"></script>
