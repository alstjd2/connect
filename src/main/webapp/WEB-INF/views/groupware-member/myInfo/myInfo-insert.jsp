<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row invoice-preview">
		<!-- 입력내용 -->
		<div class="col-xl-4 col-12 invoice-actions">
			<div class="card mb-6">
				<form class="card-body" method="post" action="${cPath }/gw/vacation/applicationInsert.do">
					<div class="row mb-3">
						<label class="col-form-label" for="">작성자</label> <input
							type="hidden" name="empNo" value="${empDetail.empNo }">
						<div class="input-group input-group-merge disabled">
							<input type="text" class="form-control"
								placeholder="${empDetail.empNm }" value="${empDetail.empNm }"
								readonly disabled />
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-form-label" for="">작성자 소속/직책</label> <input
							type="hidden" name="appDep" value="${empDetail.empDepName }">
						<div class="input-group input-group-merge disabled">
							<input type="text" class="form-control"
								placeholder="${empDetail.empDepName }/${empDetail.empOneposName }"
								value="${empDetail.empDepName }/ ${empDetail.empOneposName }"
								readonly disabled />
						</div>
					</div>
					<hr class="my-6 mx-n6" />
					<h6>내용</h6>
					<input type="hidden" name="vaciNo" id="vaciNo">
					<input type="hidden" name="vaciType" id="vaciType">
					<input type="hidden" name="appNo" id="appNo">
					<div class="row mb-6">
						<label class="col-form-label" for="">휴가종류</label>
						<div>
							<select name="" id="vacationSelect"
								class="select2 form-select" data-allow-clear="true"
								onchange="updateVacationFields()" required="required">
								<option value="">휴가선택</option>

								<option
									value="${empVac.applicationList[0].vacationInfo.vaciNo }|${empVac.applicationList[0].vacationInfo.vaciType}"
									>
									${empVac.applicationList[0].vacationInfo.vaciNm }</option>
								<c:forEach items="${empSpeList }" var="empSpeList">
									<option
										value="${empSpeList.vacationInfo.vaciNo }|${empSpeList.vacationInfo.vaciType}"
										data-appno="${empSpeList.appNo}">
										특별휴가 (${empSpeList.vacationInfo.vaciNm } /
										${empSpeList.vacationInfo.vaciDay }일)</option>
								</c:forEach>

								<c:forEach items="${empRepList }" var="empRepList">
									<option value="${empRepList.vaciNo }|${empRepList.vaciType }">
										경조 (${empRepList.vaciNm } / ${empRepList.vaciDay }일)</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row mb-3">
						<label class="" for="">사유</label>
						<div>
<textarea id="todoContent" name="appDetail" cols="10" rows="5" class="form-control" placeholder="사유를 입력하세요" required="required"></textarea>
</div>
					</div>
					<div class="row mb-3">
						<label class="" for="">휴가시작일자</label>
						<div class="">
							<input name="appStrdate" type="text" id="startDate"
								class="form-control dob-picker" placeholder="YYYY-MM-DD" required="required" />
						</div>
					</div>
					<div class="row mb-3">
						<label class="" for="">휴가종료일자</label>
						<div class="">
							<input type="text" name="appEnddate" id="endDate"
								class="form-control dob-picker" placeholder="YYYY-MM-DD" required="required"/>
						</div>
					</div>
					<div class="row mb-3">

						<label class="" for="">대무자</label>
						<label class="" for="">( 대무자가 없는 경우 대무자	선택을 하지 않으셔도 됩니다)</label>
						<div>
							<select id="대무자" name="appTememp" class="select2 form-select"
								data-allow-clear="true">
								<option value="">대무자 선택</option>

								<c:forEach items="${ empDepList}" var="empDep">
									<c:forEach items="${ empDep.company.organizationList}"
										var="orgList">
										<c:forEach items="${empDep.company.positionList }"
											var="position">
											<c:choose>
												<c:when
													test="${empDep.empNm != empDetail.empNm }">
													<option value="${empDep.empNo }">${empDep.empNm}
														(${orgList.orgDep} / ${position.posNm })</option>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:forEach>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-form-label" for="">결재자</label>
						<div>
							<select id="결재자" class="select2 form-select"
								data-allow-clear="true" name="appRovemp" required="required">
								<option value="">결재자 선택</option>
								<c:forEach items="${ dfVacList}" var="empDep">
									<c:forEach items="${ empDep.company.organizationList}"
										var="orgList">
										<c:forEach items="${empDep.company.positionList }"
											var="position">
											<c:choose>
												<c:when test="${empDep.empNm != empDetail.empNm }">
													<option value="${empDep.empNo }">${empDep.empNm}
														(${orgList.orgDep} / ${position.posNm })</option>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:forEach>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="pt-6 text-center">
						<button type="submit" class="btn btn-primary me-3">기안하기</button>
						<a href="javascript:;" onclick="history.back();" class="btn btn-secondary me-3"">뒤로가기</a>
						<button type="button" id="dataInsertBtn"  class="btn btn-label-primary">자동입력</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /입력내용 -->

		<!-- 내용노출 | js로 키업시 위치의 아이디값에 데이터를 넣어주기 -->
		<div class="col-xl-8 col-12 mb-md-0 mb-6">
			<div class="card invoice-preview-card p-sm-12 p-6">
				<h3 class="text-center fw-bold pt-10 pb-5">휴가 신청서</h3>
				<div class="card-body px-0 py-1">
					<div class="row">
						<div class="col-xl-6 col-md-12 col-sm-7 col-12 ">
							<table class="w-100 table">
								<tbody class="border-top">
									<tr class="border-bottom py-3 ">
										<td class="px-4 fw-bold text-center table-light" rowspan="2"
											style="width: 120px;">기간</td>
										<td id="tableStartDate">
											<!-- 여기에 휴가 시작일시 -->
										</td>
									</tr>
									<tr class="border-bottom py-3">
										<td id="tableEndDate">
											<!-- 여기에 휴가 종료일시 -->
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-xl-6 col-md-12 col-sm-7 col-12 ">
							<table class="w-100 table">
								<tbody class="border-top">
									<tr class="border-bottom py-3">
										<td class="px-4 fw-bold text-center table-light w-120p">사원명</td>
										<td>
											<!-- 여기에 작성자 이름 --> ${empDetail.empNm }
										</td>
									</tr>
									<tr class="border-bottom py-3">
										<td class="px-4 fw-bold text-center table-light w-120p">소속/직책</td>
										<td>
											<!-- 여기에 작성자 소속 --> ${empDetail.empDepName }/
											${empDetail.empOneposName }
										</td>
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
									<!-- 여기에 휴가 종류 -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-body px-0 py-1">
					<table class="w-100 table content">
						<tbody class="border-top">
							<tr class="border-bottom py-3">
								<td class="px-4 fw-bold text-center table-light w-120p">사유</td>
								<td id="approverName"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-body px-0 py-1">
					<table class="w-100 table">
						<tbody class="border-top">
							<tr class="border-bottom py-3">
								<td class="px-4 fw-bold text-center table-light w-120p">업무대행자</td>
								<td id="proxyName">
									<!-- 여기에 대무자 이름 -->
								</td>
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
									<p class="fw-medium mb-2" id="applicationDate"></p>
									<p class="fw-medium mb-2">

										<!-- 여기에 작성자 이름 -->
										${empDetail.empNm } <span class="stamp"> (인) <!-- <img src="assets/img/stamp/sample-1.png" alt="이한별 도장"> -->
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
								<p class="mb-0">
									<span class="pe-2"> 최종결재자 </span>
									<!-- 여기에 결재자 -->
									<span class="stamp"><b id="approverName"></b> (인) <!-- <img src="assets/img/stamp/sample-2.png" alt="이승진 도장"> -->
									</span>
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
		</div>
		<!-- /내용노출 -->
	</div>
</div>
<script>
function updateVacationFields() {
	var select = document.getElementById('vacationSelect');
    var selectedOption = select.options[select.selectedIndex];
    var selectedValue = selectedOption.value.split('|');

    document.getElementById('vaciNo').value = selectedValue[0];
    document.getElementById('vaciType').value = selectedValue[1];
    document.getElementById('appNo').value = selectedOption.getAttribute('data-appno');
    console.log(selectedValue[0]);
    console.log(selectedValue[1]);
	console.log(selectedOption.getAttribute('data-appno'));
}

	dataInsertBtn.addEventListener('click', ()=>{
		todoContent.value = '개인사유로 휴가 신청합니다.';
		startDate.value = '2024-09-23';
		endDate.value = '2024-09-26';
	});
</script>

<script defer src="${cPath}/resources/js/app/jhjUa/form-layouts.js"></script>