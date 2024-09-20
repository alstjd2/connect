<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="app-addr card" id="app-addr">
		<div class="row g-0">
			<!-- Email Sidebar -->
			<div class="col app-addr-sidebar border-end flex-grow-0"
				id="app-addr-sidebar">
				<div class="btn-compost-wrapper d-grid">
					<h5 class="fw-bold mb-0 text-primary">
						<i class="menu-icon tf-icons bx bxs-user-detail"></i> 주소록
					</h5>
				</div>
				<!-- addr Filters -->
				<div class="addr-filters pt-4 pb-2 overscoll">
					<ul class="addr-filter-folders list-unstyled">
						<li class=" d-flex mb-1" >
                                            <a href="${cPath}/gw/address/orgaddressList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bx-buildings'></i>
                                                <span class="align-middle ms-2">조직도</span>
                                            </a>
                                        </li>
						<li class="d-flex justify-content-between align-items-center mb-1">
                              <div id="organization" class="overflow-auto p-1"></div>
						</li>
						<li class="active d-flex mb-1" >
                           <a href="${cPath}/gw/address/addressgroupList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bxs-group'></i>
                                                <span class="align-middle ms-2">그룹</span>
                                            </a>
                        </li>
						<li class="d-flex justify-content-between mb-1"><a
							href="${cPath}/gw/address/addressBookMarkList.do"
							class="d-flex flex-wrap align-items-center"> <i
								class="bx bx-star"></i> <span class="align-middle ms-2">즐겨찾기</span>
						</a></li>
						<li class="d-flex justify-content-between align-items-center mb-1">
							<a href="${cPath}/gw/address/addressList.do"
							class="d-flex flex-wrap align-items-center"> <i
								class='bx bxs-user-pin'></i> <span class="align-middle ms-2">외부연락처</span>
						</a>
						</li>
						<li class=" d-flex align-items-center"><a
							href="${cPath}/gw/address/trashList.do"
							class="d-flex flex-wrap align-items-center"> <i
								class="bx bx-trash"></i> <span class="align-middle ms-2">휴지통</span>
						</a></li>
					</ul>
				</div>
			</div>
			<!--/ addr Sidebar -->
			<div class="col app-emails-list d-flex"
				style="background: ghostwhite;"  id="employee-list-container">

				<div class="card col-md-6 m-auto">
					<div
						class="card-header d-flex justify-content-between align-items-center">

						<h5 class="mb-0">그룹 수정</h5>
						<small class="text-body float-end">address</small>
					</div>
					<div class="card-body">
						<form:form method="post" modelAttribute="group" 
							class="container mt-4">
							<form:hidden path="grpNo" id="jsongrp"/>
							<div class="mb-6">
								<label for="grpNm" class="form-label">그룹명</label>
								<form:input type="text" path="grpNm" id="grpNm"
									class="form-control" required="required" maxlength="16" />
								<form:errors path="grpNm" cssClass="text-danger" element="span" />
							</div>
						
							<div class="mb-6">
								<label class="form-label" for="adrMail">그룹소개</label>
								<form:input type="text" path="grpCm" id="grpCm"
									class="form-control" maxlength="150"/>
								<form:errors path="grpCm" cssClass="text-danger"
									element="span" />
							</div>
							<div class="mb-6">
							    <label class="form-label" for="TagifyUserList">멤버선택</label>
							    <input type="text" id="TagifyUserList" name="TagifyUserList" class="form-control" />
							</div>

							<div style="text-align: right;">
								<button type="button" class="btn btn-primary">수정</button>
								<a href="javascript:;" onclick="history.back();"
									class="btn btn-secondary">취소</a>
							</div>

							<br>
							<br>
						</form:form>
					</div>
				</div>
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
			<div class="app-overlay"></div>
		</div>
		<!-- /addr List -->

		<!-- detail.jsp -->
		<div class="col app-addr-sidebar-right app-sidebar "
			id="app-addr-sidebar-right"></div>
	</div>
	<!-- Toast Container -->
               <div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed  p-3 d-flex gap-3 flex-wrap" style="top: 40px; right: 20px ;
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
</div>



<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareMember/assets/js/organization-ui-treeview2.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/addressBook-group.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>

<!-- <script defer type="text/javascript" -->
<%-- 	src="${cPath}/resources/js/app/hjadr/groupempList.js"></script> --%>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/groupempUpdate.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/groupUpdate.js"></script>