<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<c:url value="/address/addressUpdate.do" var="updateUrl">
	<c:param name="what" value="${address.adrNo }" />
</c:url>
<a href="${updateUrl }">상품수정</a>
<table class="table">
	<tr>
		<th>주소록번호</th>
		<td>${address.adrNo}</td>
	</tr>
	<tr>
		<th>직원번호</th>
		<td>${address.empNo}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${address.adrNm}</td>
	</tr>
	<tr>
		<th>직책</th>
		<td>${address.adrOnepos}</td>
	</tr>
	<tr>
		<th>직급</th>
		<td>${address.adrPos}</td>
	</tr>
	<tr>
		<th>부서</th>
		<td>${address.adrDep}</td>
	</tr>
	<tr>
		<th>소속</th>
		<td>${address.adrAff}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${address.adrMail}</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${address.adrTel}</td>
	</tr>
	<tr>
		<td colspan="3"><a href="javascript:;" onclick="history.back();"
			class="btn btn-secondary">뒤로가기</a> 
			<a href="<c:url value='/address/addressList.do' />" class="btn btn-primary">목록으로</a>
			
			<c:url value="/address/addressDelete.do" var="deleteUrl">
				<c:param name="what" value="${address.adrNo }" />
			</c:url>
			<a href="${deleteUrl }" class="btn btn-danger">삭제하기</a>
		</td>
	</tr>
</table>