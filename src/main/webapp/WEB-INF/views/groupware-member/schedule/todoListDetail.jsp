<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<c:if test="${not empty todoList.todoCate.todocateTitle }">
				<td>일정 카테고리</td>
				<td>${todoList.todoCate.todocateTitle}</td>
			<tr>
			</c:if>
			<c:if test="${empty todoList.todoCate.todocateTitle }">
				<td>일정 카테고리</td>
				<td>카테고리없음</td>
			<tr>
			</c:if>
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
	</div>

	<div class="card-header d-flex justify-content-end gap-3">
		<c:url value="/gw/todoList/todoListUpdate.do" var="updateUrl">
			<c:param name="what" value="${todoList.todoNo}" />
		</c:url>
		<a href="${updateUrl}" class="btn btn-primary">일정수정</a>

		<form:form action="${cPath}/gw/todoList/todoListDelete.do" method="post"
			modelAttribute="todoList" enctype="multipart/form-data">
			<form:hidden path="todoNo" />
			<form:hidden path="empNo" />
			<button class="btn btn-danger " type="submit">일정삭제</button>
		</form:form>
	</div>