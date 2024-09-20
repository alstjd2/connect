<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
    
    
    <div class="card col-md-6 m-auto">
					<div class="card-header d-flex justify-content-between align-items-center">

						<h5 class="mb-0">내 카테고리 수정</h5>
						<small class="text-body float-end">category</small>
					</div>
					
					<div class="card-body">
						<form id="todoCate" class="container mt-4" action="${cPath }/gw/todoList/todoCateUpdate.do" method="post">
							<input id="empNo" name="empNo" type="hidden" value="${todoCate.empNo }">
							<input id="todocateNo" name="todocateNo" type="hidden" value="${todoCate .todocateNo}">
							<input id="todocateDate" name="todocateDate" type="hidden" value="${todoCate .todocateDate}">
							<div class="mb-6">
								<label for="todocateTitle" class="form-label">카테고리명</label>
								<input id="todocateTitle" name="todocateTitle" type="text" class="form-control" required="required" value="${todoCate.todocateTitle }">
							</div>

							<div style="text-align: right;">
								<button type="submit" class="btn btn-primary">수정</button>
								<a href="javascript:;" onclick="history.back();" class="btn btn-secondary">취소</a>
							</div>

							<br>
							<br>
						</form>
					</div>
				</div>
    
    