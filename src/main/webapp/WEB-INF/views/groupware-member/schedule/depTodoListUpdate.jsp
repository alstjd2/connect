<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">

 <div class="card col-md-6 m-auto">
					<div class="card-header d-flex justify-content-between align-items-center">

						<h5 class="mb-0">부서일정 수정</h5>
						<small class="text-body float-end">TodoList</small>
					</div>
					
					<div class="card-body">
							<form:form method="post" modelAttribute="todoList" action="${cPath }/gw/todoList/calDeptodoListUpdate.do" enctype="multipart/form-data">
									<form:hidden path="todoNo" />
									<form:hidden path="empNo" />
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">일정 제목</label>
								<form:input type="text" path="todoTitle"	class="form-control" required="required" /> 
								<form:errors path="todoTitle" cssClass="text-danger" element="span" />
							</div>
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">일정 내용</label>
								<form:textarea path="todoContent" class="form-control" />
							</div>
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">일정 시작일</label>
								<form:input path="todoStart" type="datetime-local" class="form-control" />
							</div>
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">일정 종료일</label>
								<form:input path="todoEnd" type="datetime-local"	class="form-control" />
							</div>
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">일정 등록일</label>
								<form:input path="todoDate" type="text" 		class="form-control" readonly="true" />
							</div>
							<div style="text-align: right;">
								<button type="submit" class="btn btn-primary">수정</button>
								<a href="javascript:;" onclick="history.back();" class="btn btn-secondary">취소</a>
							</div>

							<br>
							<br>
							</form:form>
					</div>
				</div>
    









