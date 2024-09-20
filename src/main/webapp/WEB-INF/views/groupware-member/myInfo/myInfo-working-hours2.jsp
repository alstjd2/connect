<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">

		<!-- Hidden select input -->
		<div class="card mb-12">
			<div id="searchUI" class="">
				<!-- Hidden select input -->
				<div class="row g-3 overflow-hidden card mt-0 mx-0">
					<nav class="navbar navbar-expand-lg bg-primary mt-0">
						<div class="container-fluid ">
							<a class="navbar-brand" href="javascript:void(0)">
		                       	<i class="menu-icon bx bx-timer"></i>
								내 근태현황
							</a>
					       <form id="searchForm" name="searchList" method="get" action="${cPath}/gw/myInfo/empattendanceList.do" class="text-white">
					       		<div class="d-flex align-items-center">
						       		<label for="searchDate" class="w-60p me-2">월 선택</label>
						       		<input type="month" id="searchDate" name="searchDate" class="form-control bg-white border-0" value="${param.searchDate != null ? param.searchDate : currentDate}" onchange="submitForm()">
					       		</div>
						   </form>
						</div>
					</nav>
					<div class="card-header d-flex align-items-center justify-content-between mt-0">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2 fw-bold">월단위 출퇴근 현황</h5>
						</div>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="vehiclesOverview"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
							</button>
						</div>
					</div>

					<div class="card-body">
						<div class="d-none d-lg-flex vehicles-progress-labels mb-6">
							<c:forEach items="${attWorkStatus}" var="status">
								<c:if test="${status.workStatus ne '기타'}">
									<div class="vehicles-progress-label"
										style="width: ${status.percentage}%">${status.workStatus}</div>
								</c:if>
							</c:forEach>
						</div>
						<div
							class="vehicles-overview-progress progress rounded-3 mb-6 bg-transparent overflow-hidden"
							style="height: 46px">
							<c:forEach items="${attWorkStatus}" var="status">
								<c:if test="${status.workStatus ne '기타'}">
									<div
										class="progress-bar fw-medium text-start shadow-none
                    <c:choose>
                        <c:when test="${status.workStatus eq '정상 근무'}">bg-info</c:when>
                        <c:when test="${status.workStatus eq '지각'}">bg-warning</c:when>
                        <c:when test="${status.workStatus eq '조퇴'}">bg-danger-subtle</c:when>
                        <c:otherwise>bg-dark</c:otherwise>
                    </c:choose>
                    px-4 rounded-0"
										role="progressbar" style="width: ${status.percentage}%;"
										aria-valuenow="${status.percentage}" aria-valuemin="0"
										aria-valuemax="100">${status.percentage}%</div>
								</c:if>
							</c:forEach>
						</div>



						<div class="table-responsive">
							<table class="table card-table table-border-top-0">
								<tbody class="table-border-bottom-0">
									<c:forEach items="${attWorkStatus}" varStatus="status"
										var="attWorkStatus">
										<c:if test="${attWorkStatus.workStatus ne '기타'}">
											<tr >
												<td class="w-50 ps-0">
													<div
														class="d-flex justify-content-start align-items-center">
														<div class="me-2">
															<i class='bx bx-time bx-lg text-heading'></i>
														</div>
														<h6 class="mb-0 fw-normal">${attWorkStatus.workStatus}</h6>
													</div>
												</td>
												<td class="text-end pe-0 text-nowrap">
													<h6 class="mb-0">${attWorkStatus.totalWorkTime}</h6>
												</td>
												<td class="text-end pe-0"><span>${attWorkStatus.percentage}%</span>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>

				<div class="card">

					<h5 class="card-header fw-bold">월단위 날짜별 출퇴근</h5>
					<div class="table-responsive text-nowrap">
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>날짜</th>
									<th>출근 시간</th>
									<th>퇴근 시간</th>
									<th>근무 시간</th>
									<th>출근 상태</th>
									<th>퇴근 상태</th>
								</tr>
							</thead>
							<tbody class="table-border-bottom-0">
								<c:forEach items="${attList}" var="attendance">
									<tr class="attendance-row ${status.index >= 8 ? 'd-none' : ''}">
										<td>${attendance.rnum}</td>
										<td><i class='bx bx-calendar'></i> ${attendance.attDate}</td>
										<td><i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
											${attendance.attStart.substring(11)}</td>
										<td><i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
											${attendance.attEnd.substring(11)}</td>
										<td><i class='bx bx-time bx-lg text-heading'></i>
											${attendance.workTime}</td>
										<td><c:choose>
												<c:when test="${attendance.attStartSte eq 'BB05110' }">
													<span class="badge bg-label-success me-1">정상</span>
												</c:when>
												<c:when test="${attendance.attStartSte eq 'BB05120' }">
													<span class="badge bg-label-danger me-1">지각</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-label-warning me-1">해당없음</span>
												</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${attendance.attEndSte eq 'BB05130' }">
													<span class="badge bg-label-warning me-1">조퇴</span>
												</c:when>
												<c:when test="${attendance.attEndSte eq 'BB05140' }">
													<span class="badge bg-label-success me-1">정상</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-label-warning me-1">해당없음</span>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="text-center py-2">
							<button id="toggleRows" class="btn btn-text-primary">
								+ 더보기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<form id="searchform" name="detailCondition" method="get">
	<input type="hidden" name="year" value="${detailCondition['year'] }">
	<input type="hidden" name="month" value="${detailCondition['month'] }">
	<input type="hidden" name="page" />
</form>

<div class="app-overlay"></div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const searchDateInput = document.getElementById('searchDate');

    // 입력값이 비어 있거나 '-' 같은 비정상적인 값인 경우 기본값 설정
    if (!searchDateInput.value || searchDateInput.value === "-" || !/^\d{4}-\d{2}$/.test(searchDateInput.value)) {
        const today = new Date();
        const year = today.getFullYear();

        // 0부터 시작하는 getMonth()에 1을 더한 후 padStart로 두 자리 맞춤
        const month = (today.getMonth() + 1).toString().padStart(2, '0');
        const defaultDate = `${year}-${month}`;

        // 기본 날짜 값을 input에 설정
        searchDateInput.value = defaultDate;

        // 설정된 값을 로그로 확인
        console.log("Setting default date: " + defaultDate);
    } else {
        console.log("Existing date value: " + searchDateInput.value);
    }
});

function submitForm() {
    document.getElementById('searchForm').submit();
}
</script>


<script defer
	src="${cPath}/resources/js/app/utils/paging.js"></script>
	<script defer src="${cPath}/resources/js/app/jhjUa/workHourList.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/myInfo-commute.js"></script>