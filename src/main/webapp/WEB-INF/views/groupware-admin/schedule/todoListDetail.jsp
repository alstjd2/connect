<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div>
	<table class="table">
		<c:if test="${not empty todoList }">
			<tr>
				<td>일정 제목</td>
				<td>${todoList.todoTitle }</td>
			</tr>
			<tr>
				<td>일정 내용</td>
				<td>${todoList.todoContent }</td>
			<tr>
			<tr>
				<td>일정 시작일</td>
				<td>${todoList.todoStart }</td>
			</tr>
			<tr>
				<td>일정 종료일</td>
				<td>${todoList.todoEnd }</td>
			</tr>
			<tr>
				<td>일정 등록일</td>
				<td>${todoList.todoDate }</td>
			</tr>
		</c:if>
		<c:if test="${empty todoList }">
			<tr>
				<td colspan="9">일정 없음</td>
			</tr>
		</c:if>

	</table>
	<div class="card-header d-flex justify-content-end gap-3">
		<c:url value="/gw/todoList/comtodoListUpdate.do" var="updateUrl">
			<c:param name="what" value="${todoList.todoNo}" />
		</c:url>
		<a href="${updateUrl}" class="btn btn-primary">일정수정</a>

		<form id="todoList" action="${cPath }/gw/todoList/comtodoListDelete.do" method="post" enctype="multipart/form-data">
			<input id="todoNo" name="todoNo" value="${todoList.todoNo }" type="hidden" >
			<input id="empNo" name="empNo" value="${todoList.empNo }"  type="hidden">
			<button class="btn btn-danger " type="submit">일정삭제</button>
		</form>
	</div>

</div>