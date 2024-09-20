<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${dfVacList }" var="df">
<c:choose>
<c:when test="${df.empNo eq empDetail.empNo}">

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card mb-6 overflow-hidden">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">
						<i class="menu-icon bx bx-timer"></i>
						부서(조직) 근태현황
					</a>
				</div>
			</nav>
			<div class="card-header d-flex flex-wrap justify-content-between gap-4">
				<div class="card-title mb-0 me-1">
					<h5 class="mb-0">월단위 개별 근태 현황</h5>
					<p class="mb-0">관리하는 인원의 개별 근태 현황을 볼 수 있습니다.</p>
				</div>
			</div>
			<div class="card-body">
				<div class="row gy-6 mb-6">
					<c:forEach items="${attDepWorkStatusList}"
						var="attDepWorkStatusList">
						<div class="col-sm-6 col-lg-3">
							<div class="card p-2 h-100 shadow-none border">
								<div class="card-body p-4 pt-2">
									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<h5 class="h5 mb-0">${attDepWorkStatusList.empNm}</h5>
										<span class="badge bg-label-primary">${attDepWorkStatusList.empPosName}</span>
									</div>
									<c:forEach items="${attDepWorkStatusList.attendenceList}"
										var="attendenceList">
								<c:if test="${attendenceList.workStatus != '기타' }">
										<p class="d-flex align-items-center mb-1">
											<i class="bx bx-time-five me-1"></i>
											${attendenceList.workStatus}  <b
												class="ps-1"></b>
										</p>

										<div class="d-flex align-items-center">
											<div class="progress w-100" style="height: 8px;">
												<div class="progress-bar" role="progressbar"
													style="width: ${attendenceList.percentage}%;" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<div class="text-body ms-3">${attendenceList.percentage}%</div>
										</div>
									</c:if>
									</c:forEach>
									<div
										class="d-flex flex-column flex-md-row gap-4 text-nowrap flex-wrap flex-md-nowrap flex-lg-wrap flex-xxl-nowrap">
										<c:forEach items="${empDepList }" var="empDep">
<%-- 											${empDep.empNo } --%>
										</c:forEach>
										<c:url value="/gw/department/attendanceDetail.do"
                       						 var="attDetailUrl">
                       						 <c:param name="what" value="${attDepWorkStatusList.empNo }" />
                     					</c:url>
										<a
											class="w-100 btn btn-label-primary d-flex align-items-center mt-4"
											href="${attDetailUrl }"> <span class="me-2">자세히보기</span><i
											class="bx bx-chevron-right bx-sm lh-1 scaleX-n1-rtl"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>

		<div class="card mb-12">
			<div
				class="card-header d-flex align-items-center justify-content-between">
				<div class="card-title mb-0">
					<h5 class="m-0 me-2 fw-bold">금일 부서 전체 출퇴근 현황</h5>
				</div>
			</div>
			<div class="card-body">
				<c:forEach items="${attWorkStatus}" var="attWorkStatus">

					<c:if test="${not empty attWorkStatus.percentage }">
						<div class="vehicles-overview-progress progress rounded-3 mb-6 bg-transparent overflow-hidden" style="height: 46px">

							<div
								class="progress-bar fw-medium text-start shadow-none bg-primary px-4 rounded-0"
								role="progressbar"
								style="width: ${(attWorkStatus.percentage + 15)}%"
								aria-valuenow="${attWorkStatus.percentage }" aria-valuemin="0"
								aria-valuemax="100">${attWorkStatus.workStatus }
								${attWorkStatus.percentage }%</div>
							<div
								class="progress-bar fw-medium text-start shadow-none bg-info-subtle text-paper px-1 px-sm-3 rounded-0 px-lg-4"
								role="progressbar"
								style="width: ${(100 - attWorkStatus.percentage)}%"
								aria-valuenow="100-${attWorkStatus.percentage }"
								aria-valuemin="0" aria-valuemax="100"></div>

						</div>
					</c:if>
				</c:forEach>
				<div class="table-responsive">
					<table class="table card-table table-border-top-0">
						<tbody class="table-border-bottom-0">
							<c:forEach items="${attWorkStatus}" varStatus="status" var="attWorkStatus">
								<c:if test="${not empty attWorkStatus.percentage }">
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
										<td class="text-end pe-0"><span><i
												class="bx bx-group"></i>${attWorkStatus.empCount }</span></td>
									</tr>
								</c:if>
								<c:choose>
									<c:when test="${attWorkStatus.workStatus eq '총합'}">
										<tr>
											<td class="w-50 ps-0">
												<div class="d-flex justify-content-start align-items-center">
													<div class="me-2">
														<i class='bx bx-time bx-lg text-heading'></i>
													</div>
													<h6 class="mb-0 fw-normal">${attWorkStatus.workStatus }</h6>
												</div>
											</td>
											<td class="text-end pe-0"><span></span></td>
											<td class="text-end pe-0"><span><i
													class="bx bx-group"></i>${attWorkStatus.empCount }</span></td>
										</tr>
										<tr>
											<td class="w-50 ps-0">
												<div class="d-flex justify-content-start align-items-center">
													<div class="me-2">
														<i class='bx bx-time bx-lg text-heading'></i>
													</div>
													<h6 class="mb-0 fw-normal">부재인원</h6>
												</div>
											</td>
											<td class="text-end pe-0"><span></span></td>
											<td class="text-end pe-0"><span><i
													class="bx bx-group"></i>${(attWorkStatus.totalDepCount - attWorkStatus.empCount)}</span></td>
										</tr>

									</c:when>



								</c:choose>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>
</c:when>
</c:choose>
</c:forEach>
<script defer src="${cPath}/resources/groupwareMember/assets/js/myInfo-commute.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/department-attendance.js"></script>
