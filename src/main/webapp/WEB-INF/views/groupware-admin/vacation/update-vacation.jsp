<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



    <div class="card col-md-6 m-auto">
					<div class="card-header d-flex justify-content-between align-items-center">

						<h5 class="mb-0">휴가 수정</h5>
						<small class="text-body float-end">vacation</small>
					</div>

					<div class="card-body">
						<form id="vacationInfo" class="container mt-4" action="${cPath }/gw/vacation/vacationUpdate.do" method="post">
							<input id="vaciNo" name="vaciNo" type="hidden" value="${vacationInfo.vaciNo }">
							<input id="vaciDate" name="vaciDate" type="hidden" value="${vacationInfo.vaciDate }">
							<input id="vaciType" name="vaciType" type="hidden" value="${vacationInfo.vaciType }">
							<input id="vaciDelyn" name="vaciDelyn" type="hidden" value="${vacationInfo.vaciDelyn }">
							<input id="comNo" name="comNo" type="hidden" value="${vacationInfo.comNo }">
							<div class="mb-6">
								<label for="vaciNm" class="form-label">휴가명</label>
								<input id="vaciNm" name="vaciNm" type="text" class="form-control" required="required" value="${vacationInfo.vaciNm}">
							</div>
							<div class="mb-6">
								<label for="vaciDay" class="form-label">휴가일수 (숫자만 입력가능)</label>
								<input id="vaciDay" name="vaciDay" type="number" placeholder="숫자만 입력해주세요" class="form-control" required="required" value="${vacationInfo.vaciDay}">
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

