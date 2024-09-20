<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="absenceCount" value="0" />
<c:set var="lateCount" value="0" />
<c:set var="earlyLeaveCount" value="0" />

<c:forEach items="${attList}" var="attendance">
	<c:forEach items="${attendance.attendenceList}" var="attendenceList">
		<!-- 출근 상태 확인 -->
		<c:choose>
			<c:when test="${empty attendenceList.attStart}">
				<c:set var="absenceCount" value="${absenceCount + 1}" />
			</c:when>
			<c:when test="${attendenceList.attStartSte eq 'BB05120'}">
				<c:set var="lateCount" value="${lateCount + 1}" />
			</c:when>
		</c:choose>

		<!-- 퇴근 상태 확인 -->
		<c:choose>
			<c:when test="${attendenceList.attEndSte eq 'BB05130'}">
				<c:set var="earlyLeaveCount" value="${earlyLeaveCount + 1}" />
			</c:when>
		</c:choose>
	</c:forEach>
</c:forEach>

<c:forEach items="${attWorkStatus}" var="attWorkStatus">
	<c:choose>
		<c:when test="${attWorkStatus.workStatus eq '부재'}">
			<c:set var="vacation" value="${vacation}" />
		</c:when>
		<c:when test="${attendenceList.attStartSte eq 'BB05120'}">
			<c:set var="lateCount" value="${lateCount + 1}" />
		</c:when>
	</c:choose>

</c:forEach>




<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card mb-6"
			style="background: transparent; box-shadow: none;">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)"> 근태 시간 현황</a>
				</div>
			</nav>
			<div class="row g-6 mt-1 mb-4 mx-0">
				<div class="col-md-3">
					<div class="card">
						<div
							class="card-body d-flex align-items-center gap-4 me-6 me-sm-0">
							<div class="avatar avatar-lg">
								<div class="avatar-initial bg-label-primary rounded">

                            <i class="bx bx-time-five bx-lg"></i>

								</div>
							</div>

							<div class="content-right">
								<p class="mb-0 fw-medium">오늘의 부재자</p>
								<h4 class="text-primary mb-0">${absenceCount}명</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card">
						<div
							class="card-body d-flex align-items-center gap-4 me-6 me-sm-0">
							<div class="avatar avatar-lg">
								<div class="avatar-initial bg-label-danger rounded">

                            <i class="bx bx-pie-chart-alt bx-lg"></i>

								</div>
							</div>
							<div class="content-right">
								<p class="mb-0 fw-medium">오늘의 지각</p>
								<h4 class="text-danger mb-0">${lateCount}명</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card">
						<div
							class="card-body d-flex align-items-center gap-4 me-6 me-sm-0">
							<div class="avatar avatar-lg">
								<div class="avatar-initial bg-label-warning rounded">

                          <span class="avatar-initial rounded bg-label-warning"><i class="bx bx-error bx-lg"></i></span>

								</div>
							</div>
							<div class="content-right">
								<p class="mb-0 fw-medium">오늘의 조퇴</p>
								<h4 class="text-warning mb-0">${earlyLeaveCount}명</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card">
						<div
							class="card-body d-flex align-items-center gap-4 me-6 me-sm-0">
							<div class="avatar avatar-lg">
								<div class="avatar-initial bg-label-primary rounded">

                          <span class="avatar-initial rounded bg-label-primary"><i class="bx bxs-group"></i></span>

								</div>
							</div>
							<c:set var="totalEmpCount" value="${fn:length(empList) }"/>
							<div class="content-right">
								<p class="mb-0 fw-medium">총 인원</p>
								<h4 class="text-primary mb-0">${totalEmpCount}명</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="card mb-12">
			<div
				class="card-header d-flex align-items-center justify-content-between">
				<div class="card-title mb-0">
					<h5 class="m-0 me-2 fw-bold">월별 출퇴근 현황</h5>
				</div>
				<div class="dropdown">
					<button class="btn p-0" type="button" id="vehiclesOverview"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
					</button>
					<div class="dropdown-menu dropdown-menu-end"
						aria-labelledby="vehiclesOverview">
						<a class="dropdown-item" href="javascript:void(0);">Select All</a>
						<a class="dropdown-item" href="javascript:void(0);">Refresh</a> <a
							class="dropdown-item" href="javascript:void(0);">Share</a>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="d-none d-lg-flex vehicles-progress-labels mb-6">
					<c:forEach items="${attWorkStatus}" var="status">
						<div class="vehicles-progress-label"
							style="width: ${status.percentage}%">${status.workStatus}</div>
					</c:forEach>
				</div>
				<div
					class="vehicles-overview-progress progress rounded-3 mb-6 bg-transparent overflow-hidden"
					style="height: 46px">
					<c:forEach items="${attWorkStatus}" var="status">
						<div
							class="progress-bar fw-medium text-start shadow-none
                <c:choose>
                    <c:when test="${status.workStatus eq '정상 근무'}">bg-primary</c:when>
                    <c:when test="${status.workStatus eq '정상출근'}">bg-primary</c:when>
                    <c:when test="${status.workStatus eq '지각'}">bg-warning</c:when>
                    <c:when test="${status.workStatus eq '조퇴'}">bg-danger-subtle</c:when>
                    <c:when test="${status.workStatus eq '부재'}">bg-dark</c:when>
                    <c:when test="${status.workStatus eq '지각 및 조퇴'}">bg-dark</c:when>
                    <c:otherwise>bg-secondary</c:otherwise>
                </c:choose>
                px-4 rounded-0"
							role="progressbar" style="width: ${status.percentage}%;"
							aria-valuenow="${status.percentage}" aria-valuemin="0"
							aria-valuemax="100">${status.percentage}%</div>
					</c:forEach>
				</div>

				<div class="table-responsive">
					<table class="table card-table table-border-top-0">
						<tbody class="table-border-bottom-0">
							<c:forEach items="${attWorkStatus}" varStatus="status"
								var="attWorkStatus">
								<tr>
									<td class="w-50 ps-0">
										<div class="d-flex justify-content-start align-items-center">
											<div class="me-2">
												<i class='bx bx-time bx-lg text-heading'></i>
											</div>
											<h6 class="mb-0 fw-normal">${attWorkStatus.workStatus }</h6>
										</div>
									</td>
									<td class="text-end pe-0"><span>${attWorkStatus.percentage }%</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<div class="card">
			<h5 class="card-header fw-bold">금일 출퇴근 현황</h5>
			<!-- 검색 폼 추가 -->
			<div class="card-body">
				<form id="searchForm" name="searchList" method="get"
					action="${cPath}/gw/attendance/attendanceList.do">
					<div class="row g-3 align-items-end">
						<div class="col-md-4">
							<label for="empNm" class="form-label">사원명</label> <input
								type="text" id="empNm" name="empNm" class="form-control"
								placeholder="사원명 입력" value="${param.empNm}">
						</div>
						<div class="col-md-4">
							<label for="searchDate" class="form-label">날짜</label> <input
								type="date" id="searchDate" name="searchDate"
								class="form-control" value="${param.searchDate}">
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-primary mt-4">검색</button>
						</div>
					</div>
				</form>
			</div>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>사원명</th>
							<th>부서(조직)명</th>
							<th>직급/직책</th>
							<th>출근 시간</th>
							<th>퇴근 시간</th>
							<th>출근 상태</th>
							<th>퇴근 상태</th>
							<th>체크 환경</th>

						</tr>
					</thead>
					<tbody id="list" class="table-border-bottom-0">
						<c:forEach items="${attList}" var="attendance" varStatus="status">
							<tr class="attendance-row ${status.index >= 8 ? 'd-none' : ''}">
								<td>${attendance.rnum}</td>
								<c:url value="/gw/attandance/attendanceDetail.do"  var="attDetailUrl">
                       					<c:param name="what" value="${attendance.empNo }" />
                     			</c:url>
								<td><a href="${attDetailUrl }"> ${attendance.empNm} </a></td>

								<td>${attendance.empDepName}</td>
								<td>${attendance.empPosName}/${attendance.empOneposName}</td>
								<c:forEach items="${attendance.attendenceList}"
									var="attendenceList">
									<td><c:choose>
											<c:when test="${not empty attendenceList.attStart}">
                           <i class="bx bx-up-arrow-circle bx-lg text-heading"></i> ${attendenceList.attStart.substring(11)}
                        </c:when>
											<c:otherwise>
												<span class="badge bg-label-danger me-1">미체크</span>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${not empty attendenceList.attEnd}">
                            <i class="bx bx-down-arrow-circle bx-lg text-heading"></i> ${attendenceList.attEnd.substring(11)}
                        </c:when>
											<c:otherwise>
												<span class="badge bg-label-danger me-1">미체크</span>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${attendenceList.attStartSte eq 'BB05110'}">
												<span class="badge bg-label-success me-1">정상</span>
											</c:when>
											<c:when test="${attendenceList.attStartSte eq 'BB05120'}">
												<span class="badge bg-label-danger me-1">지각</span>
											</c:when>
											<c:otherwise>
												<span class="badge bg-label-warning me-1">해당없음</span>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${attendenceList.attEndSte eq 'BB05130'}">
												<span class="badge bg-label-danger me-1">조퇴</span>
											</c:when>
											<c:when test="${attendenceList.attEndSte eq 'BB05140'}">
												<span class="badge bg-label-success me-1">정상</span>
											</c:when>
											<c:otherwise>
												<span class="badge bg-label-warning me-1">해당없음</span>
											</c:otherwise>
										</c:choose></td>
									<td>${attendenceList.attIp}</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>



				</table>
				<!-- 더보기/닫기 버튼 추가 -->
				<div class="text-center py-2">
					<button id="toggleRows" class="btn btn-text-primary">
						+ 더보기
					</button>
				</div>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation text-center">
		<ul class="pagination pagination-rounded justify-content-center pt-7">
			<div class="paging-area">${pagingHTML}</div>
		</ul>
	</nav>
</div>
</div>
<form id="searchform" name="detailCondition" method="get">
	<input type="hidden" name="year" value="${detailCondition['year'] }">
	<input type="hidden" name="month" value="${detailCondition['month'] }">
	<input type="hidden" name="page" />
</form>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/myInfo-commute.js"></script>

<script defer src="${cPath}/resources/js/app/jhjUa/workHourList.js"></script>

