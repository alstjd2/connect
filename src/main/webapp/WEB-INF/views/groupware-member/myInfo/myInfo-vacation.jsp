<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">

	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card mb-6 overflow-hidden">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">
						<i class="menu-icon bx bx-calendar-star"></i>
						내 휴가관리
					</a>
				</div>
			</nav>
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-sm-6 col-lg-4">
							<div
								class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-4 pb-sm-0">
								<div>
									<h4 class="mb-0 fw-bold">발생 연차</h4>
								</div>
								<span class="avatar w-px-40 h-px-40 me-sm-6"> <span
									class="avatar-initial bg-label-primary rounded">
										${vacCnt.applicationList[0].vacationInfo.vaciDay } </span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-lg-none me-6">
						</div>
						<br>
						<div class="col-sm-6 col-lg-4">
							<div
								class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
								<div>
									<h4 class="mb-0 fw-bold">사용 연차</h4>
								</div>
								<c:if test="${not empty vacUseCnt.applicationList[0].cnt}">
									<span class="avatar w-px-40 h-px-40 p-2 me-sm-6"> <span
										class="avatar-initial bg-label-primary rounded">
											${vacUseCnt.applicationList[0].cnt} </span>
									</span>
								</c:if>
								<c:if test="${empty vacUseCnt.applicationList[0].cnt}">
									<span class="avatar w-px-40 h-px-40 p-2 me-sm-6"> <span
										class="avatar-initial bg-label-primary rounded"> 0 </span>
									</span>
								</c:if>
							</div>
						</div>
						<div class="col-sm-6 col-lg-4">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<h4 class="mb-0 fw-bold">잔여 연차</h4>
								</div>
								<span class="avatar w-px-40 h-px-40 p-2"> <span
									class="avatar-initial bg-label-primary rounded">

									 <c:set
											var="remainingDays"
											value="${vacCnt.applicationList[0].vacationInfo.vaciDay - vacUseCnt.applicationList[0].cnt}" />
										${remainingDays}
								</span>
								</span>
							</div>
						</div>
					</div>
				</div>

				<div class="card-widget-separator-wrapper">
					<div class="card-body card-widget-separator">
						<div class="row gy-4 gy-sm-1">
							<div class="col-sm-6 col-lg-4">
								<div
									class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-4 pb-sm-0">
									<div>
										<h4 class="mb-0 fw-bold">발생 특별휴가</h4>
										<span class="m-0 fw-light text-seconary toDay" style="font-size: 12px">▪ 숫자를 클릭하시면 발생 된 특별휴가를 조회하실 수 있습니다</span>
									</div>
									<c:if test="${not empty speAllCnt.cnt}">
										<span class="avatar w-px-40 h-px-40 me-sm-6">
											<button type="button" data-bs-toggle="modal"
												data-bs-target="#modalCenter" aria-controls="modalCenter"
												class="btn-link"
												id="kanban-add-board-btn">
												<span class="avatar-initial bg-label-primary rounded">
													${speAllCnt.cnt } </span>

											</button>
										</span>
									</c:if>
									<c:if test="${empty speAllCnt.cnt}">
										<span class="avatar w-px-40 h-px-40 p-2 me-sm-6"> <span
											class="avatar-initial bg-label-primary rounded">
												<button type="button" data-bs-toggle="modal"
													data-bs-target="#modalCenter" aria-controls="modalCenter"
													class="btn-link"
													id="kanban-add-board-btn">
													<span class="avatar-initial bg-label-primary rounded">
														0 </span>

												</button>

										</span>
										</span>
									</c:if>

								</div>
								<hr class="d-none d-sm-block d-lg-none me-6">
							</div>
							<br>
							<div class="col-sm-6 col-lg-4">
								<div
									class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
									<div>
										<h4 class="mb-0 fw-bold">사용 특별휴가</h4>
									</div>
									<c:if test="${not empty speUseCnt.cnt}">
										<span class="avatar w-px-40 h-px-40 me-sm-6">
												<span class="avatar-initial bg-label-primary rounded">
													${speUseCnt.cnt } </span>

										</span>
									</c:if>
									<c:if test="${empty speUseCnt.cnt}">
										<span class="avatar w-px-40 h-px-40 p-2 me-sm-6"> <span
											class="avatar-initial bg-label-primary rounded">
													<span class="avatar-initial bg-label-primary rounded">
														0 </span>


										</span>
										</span>
									</c:if>
								</div>
							</div>
							<div class="col-sm-6 col-lg-4">
								<div class="d-flex justify-content-between align-items-start">
									<div>
										<h4 class="mb-0 fw-bold">잔여 특별휴가</h4>
										<span class="m-0 fw-light text-seconary toDay" style="font-size: 12px">▪ 숫자를 클릭하시면 잔여 특별휴가를 조회하실 수 있습니다</span>
									</div>
									<span class="avatar w-px-40 h-px-40 p-2">
										<button type="button" data-bs-toggle="modal"
											data-bs-target="#modal" aria-controls="modalCenter"
											class="btn-link"
											id="kanban-add-board-btn">
											<span class="avatar-initial bg-label-primary rounded">
												<c:set var="remainingSpeDays"
													value="${speAllCnt.cnt - speUseCnt.cnt}" />
												${remainingSpeDays}
											</span>
										</button>
									</span>
								</div>
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
								<a href="${cPath }/gw/vacation/applicationInsert.do"
									class="btn btn-primary col-12 col-sm-6 col-lg-3"> <i
									class='tf-icons bx bx-plus bx-18px me-2'></i> 휴가신청
								</a>
								<div class="col-12 col-sm-6 col-lg-3">
									<input type="text" class="form-control dt-input"
										data-column="2" placeholder="휴가종류 검색" data-column-index="1" />
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
							<th>내용</th>
							<th>시작일자</th>
							<th>사용연차일수</th>
							<th>신청일</th>
							<th>상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<!--/ Advanced Search -->
	</div>
</div>
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalCenterTitle">발생 특별휴가목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table">
					<thead>
						<tr>
							<th>특별휴가명</th>
							<th>휴가일수</th>
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<c:forEach items="${empSpeUseList }" var="empSpeList"
							varStatus="status">
							<tr>
								<td>${empSpeList.vacationInfo.vaciNm }</td>
								<td>${empSpeList.vacationInfo.vaciDay }일</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalCenterTitle">잔여 특별휴가목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table">
					<thead>
						<tr>
							<th>특별휴가명</th>
							<th>휴가일수</th>
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<c:forEach items="${empSpeList }" var="empSpeList"
							varStatus="status">
							<tr>
								<td>${empSpeList.vacationInfo.vaciNm }</td>
								<td>${empSpeList.vacationInfo.vaciDay }일</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<script defer src="${cPath}/resources/js/app/jhjUa/myInfo-vacation.js"></script>