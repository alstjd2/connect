<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">

 <div class="card col-md-6 m-auto">
					<div class="card-header d-flex justify-content-between align-items-center">

						<h5 class="mb-0">회의실 수정</h5>
						<small class="text-body float-end">RoomList</small>
					</div>
					
					<div class="card-body">
							<form:form method="post" modelAttribute="roomList" action="${cPath }/gw/room/roomUpdate.do" enctype="multipart/form-data">
							<div class="mb-6">
								<label for="roomNm" class="form-label">회의실 이름</label>
								<form:input type="text" path="roomNm"	class="form-control" required="required" /> 
								<form:errors path="roomNm" cssClass="text-danger" element="span" />
							</div>
							<div class="mb-6">
								<label for="roomLoc" class="form-label">장소</label>
								<form:textarea path="roomLoc" class="form-control" />
							</div>
							<div class="mb-6">
								<label for="roomEmpmax" class="form-label">최대인원</label>
								<form:input type="text" path="roomEmpmax"	class="form-control" required="required" /> 
									<form:errors path="roomEmpmax" cssClass="text-danger" element="span" />
									<form:hidden path="comNo" value="${comNo}" />
									<form:hidden path="roomNo" value="${roomNo}" />
									<form:hidden path="roomState" value="${roomState}" />
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
    









