<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row invoice-preview">
		<!-- Invoice -->
		 <main class="col-xl-9 col-md-8 col-12 mb-md-0 mb-6">
			<div class="card invoice-preview-card p-sm-12 p-6">
				<h3 class="text-center fw-bold pt-10 pb-5">휴가 신청서</h3>
				<div class="card-body px-0 py-1">
					<div class="row ">
						<div class="col-xl-6 col-md-12 col-sm-7 col-12 ">
							<table class="w-100 table">
								<tbody class="border-top">
									<tr class="border-bottom py-3 ">
										<td class="px-4 fw-bold text-center table-light" rowspan="2"
											style="width: 120px;">기간</td>
										<td>${empVacDetail.applicationList[0].appStrdate }</td>
									</tr>
									<tr class="border-bottom py-3">
										<td>${empVacDetail.applicationList[0].appEnddate }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-xl-6 col-md-12 col-sm-7 col-12 ">
							<table class="w-100 table">
								<tbody class="border-top">
									<tr class="border-bottom py-3">
										<td class="px-4 fw-bold text-center table-light w-120p">사원명</td>
										<td>${empVacDetail.empNm}</td>
									</tr>
									<tr class="border-bottom py-3">
										<td class="px-4 fw-bold text-center table-light w-120p">소속/직책</td>
										<td>${empDetail.empDepName }/ ${empDetail.empPosName }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card-body px-0 py-1">
					<table class="w-100 table">
						<tbody class="border-top">
							<tr class="border-bottom py-3">
								<td class="px-4 fw-bold text-center table-light w-120p">휴가
									종류</td>
								<td id="vacationType">
									${empVacDetail.applicationList[0].vaciTypeNm } <!-- 여기에 휴가 종류 -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-body px-0 py-1">
					<table class="w-100 table content">
						<tbody class="border-top">
							<tr class="border-bottom py-3">
								<td class="px-4 fw-bold text-center table-light w-120p">사유
								</td>
								<td>${empVacDetail.applicationList[0].appDetail }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-body px-0 py-1">
					<table class="w-100 table">
						<tbody class="border-top">
							<tr class="border-bottom py-3">
								<td class="px-4 fw-bold text-center table-light w-120p">업무대행자</td>
								<td>${empVacDetail.applicationList[0].temEmpNm }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table m-0 table-borderless">
						<tbody>
							<tr>
								<td class="align-top pe-6 ps-0 py-6 text-body">
									<p class=" p-0 m-0">위와 같이 휴가를 신청합니다.</p>
								</td>
								<td class="px-0 py-6 w-px-100">
									<p class="mb-2">신청일자 :</p>
									<p class="mb-2">신청자 :</p>
								</td>
								<td class="text-end ps-0 py-6 w-px-120 fw-medium text-heading">
									<p class="fw-medium mb-2">${empVacDetail.applicationList[0].appDate }</p>
									<p class="fw-medium mb-2">
										${empVacDetail.empNm} <span class="stamp"> (인)
										 <img src="${cPath}/resources/images/stamp/stamp_1.png" alt="신청도장">
										</span>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="card-body invoice-preview-header rounded">
					<div
						class="d-flex justify-content-between flex-xl-row flex-md-column flex-sm-row flex-column align-items-xl-start align-items-md-start align-items-sm-center align-items-start">
						<div>
							<div
								class="d-flex svg-illustration mb-6 gap-2 align-items-center">
								<span class="app-brand-logo demo"> </span> <span
									class="app-brand-text demo fw-bold ms-50 lh-1">${comDetail.comNm }
								</span>
							</div>
							<p class="mb-0">
								<span class="pe-2">대표이사 </span> <b> ${comDetail.comBsnm } </b>
							</p>
							<p class="mb-0">
								<span class="pe-2">사업자등록번호 </span> <b> ${comDetail.comBsno }
								</b>
							</p>
							<p class="mb-0">
								<span class="pe-2">주소</span> <b> ${comDetail.comAdr } </b>
							</p>
							<p class="mb-0">
								<span class="pe-2">전화번호</span> <b> ${comDetail.comTel } </b>
							</p>
						</div>
						<div>
							<div></div>
							<div>
								<p class="mb-4 mt-11">


									<span class="pe-2"> 최종결재자 </span><b id="approverName">${empVacDetail.applicationList[0].roveNm }</b>
									<!-- 여기에 결재자 -->
									<span class="stamp">
										(인) <!-- <img src="assets/img/stamp/sample-2.png" alt="이승진 도장"> -->
										<c:choose>
											<c:when test="${empVacDetail.applicationList[0].appState eq 'BB01120' }">
												<img src="${cPath}/resources/images/stamp/stamp_2.png" alt="승인도장">
											</c:when>
											<c:when test="${empVacDetail.applicationList[0].appState eq 'BB01130' }">
												<img src="${cPath}/resources/images/stamp/stamp_3.png" alt="반려도장">
											</c:when>
										</c:choose>
									</span>
								</p>
								<p class="mb-0 mt-5">
									<c:if
										test="${not empty empVacDetail.applicationList[0].appFinaldate }">
										<span class="pe-2"> 최종결재일 </span>
										<!-- 여기에 결재자 -->

										<span class="stamp"><b id="approverName">${empVacDetail.applicationList[0].appFinaldate }</b>
										</span>
									</c:if>

								</p>

							</div>
							<div>
								<p class="mb-3 mt-3">
									<c:if
										test="${empty empVacDetail.applicationList[0].appFinaldate }">
											<span class="pe-2"> </span>

										<span class="stamp"><b id="approverName">결재가 진행중입니다</b>
										</span>
										</c:if>

								</p>

							</div>
						</div>
					</div>
				</div>
				<hr class="mt-0 mb-6" />
				<div class="card-body p-0">
					<div class="row">
						<div class="col-12">
							<span class="fw-medium text-heading">경고:</span> <span>
								해당문서는 <b>${comDetail.comNm } </b>에서 내부적으로 작성된 문서로 외부에 노출되지 않도록
								주의 부탁드립니다.
							</span>
						</div>
					</div>
				</div>
			</div>
		 </main>
		<!-- /Invoice -->

		<!-- Invoice Actions -->
		<div class="col-xl-3 col-md-4 col-12 invoice-actions">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center mb-4">
						<div class="d-flex align-items-center">
							<ul
								class="list-unstyled d-flex align-items-center avatar-group mb-0">
								<li class="d-flex gap-2 align-items-center"><img
									class="w-px-30 h-auto rounded-circle"
									src="${cPath }/resources/groupwareMember/assets/img/avatars/1.png"
									alt="Avatar"> <b class="m-0">${empVacDetail.applicationList[0].roveNm }</b>
								</li>
							</ul>
						</div>
						<div class="ms-auto">
							<c:choose>
								<c:when test="${empVacDetail.applicationList[0].appState eq 'BB01120' }">
									<span class="badge bg-label-success" text-capitalized="">
											승인완료
									</span>
								</c:when>
								<c:when test="${empVacDetail.applicationList[0].appState eq 'BB01110' }">
									<span class="badge bg-label-secondary" text-capitalized="">
											진행중
									</span>
								</c:when>
								<c:otherwise>
									<span class="badge bg-label-danger">반려</span>

								</c:otherwise>

							</c:choose>

						</div>
					</div>
					<button class="btn btn-primary w-100" id="print" target="_blank" >
	                   <i class='bx bx-printer bx-sm me-2'></i>
	                   Print
	               </button>
				</div>
			</div>
					<div class="mb-10 mt-5">
					<button onclick="history.back();" type="button" class="btn rounded-pill btn-label-primary">
			         	<span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>뒤로가기
			       </button>
				</div>
		</div>
		<!-- /Invoice Actions -->
	</div>
</div>
<script defer
	src="${cPath}/resources/js/app/jhjUa/application-detail.js"></script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/offcanvas-add-payment.js"></script>