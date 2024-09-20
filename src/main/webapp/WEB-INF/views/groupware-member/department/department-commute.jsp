<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:forEach items="${dfVacList }" var="df">
<c:choose>
<c:when test="${df.empNo eq empDetail.empNo}">
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card mb-6 overflow-hidden">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid justify-content-start">
					<i class="menu-icon bx bx-calendar-star"></i>
					<a class="navbar-brand" href="javascript:void(0)">부서(조직) 휴가관리</a>
				</div>
			</nav>
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-md-4">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
								<div>
									<h4 class="mb-0 fw-bold">진행중</h4>
								</div>
								<span class="avatar w-px-40 h-px-40 p-2 me-lg-6"> <span
									class="avatar-initial bg-label-secondary rounded"> ${appDepIngCnt.cnt } </span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-md-none">
						</div>
						<div class="col-md-4">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
								<div>
									<h4 class="mb-0 fw-bold">승인완료</h4>
								</div>
								<span class="avatar w-px-40 h-px-40 p-2 me-lg-6"> <span
									class="avatar-initial bg-label-secondary rounded"> ${appDepAproveCnt.cnt } </span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-md-none">
						</div>
						<div class="col-md-4">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<h4 class="mb-0 fw-bold">반려</h4>
								</div>
								<span class="avatar w-px-40 h-px-40 p-2"> <span
									class="avatar-initial bg-label-secondary rounded"> ${appDepCnt.cnt } </span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Advanced Search -->
		<div class="card">
			<!--Search Form -->
			<div class="card-body">
				<form class="dt_adv_search" method="GET">
					<div class="row">
						<div class="col-12">
							<div class="row g-3">
								<div class="col-12 col-sm-6 col-lg-3">
									<input type="text" class="form-control dt-input"
										data-column="3" placeholder="사원명 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-sm-6 col-lg-3">
									<input type="text" class="form-control dt-input"
										data-column="2" placeholder="연차종류 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-sm-6 col-lg-3">
									<div class="mb-0">
										<input type="text"
											class="form-control dt-date flatpickr-range dt-input"
											data-column="4" placeholder="시작일자 검색" data-column-index="3"
											name="dt_date" /> <input type="hidden"
											class="form-control dt-date start_date dt-input"
											data-column="4" data-column-index="3"
											name="value_from_start_date" /> <input type="hidden"
											class="form-control dt-date end_date dt-input"
											name="value_from_end_date" data-column="4"
											data-column-index="3" />
									</div>
								</div>
								<div class="col-12 col-sm-6 col-lg-3 app_state"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="card-datatable table-responsive">
				<table class="dt-advanced-search table border-top">
					<thead>
						<tr>
							<th></th>
							<th>NO</th>
							<th>연차종류</th>
							<th>사원명</th>
							<th>시작일자</th>
							<th>사용연차일수</th>
							<th>상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<!--/ Advanced Search -->
	</div>
</div>
</c:when>
</c:choose>
</c:forEach>
<script defer
	src="${cPath}/resources/js/app/jhjUa/department-attendance.js"></script>
<script defer
	src="${cPath}/resources/js/app/jhjUa/department-vacation.js"></script>