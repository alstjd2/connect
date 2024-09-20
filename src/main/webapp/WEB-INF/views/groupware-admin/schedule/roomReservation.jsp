<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="card mb-6">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">회의실 예약조회</a>
				</div>
			</nav>
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-md-4">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
								<div>
									<h4 class="mb-0 fw-bold">오늘 예약 수</h4>
								</div>
								<c:set var="todayListCount" value="${fn:length(todayList) }"/>

								<span class="avatar w-px-40 h-px-40 p-2 me-lg-6"> <span
									class="avatar-initial bg-label-secondary rounded">${todayListCount}</span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-md-none">
						</div>
						<div class="col-md-4">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
								<div>
									<h4 class="mb-0 fw-bold">오늘 예약 취소</h4>
								</div>
								<c:set var="deleteListCount" value="${fn:length(deleteList) }"/>
								<span class="avatar w-px-40 h-px-40 p-2 me-lg-6"> <span
									class="avatar-initial bg-label-secondary rounded">${deleteListCount}</span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-md-none">
						</div>
						<div class="col-md-4">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<h4 class="mb-0 fw-bold">이번 달 총 예약</h4>
								</div>
								<c:set var="monthAllListCount" value="${fn:length(monthAllList) }"/>
								<span class="avatar w-px-40 h-px-40 p-2"> <span
									class="avatar-initial bg-label-secondary rounded">${monthAllListCount}</span>
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
								<div class="col-12 col-lg-3">
									<input type="text" class="form-control dt-input"
										data-column="3" placeholder="사원명 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-lg-3">
									<input type="text" class="form-control dt-input"
										data-column="2" placeholder="회의실 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-lg-3">
									<div class="mb-0">
										<input type="text"
											class="form-control dt-date flatpickr-range dt-input"
											data-column="7" placeholder="예약일 검색" data-column-index="7"
											name="dt_date" /> <input type="hidden"
											class="form-control dt-date start_date dt-input"
											data-column="7" data-column-index="7"
											name="value_from_start_date" /> <input type="hidden"
											class="form-control dt-date end_date dt-input"
											name="value_from_end_date" data-column=7"
											data-column-index="7" />
									</div>
								</div>
								<div class="col-12 col-lg-2">
									<a class="kanban-add-board-btn btn btn-label-secondary w-100" href="${cPath }/gw/room/adminRoomReservation.do"><i class='bx bx-show me-2' ></i>예약 한눈에 보기</a>
								</div>
								<div class="col-12 col-lg-2 app_state"></div>
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
							<th>회의실</th>
							<th>사원명</th>
							<th>부서(조직)</th>
							<th>예약시간</th>
							<th>예약인원</th>
							<th>예약일</th>
							<th>예약진행상태</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th></th>
							<th>NO</th>
							<th>회의실</th>
							<th>사원명</th>
							<th>부서(조직)</th>
							<th>예약시간</th>
							<th>예약인원</th>
							<th>예약일</th>
							<th>예약진행상태</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<!--/ Advanced Search -->
	</div>
</div>
</div>
</div>
<script defer src="${cPath}/resources/js/app/jhjUa/roomReservation.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/sweetAlert.js"></script>
