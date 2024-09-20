<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	
		<div class="card mb-6 overflow-hidden" style="background: transparent; box-shadow: none;">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">
						<i class="menu-icon bx bx-edit-alt"></i>
						내 정보수정
					</a>
				</div>
			</nav>
		</div>
		<div class="card mb-6">
			<div class="card-body">
				<button class="btn btn-primary me-1" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseExample"
					aria-expanded="true" aria-controls="collapseExample">비밀번호
					변경하기</button>
				<div class="collapse" id="collapseExample" style="">
					<div class="card-body pt-8">
						<form id="formAccountSettings" method="POST"
							class="fv-plugins-bootstrap5 fv-plugins-framework"
							novalidate="novalidate">
							<div class="row">
								<div
									class="mb-6 col-md-6 form-password-toggle fv-plugins-icon-container">
									<label class="form-label" for="currentPassword">현재 비밀번호</label>
									<div class="input-group input-group-merge has-validation">
										<input class="form-control" type="password"
											name="currentPassword" id="currentPassword"
											placeholder="············" required="required"> <span
											class="input-group-text cursor-pointer"><i
											class="bx bx-hide"></i></span>
									</div>
									<div
										class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
								</div>
							</div>
							<div class="row">
								<div
									class="mb-6 col-md-6 form-password-toggle fv-plugins-icon-container">
									<label class="form-label" for="newPassword">변경 비밀번호</label>
									<div class="input-group input-group-merge has-validation">
										<input class="form-control" type="password" id="newPassword"
											name="newPassword" placeholder="············" required="required"> <span
											class="input-group-text cursor-pointer"><i
											class="bx bx-hide"></i></span>
									</div>
									<div
										class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
								</div>

								<div
									class="mb-6 col-md-6 form-password-toggle fv-plugins-icon-container">
									<label class="form-label" for="confirmPassword">변경
										비밀번호확인</label>
									<div class="input-group input-group-merge has-validation">
										<input class="form-control" type="password"
											name="confirmPassword" id="confirmPassword"
											placeholder="············" required="required"> <span
											class="input-group-text cursor-pointer"><i
											class="bx bx-hide"></i></span>
									</div>
									<div
										class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
								</div>
							</div>
							<div class="mt-6">
								<button type="submit" id="submitbtn"
									class="btn btn-primary me-3">수정하기</button>
								<button type="reset" class="btn btn-label-secondary">리셋</button>
							</div>
							<input type="hidden" name="empNo" value="${employee.empNo}" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-6">
			<!-- Account -->
			<form:form method="post" modelAttribute="employee"
				enctype="multipart/form-data">
				<form:hidden path="comNo" />
				<form:hidden path="empNo" />
				<input type="hidden" id="imageModified" name="imageModified" value="false" />
				
				<div class="card-body">
					<div
						class="d-flex align-items-start align-items-sm-center gap-6 pb-4 border-bottom">
						<label for="upload" tabindex="0" style="cursor: pointer;">

							<c:choose>
								<c:when test="${not empty employee.empProfile}">
									 <c:url value='/files/${employee.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
																					
									<img src="${fileUrl }"
											class="d-block w-px-100 h-px-100 rounded" id="uploadedAvatar"
										alt="프로필 사진" width="150" height="150"
									/>
									
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/resources/groupwareMember/assets/img/avatars/1.png"
										class="d-block w-px-100 h-px-100 rounded" id="uploadedAvatar">
								</c:otherwise>
							</c:choose> <input type="file" id="upload"
							name="atchFile.fileDetails[0].uploadFile"
							class="account-file-input" hidden=""
							accept="image/png, image/jpeg">
						</label>

						<div class="button-wrapper">
<!-- 							<button type="button" -->
<!-- 								class="btn btn-label-secondary account-image-reset mb-4" > -->
<!-- 								<i class="bx bx-reset d-block d-sm-none"></i>  -->
<!-- 								<span class="d-none d-sm-block">리셋</span> -->
<!-- 							</button> -->

							<div>JPG, GIF 또는 PNG 허용.최대사이즈 800K</div>
						</div>
					</div>
				</div>
				<div class="card-body pt-4">

					<div class="row g-6">
						<div class="col-md-4">
							<label for="name" class="form-label">이름</label>
							<form:input type="text" path="empNm" class="form-control"
								required="required" readonly="true" disabled="true" />
							
						</div>
						<div class="col-md-4">
							<label for="email" class="form-label">회사이메일</label>
							<div class="input-group input-group-merge disabled ">
								<form:input type="text" path="empCommail" class="form-control"
									required="required" readonly="true" aria-label="e-mail"
									aria-describedby="email" />
							</div>
						</div>
						<div class="col-md-4">
							<label for="multicol-birthdate" class="form-label">입사일</label>
							<div class="input-group input-group-merge disabled ">
								<form:input type="date" path="empJoindate"
									class="form-control  dob-picker flatpickr-input active"
									readonly="true" />

							</div>
						</div>
						<c:choose>
						    <c:when test="${not empty employee.company.organizationList}">
						        <c:forEach var="organization" items="${employee.company.organizationList}">
						            <div class="col-md-4">
						                <label for="" class="form-label">부서(조직)</label>
						                <input type="text" value="${organization.orgDep}" class="form-control" readonly="true" disabled="true" />
						            </div>
						        </c:forEach>
						    </c:when>
						    <c:otherwise>
						        <div class="col-md-4">
						            <label for="" class="form-label">부서(조직)</label>
						            <input type="text" value="" class="form-control" readonly="true" disabled="true" />
						        </div>
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${not empty employee.company.positionList}">
						        <c:forEach var="position" items="${employee.company.positionList}">
						            <div class="col-md-4">
						                <label for="" class="form-label">직급</label>
						                <input type="text" id="position" class="form-control" value="${position.posNm}" readonly disabled />
						            </div>
						        </c:forEach>
						    </c:when>
						    <c:otherwise>
						        <div class="col-md-4">
						            <label for="" class="form-label">직급</label>
						            <input type="text" id="position" class="form-control" value="" readonly disabled />
						        </div>
						    </c:otherwise>
						</c:choose>
						
						<c:choose>
						    <c:when test="${not empty employee.company.positionList}">
						        <c:forEach var="position" items="${employee.company.positionList}">
						            <div class="col-md-4">
						                <label for="" class="form-label">직책</label>
						                <input type="text" id="onePosition" class="form-control" value="${position.ONEPOSNM}" readonly disabled />
						            </div>
						        </c:forEach>
						    </c:when>
						    <c:otherwise>
						        <div class="col-md-4">
						            <label for="" class="form-label">직책</label>
						            <input type="text" id="onePosition" class="form-control" value="" readonly disabled />
						        </div>
						    </c:otherwise>
						</c:choose>

						<div class="col-md-6">
							<label for="empComtel" class="form-label">사내번호</label>
							<form:input type="text" path="empComtel" class="form-control" maxlength="14" />
							<form:errors path="empComtel" cssClass="text-danger"
								element="span" />
						</div>
						<div class="col-md-6">
							<label class="form-label" for="empTel">휴대폰번호</label>
							<div class="input-group input-group-merge">
								<span class="input-group-text">KR (+82)</span>
								<form:input type="text" path="empTel" class="form-control" maxlength="13" />
								<form:errors path="empTel" cssClass="text-danger" element="span" />
							</div>
						</div>
						<div class="col-md-6">
							<label for="empMail" class="form-label">개인이메일</label>
							<form:input type="text" path="empMail" class="form-control" maxlength="40"
								aria-label="e-mail" aria-describedby="" />
							<form:errors path="empMail" cssClass="text-danger" element="span" />
						</div>
						<div class="col-md-6">
							<label for="multicol-birthdate" class="form-label">생일</label>
							<div class="input-group input-group-merge">
								<form:input type="date" path="empBir"
									class="form-control dob-picker flatpickr-input active" />
								<form:errors path="empBir" cssClass="text-danger" element="span" />
							</div>
						</div>
					</div>
					<div class="mt-10 text-center">
						<button type="submit" class="btn btn-primary me-3">수정</button>
					</div>
			</form:form>
		</div>
		 <!-- Toast Container -->
               <div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed p-3" style="top: 80px; right: 20px;
    				z-index: 10000; width: 350px;">
                   <!-- Toast Template -->
                   <div id="toast-template" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
                       <div class="toast-header">
                           <i class="bx bx-bell me-2"></i>
                           <div class="me-auto fw-medium">알림</div>
                           <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                       </div>
                       <div class="toast-body">
                           메시지 내용
                       </div>
                   </div>
               </div>
		<!-- /Account -->
	</div>
</div>

<script defer src="${cPath}/resources/js/app/hjadr/myInfo.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/myInfo-modify.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/form-layouts.js"></script>