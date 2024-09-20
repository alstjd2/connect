<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card mb-6">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">부재 신청 현황</a>
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
									class="avatar-initial bg-label-secondary rounded"> ${comVacIngCnt.cnt } </span>
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
									class="avatar-initial bg-label-secondary rounded"> ${comApproveCnt.cnt } </span>
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
									class="avatar-initial bg-label-secondary rounded"> ${comCnt.cnt }  </span>
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
								<div class="col-12 col-lg-2">
									<input type="text" class="form-control dt-input"
										data-column="2" placeholder="사원명 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-lg-2">
									<input type="text" class="form-control dt-input"
										data-column="4" placeholder="연차종류 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-lg-2">
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
								<div class="col-12 col-lg-2 app_state"></div>
								<div class="col-12 col-lg-2">
									<button type="button" data-bs-toggle="modal"
										data-bs-target="#modalCenter" aria-controls="modalCenter"
										class="kanban-add-board-btn btn btn-primary w-100"
										id="kanban-add-board-btn">
										<i class="bx bx-plus me-2"></i> <span class="align-middle">특별 휴가 부여</span>
									</button>
								</div>
								<div class="col-12 col-lg-2">
									<button type="button" data-bs-toggle="modal"
										data-bs-target="#modalList" aria-controls="modalCenter"
										class="kanban-add-board-btn btn btn-label-secondary w-100"
										id="kanban-add-board-btn">
										<i class='bx bx-show me-2' ></i> <span class="align-middle">부여한 휴가 조회</span>
									</button>
								</div>
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
							<th>사원명</th>
							<th>부서(조직)</th>
							<th>휴가종류</th>
							<th>시작일자</th>
							<th>사용연차일수</th>
							<th>상태</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th></th>
							<th>NO</th>
							<th>사원명</th>
							<th>부서(조직)</th>
							<th>휴가종류</th>
							<th>시작일자</th>
							<th>사용연차일수</th>
							<th>상태</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<!--/ Advanced Search -->
	</div>
</div>
</div>
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<form id="insertForm" method="post"
				action="${cPath }/gw/vacation/spcAppInsert.do">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">특별휴가부여</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col mb-4">
							<label for="title" class="form-label">특별휴가 종류</label> <select
								class="form-select text-capitalize" name="vaciNo">
								<option value>특별휴가선택</option>
								<c:forEach items="${speList}" var="speList">

									<option class="dropdown-item" label="${speList.vaciNm}"
										value="${speList.vaciNo }" />

								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
					  <div class="col mb-4">
					    <label for="content" class="form-label">대상자</label>
					    <select class="select2 form-select" data-allow-clear="true" name="empNo" id="empNoSelect">
					      <option value="">대상자선택</option>
					      <c:forEach items="${empList}" var="empList">
					        <option class="dropdown-item" value="${empList.empNo}">
					          ${empList.empNm} / ${empList.empDepName}, ${empList.empPosName}
					        </option>
					      </c:forEach>
					    </select>
					  </div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="button" class="btn btn-label-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modalList" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">부여한 특별휴가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>사원명</th>
							<th>특별휴가명</th>

						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<c:forEach items="${comSpeList }" var="comSpeList"
							varStatus="status">


							<tr>
								<td></td>
								<td>${comSpeList.employee.empNm }</td>
								<td>${comSpeList.vacationInfo.vaciNm } / ${comSpeList.vacationInfo.vaciDay }일</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
					</div>
				</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true"></div>

<script defer src="${cPath}/resources/js/app/jhjUa/vacationList.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/sweetAlert.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/admin-vacation.js"></script>