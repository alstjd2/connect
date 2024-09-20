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
<div class="table-responsive text-nowrap">
	<form:form method="post" modelAttribute="todoList"
		action="${cPath }/gw/todoList/todoListUpdate.do"
		enctype="multipart/form-data">
		<form:hidden path="todoNo" />
		<form:hidden path="empNo" />
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
				<td>카테고리</td>
				<td>
				<form:select path="todoCate.todocateNo" class="form-control">
				  <option value="">카테고리선택</option>
				  <c:forEach items="${todoCateList}" var="todoCateList">
				    <c:if test="${todoList.todoCate.todocateNo == todoCateList.todocateNo}">
				      <form:option value="${todoCateList.todocateNo}"
				                   label="${todoCateList.todocateTitle}" selected="selected" />
				    </c:if>
				    <c:if test="${todoList.todoCate.todocateNo != todoCateList.todocateNo}">
				      <form:option value="${todoCateList.todocateNo}"
				                   label="${todoCateList.todocateTitle}" />
				    </c:if>
				  </c:forEach>
				</form:select>
					<form:errors path="todoCate" cssClass="text-danger" element="span" />
					<form:hidden path="todoCate.todocateNo" value="${todoList.todoCate.todocateNo}" />
					<form:hidden path="todoCate.todocateTitle" value="${todoList.todoCate.todocateTitle}" />
				</td>
			</tr>

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
	</form:form>
	</div>
</div>
</div>