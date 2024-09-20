<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="container mb-10">
        <div class="card">
            <h5 class="card-header fw-bold pt-10 fs-4">
                <span>문서 번호 관리</span>
                <p class="fs-6 fw-light mb-0">일련번호는 연별로 초기화됩니다.</p>
            </h5>
            <div class="card-body">
                <div class="alert alert-solid-dark d-flex align-items-center mb-8" role="alert">
                    <span class="alert-icon rounded-circle">
                        <i class="bx bx-xs bx-detail"></i>
                    </span>
                    <b class="me-2">미리보기 </b>
                    <b>                    
	                    <span id="cnfNo">2024</span>
	                    <span id="between1">_</span>
	                    <span id="dcmCode">cus00001</span>
	                    <span id="between2">_</span>
	                    <span id="dcmNum">000001</span>
                    </b>
                </div>
                <form:form modelAttribute="comDcmNum" action="">
                	<form:hidden path="comNo" />
                	<form:hidden path="comdcmNumNo" />
                    <ul class="mb-4 row p-0">
                        <li class="mb-4 row">
                            <label for="dcmNumCnfNo" class="col-md-2 col-form-label fw-bold">문서 번호 형식</label>
                            <div class="col-md-10">
                                <form:select id="dcmNumCnfNo" path="dcmNumCnfNo" cssClass="form-select">
                                    <form:option value="">문서번호형식</form:option>
                                    <form:option value="DB02110">연월일+서식구분+일련번호</form:option>
                                    <form:option value="DB02120">서식구분+일련번호</form:option>
                                    <form:option value="DB02130">일련번호</form:option>
                                    <form:option value="DB02140">연월일+일련번호</form:option>
                                </form:select>
                            </div>
                        </li>
                        <li class="mb-4 row" id="dateCnfNo">
                            <label for="dateCnfNo" class="col-md-2 col-form-label fw-bold">연월일 구성</label>
                            <div class="col-md-10">
                                <form:select path="dateCnfNo" cssClass="form-select">
                                    <form:option value="">연월일 구성</form:option>
                                    <form:option value="DB03110">연도 2자리</form:option>
                                    <form:option value="DB03120">연도 4자리</form:option>
                                    <form:option value="DB03130">연월 6자리</form:option>
                                    <form:option value="DB03140">연월일 8자리</form:option>
                                </form:select>
                            </div>
                        </li>
                        <li class="mb-4 row align-items-center" id="dcmCodeNo">
                            <label class="col-md-2 col-form-label fw-bold">서식구분</label>
                            <div class="col-md-10">
                                서식코드는 제공하는 서식의 코드로 적용됩니다.
                            </div>
                        </li>
                        <li class="mb-4 row align-items-center" id="dcmNumLen">
                            <label for="docNumLen" class="col-md-2 col-form-label fw-bold">일련번호 길이</label>
                            <div class="col-md-10">
                                <form:select path="dcmNumLen" cssClass="form-select">
								    <form:option value="">일련번호 길이</form:option>
								    <form:option value="4">4</form:option>
								    <form:option value="5">5</form:option>
								    <form:option value="6">6</form:option>
								    <form:option value="7">7</form:option>
								</form:select>
                            </div>
                        </li>
                        <li class="mb-4 row align-items-center" id="dcmDisCnfNo">
                            <label for="dcmDisCnfNo" class="col-md-2 col-form-label fw-bold">구분자 선택</label>
                            <div class="col-md-10">
                                <form:select path="dcmDisCnfNo" cssClass="form-select">
                                    <form:option value="">구분자 선택</form:option>
                                    <form:option value="DB04110">_</form:option>
                                    <form:option value="DB04120">-</form:option>
                                    <form:option value="DB04130">/</form:option>
                                    <form:option value="DB04140">~</form:option>
                                    <form:option value="DB04150">공백</form:option>
                                </form:select>
                            </div>
                        </li>
                    </ul>
                    <div class="mb-4 p-3 text-center">
                        <button type="button" class="btn btn-primary" id="submit">저장하기</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/document-number.js"></script>