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
						<li class=" d-flex mb-1" >
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
						<li class="active d-flex justify-content-between align-items-center mb-1">
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

						<h5 class="mb-0">외부연락처 수정</h5>
						<small class="text-body float-end">address</small>
					</div>
					<div class="card-body">
						<form:form method="post" modelAttribute="address"
							class="container mt-4">
							<form:hidden path="adrNo" />
							<form:hidden path="empNo" />
							<div class="mb-6">
								<label for="adrNm" class="form-label">이름</label>
								<form:input type="text" path="adrNm" id="adrNm"
									class="form-control" required="required" />
								<form:errors path="adrNm" cssClass="text-danger" element="span" />
							</div>
							<div class="row">
								<div class="mb-6 col-md-4">
									<label for="adrOnepos" class="form-label">직책</label>
									<form:input type="text" path="adrOnepos" id="adrOnepos"
										class="form-control" />
									<form:errors path="adrOnepos" cssClass="text-danger"
										element="span" />
								</div>
								<div class="mb-6 col-md-4">
									<label class="form-label" for="adrPos">직급</label>
									<form:input type="text" path="adrPos" id="adrPos"
										class="form-control" />
									<form:errors path="adrPos" cssClass="text-danger"
										element="span" />

								</div>
								<div class="mb-6 col-md-4">
									<label class="form-label" for="adrDep">부서(조직)</label>
									<form:input type="text" path="adrDep" id="adrDep"
										class="form-control" />
									<form:errors path="adrDep" cssClass="text-danger"
										element="span" />
								</div>
							</div>
							<div class="row">
								<div class="mb-6 ">
									<label class="form-label" for="adrAff">소속</label>
									<form:input type="text" path="adrAff" id="adrAff"
										class="form-control" />
									<form:errors path="adrAff" cssClass="text-danger"
										element="span" />
								</div>
							</div>
							<div class="mb-6">
								<label class="form-label" for="adrMail">이메일</label>
								<form:input type="email" path="adrMail" id="adrMail"
									class="form-control" />
								<form:errors path="adrMail" cssClass="text-danger"
									element="span" />
							</div>
							<div class="mb-6">
								<label class="form-label" for="adrTel">연락처</label>
								<form:input type="text" path="adrTel" id="adrTel"
									class="form-control" required="required" />
								<form:errors path="adrTel" cssClass="text-danger" element="span" />
							</div>

							<div style="text-align: right;">
								<button type="submit" class="btn btn-primary">수정</button>
								<a href="javascript:;" onclick="history.back();"
									class="btn btn-secondary">취소</a>
							</div>

							<br>
							<br>
						</form:form>
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
</div>



<!-- Page JS -->
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/organization-ui-treeview2.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/addressBook-group.js"></script>

<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/addressList.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/detail.js"></script>

