<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div>
	<table class="table">
		<c:if test="${not empty roomList }">
			<tr>
				<td>회의실 이름</td>
				<td>${roomList.roomNm }</td>
			</tr>
			<tr>
				<td>회의실 장소</td>
				<td>${roomList.roomLoc }</td>
			<tr>
			<tr>
				<td>최대 인원</td>
				<td>${roomList.roomEmpmax }</td>
			</tr>
		</c:if>

	</table>
	<div class="card-header d-flex justify-content-end gap-3">
		<c:url value="/gw/todoList/comtodoListUpdate.do" var="updateUrl">
			<c:param name="what" value="${todoList.todoNo}" />
		</c:url>
		<a href="${updateUrl}" class="btn btn-primary">회의실수정</a>

		<form id="todoList" action="/connect/gw/todoList/todoListDelete.do" method="post" enctype="multipart/form-data">
			<input id="todoNo" name="todoNo" type="hidden" >
			<input id="empNo" name="empNo" type="hidden">
			<button class="btn btn-danger " type="submit">회의실삭제</button>
		</form>
	</div>

</div>