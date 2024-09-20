<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">

<nav class="navbar navbar-expand-lg bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">일정 수정</a>
		</div>
</nav>
<div></div>
<div class="card table-responsive text-nowrap">
	<form:form method="post" modelAttribute="todoList"
		action="${cPath }/gw/todoList/comtodoListUpdate.do"
		enctype="multipart/form-data">
		<form:hidden path="todoNo" />
		<table class="table">
			<tr>
				<td>일정 제목</td>
				<td><form:input type="text" path="todoTitle"
						class="form-control" required="required" /> <form:errors
						path="todoTitle" cssClass="text-danger" element="span" /></td>
			</tr>
			<tr>
				<td>일정 내용</td>
				<td><form:textarea path="todoContent" class="form-control" /></td>
			<tr>
			<tr>
				<td>일정 시작일</td>
				<td><form:input path="todoStart" type="datetime-local"
						class="form-control" /></td>


			</tr>
			<tr>
				<td>일정 종료일</td>
				<td><form:input path="todoEnd" type="datetime-local"
						class="form-control" /></td>
			</tr>
			<tr>
				<td>일정 등록일</td>
				<td><form:input path="todoDate" type="text"
						class="form-control" readonly="true" /></td>
			</tr>
		</table>
		<div class="card-header d-flex justify-content-end gap-3">
		<button type="submit" class="btn btn-primary">
			 <span class="align-middle">일정수정</span>
		</button>
		<a href="javascript:;" onclick="history.back();" class="btn btn-secondary">뒤로가기</a>
		</div>
	</form:form>
</div>
</div>