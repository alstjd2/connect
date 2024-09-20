<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container-xxl flex-grow-1 container-p-y dcmPage">
	<div class="mb-10 mt-5">
		<button onclick="goBack()" type="button" class="btn rounded-pill btn-label-primary">
         	<span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>뒤로가기
       </button>
	</div>
   <div class="row invoice-preview">
       <!-- Invoice -->
       <main class="col-xl-9 col-md-8 col-12 mb-md-0 mb-6">
           <div class="card invoice-preview-card p-sm-12 p-6">
           
               <h3 class="text-center fw-bold pt-10 pb-5">
               		${dcmDetail.pmtDcmTitle}
               </h3>
               
               <div class="row justify-content-between mb-3 g-2">
                   <div class="col-lg-3">
                       <table class="table">
                           <tr class="table-light">
                               <th rowspan="2">수신자</th>
                               <th class="text-center">
                                   <b>${dcmDetail.pmtDcmRecEmponepos}</b> <span>${dcmDetail.pmtDcmRecEmpnm}</span>
                               </th>
                           </tr>
                           <tr>
                               <td class="text-center">
	                               	<c:choose>
										<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01110'}">
											대기
										</c:when>
										<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01120'}">
											예정
										</c:when>
										<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01140'}">
											완료
										</c:when>
									</c:choose>
                               </td>
                           </tr>
                       </table>
                   </div>
                   <div class="col-lg-9">
                       <table class="table">
                           <tr class="table-light">
                               <th rowspan="2">결재선</th>
                               <c:forEach items="${dcmAppList}" var="dcmApp">
	                               <th class="text-center">
	                                   <b>${dcmApp.pmtDcmAppEmpOnepos}</b> <span>${dcmApp.pmtDcmAppEmpNm}</span>
	                               </th>
                               </c:forEach>
                           </tr>
                           <tr>
                               <c:forEach items="${dcmAppList}" var="dcmApp">
	                               <td class="text-center">
	                               	<c:choose>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06110'}">
											대기
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06120'}">
											예정
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06130'}">
											승인
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06140'}">
											반려
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06150'}">
											전결
										</c:when>
									</c:choose>
	                               </td>
                               </c:forEach>
                           </tr>
                       </table>
                   </div>
               </div>
               <div class="card-body px-0 py-1">
                   <table class="w-100 table">
                       <tbody class="border-top">
                           <tr class="border-bottom py-3">
                               <th class="px-4 w-120p">문서번호</th>
                               <td >${dcmDetail.comdcmNum}</td>
                               <th class="px-4 w-120p">기 안 자</th>
                               <td >${dcmDetail.pmtDcmEmpnm}</td>
                           </tr>
                           <tr class="border-bottom py-3">
                               <th class="px-4 w-120p">기안서식</th>
                               <td >
	                               <c:choose>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ATTM-00001'}"> 연차신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ATTM-00002'}"> 연장근무신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EDUC-00001'}"> 교육참가신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EDUC-00002'}"> 사외 교육 결과 보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EDUC-00003'}"> 외부교육참석 보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00001'}"> 안전관리 상태보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00003'}"> 개선 검토 보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00004'}"> 불만 발생 보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00005'}"> 소비자 클레임 보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00006'}"> 회의록 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'REPT-00007'}"> 시행문 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00001'}"> 거래처 경조사 화환신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00002'}"> 경조금 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00003'}"> 경조금지급신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00004'}"> 경력증명서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00005'}"> 재직증명서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00006'}"> 직장 내 교육훈련(OJT) 계획 및 점검표 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00007'}"> 시말서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00008'}"> 지각사유서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00009'}"> 직원 채용 요청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00010'}"> 차량렌탈신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00011'}"> 동호회 승인신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00012'}"> 동호회 해체신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00013'}"> 사원증 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00014'}"> 증명서 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00015'}"> 퇴직금 중간 정산 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'HRMS-00016'}"> 서직서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'GENA-00001'}"> 협조문 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'GENA-00002'}"> 기안문 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'GENA-00003'}"> 품의서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EXPR-00001'}"> 시내교통비 청구서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EXPR-00002'}"> 유류대실비 청구서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EXPR-00003'}"> 통신비 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EXPR-00004'}"> 의료비 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'EXPR-00005'}"> 일반 지출결의서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'TRVL-00001'}"> 출장결과보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'TRVL-00002'}"> 출장신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00001'}"> 구매품의서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00002'}"> 도서구입신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00003'}"> 매출보고서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00004'}"> 비품/소모품 구입신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00005'}"> 진료비 지원 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00006'}"> 사무용품 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00007'}"> 학자금 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00008'}"> 법인카드 발급 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00009'}"> 법인카드 사용 신청서 </c:when>
									    <c:when test="${dcmDetail.dcmFormCode eq 'ACFM-00010'}"> 택배/퀵 신청서 </c:when>
									    <c:otherwise> ${dcmDetail.dcmFormCode} </c:otherwise>
									</c:choose>
                               </td>
                               <th class="px-4 w-120p">소속/직책</th>
                               <td >${dcmDetail.pmtDcmEmpdep}/${dcmDetail.pmtDcmEmponepos}</td>
                           </tr>
                       </tbody>
                   </table>
               </div>
               <div id="content" class="my-10">
               		${dcmDetail.pmtDcmContent}
               </div>
               <c:if test="${not empty dcmDetail.pmtDcmAttno}">
             	<p class="mb-1">
                  <span class="me-2 h6">첨부파일:</span>
                  <a href="#" download>첨부파일명</a>
                </p>
                </c:if>
               <c:if test="${not empty dcmDetail.pmtRetDcmNo}">
	             	<p class="mb-1">
	                  <span class="me-2 h6">관련문서:</span>
	                  <a href="${cPath}/gw/document/detail.do?what=${dcmDetail.pmtRetDcmNo}" target="_blank">${refDcm.pmtDcmTitle}</a>
	                </p>
               </c:if>
               <div class="table-responsive">
                   <table class="table m-0 table-borderless">
                       <tbody>
                       <tr>  
                           <td class="align-top pe-6 ps-0 py-6 text-body">
                               <p class=" p-0 m-0">위와 같이 문서를 기안합니다.</p>
                           </td>
                           <td class="px-0 py-6 w-px-100">
                               <p class="mb-2">기안일 :</p>
                               <p class="mb-2">기안자 :</p>
                           </td>
                           <td class="text-end ps-0 py-6 w-px-120 fw-medium text-heading">
                               <p class="fw-medium mb-2">${dcmDetail.pmtDcmSaveDate}</p>
                               <p class="fw-medium mb-2">
                                   ${dcmDetail.pmtDcmEmpnm} 
                                   <span class="stamp">
                                       (인)
                                       <img src="${cPath}/resources/images/stamp/stamp_1.png" alt="신청도장">
                                   </span>
                               </p>
                           </td>
                       </tr>
                       </tbody>
                   </table>
               </div>
               <div class="card-body invoice-preview-header rounded">
                   <div class="d-flex justify-content-between flex-xl-row flex-md-column flex-sm-row flex-column align-items-xl-start align-items-md-start align-items-sm-center align-items-start">
                       <div>
                           <div class="d-flex svg-illustration mb-6 gap-2 align-items-center">
                               <!-- 
                               <span class="app-brand-logo demo">
                                   <img src="${cPath}/resources/groupwareAdmin/assets/img/branding/symbol.png" alt="symbol"> 
                               </span>
                                -->
                               <span class="app-brand-text demo fw-bold ms-50 lh-1">${company.comNm}</span>
                           </div>
                           <p class="mb-0">
                               <span class="pe-2">대표이사 </span>
                               <b>${company.comBsnm}</b>
                           </p>
                           <p class="mb-0">
                               <span class="pe-2">사업자등록번호 </span>
                               <b>${company.comBsno}</b>
                           </p>
                           <p class="mb-0">
                               <span class="pe-2">주소</span> 
                               <b>${company.comAdr}</b>
                           </p>
                           <p class="mb-0">
                               <span class="pe-2">전화번호</span>
                               <b>${company.comTel}</b>
                           </p>
                       </div>
                       
						
						
						
                       <div>
                           <h6 class="mb-6">
                               <span class="pe-2">
                                   문서번호
                               </span>
                               <span>${dcmDetail.comdcmNum}</span>
                           </h6>
                           <!-- 초기 플래그 변수 설정 -->
							<c:set var="foundMatch" value="false" />
							
							<!-- 리스트의 모든 객체를 순회하며 pmtDcmStaNo 검사 -->
							<c:forEach items="${dcmAppList}" var="dcmApp" varStatus="status">
							    <!-- 조건이 아직 충족되지 않은 경우에만 실행 -->
							    <c:if test="${!foundMatch}">
							        <c:choose>
							            <c:when test="${dcmApp.pmtDcmStaNo == 'DB06140'}">
							                <c:set var="foundMatch" value="true" />
							                <div>
							                    <span class="pe-2">최종결재자</span>
							                    <b>${dcmApp.pmtDcmAppEmpNm} 
							                        <span class="stamp">(인)
							                            <img src="${cPath}/resources/images/stamp/stamp_3.png" alt="반려도장">
							                        </span>
							                    </b>
							                </div>
							                <div>
							                    <span class="pe-2">소속/직책</span>
							                    <b>${dcmApp.pmtDcmAppEmpDep}/${dcmApp.pmtDcmAppEmpOnepos}</b>
							                </div>
							                <div>
							                    <span class="pe-2">최종결재일자</span>
							                    <b>${dcmApp.pmtDcmAppDate}</b>
							                </div>
							            </c:when>
							            <c:when test="${dcmApp.pmtDcmStaNo == 'DB06150'}">
							                <c:set var="foundMatch" value="true" />
							                <div>
							                    <span class="pe-2">최종결재자</span>
							                    <b>${dcmApp.pmtDcmAppEmpNm} 
							                        <span class="stamp">(인)
							                            <img src="${cPath}/resources/images/stamp/stamp_4.png" alt="전결도장">
							                        </span>
							                    </b>
							                </div>
							                <div>
							                    <span class="pe-2">소속/직책</span>
							                    <b>${dcmApp.pmtDcmAppEmpDep}/${dcmApp.pmtDcmAppEmpOnepos}</b>
							                </div>
							                <div>
							                    <span class="pe-2">최종결재일자</span>
							                    <b>${dcmApp.pmtDcmAppDate}</b>
							                </div>
							            </c:when>
							            <c:when test="${status.last && dcmApp.pmtDcmStaNo == 'DB06130'}">
							                <c:set var="foundMatch" value="true" />
							                <div>
							                    <span class="pe-2">최종결재자</span>
							                    <b>${dcmApp.pmtDcmAppEmpNm} 
							                        <span class="stamp">(인)
							                            <img src="${cPath}/resources/images/stamp/stamp_2.png" alt="승인도장">
							                        </span>
							                    </b>
							                </div>
							                <div>
							                    <span class="pe-2">소속/직책</span>
							                    <b>${dcmApp.pmtDcmAppEmpDep}/${dcmApp.pmtDcmAppEmpOnepos}</b>
							                </div>
							                <div>
							                    <span class="pe-2">최종결재일자</span>
							                    <b>${dcmApp.pmtDcmAppDate}</b>
							                </div>
							            </c:when>
							        </c:choose>
							    </c:if>
							</c:forEach>
							
							<!-- 결재가 진행 중일 때를 위한 대체 출력 -->
							<c:if test="${!foundMatch}">
							    <div>결재가 진행 중입니다.</div>
							</c:if>
                           
                       </div>
                   </div>
               </div>
               <hr class="mt-0 mb-6" />
               <div class="card-body p-0">
                   <div class="row">
                       <div class="col-12">
                           <span class="fw-medium text-heading">경고:</span>
                           <span>
                               해당문서는 <b>${company.comNm}</b>에서 내부적으로 작성된 문서로 외부에 노출되지 않도록 주의 부탁드립니다.
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
	           <nav class="card-body">
	               <ul class="px-0 mx-0 ">
	                   <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">기안자</li>
	               </ul>
	               <ul class="d-flex align-items-center px-0 mb-4 ">
	                   <li class="d-flex align-items-center list-unstyled " >
	                       <button class="btn btn-text-dark" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no="${dcmDetail.pmtDcmEmpno}">
	                           <b class="m-0 pe-2">${dcmDetail.pmtDcmEmponepos}</b>
	                           <span>${dcmDetail.pmtDcmEmpnm}</span>
	                       </button>
	                   </li>
	               </ul>
	               
	               <ul class="px-0 mx-0 ">
	                   <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">결재인원</li>
	               </ul>
	               <c:forEach items="${dcmAppList}" var="dcmApp" varStatus="status">
		               <ul class="d-flex align-items-center px-0 mb-4 ">
		                   <li class="list-unstyled">
		                       <span class="badge bg-label-secondary">${status.index+1}</span>
		                   </li>
		                   <li class="d-flex align-items-center list-unstyled " >
		                       <button class="btn btn-text-dark" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no="${dcmApp.pmtDcmAppEmpId}">
		                           <b class="m-0 pe-2">${dcmApp.pmtDcmAppEmpPos}</b>
		                           <span>${dcmApp.pmtDcmAppEmpNm}</span>
		                       </button>
		                   </li>
		                   <li class="ms-auto list-unstyled ">
		                       
		                       		<c:choose>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06110'}">
											<span class="badge bg-label-info" >대기</span>
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06120'}">
											<span class="badge bg-label-success" >예정</span>
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06130'}">
											<span class="badge bg-label-secondary" >승인</span>
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06140'}">
											<span class="badge bg-label-danger" >반려</span>
										</c:when>
										<c:when test="${dcmApp.pmtDcmStaNo eq 'DB06150'}">
											<span class="badge bg-label-warning" >전결</span>
										</c:when>
									</c:choose>
		                       
		                   </li>
		               </ul>
		               <ul class="comment px-0 mb-4 border-bottom pb-4">
		                   <li class="list-unstyled">
	                       		<c:choose>
									<c:when test="${not empty dcmApp.pmtDcmAppCmt}">
										${dcmApp.pmtDcmAppCmt}
									</c:when>
									<c:otherwise>
										코멘트가 없습니다.
									</c:otherwise>
								</c:choose>
		                   </li>
		               </ul>
	               </c:forEach>
	               
	               <ul class="px-0 mx-0 ">
	                   <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">수신자</li>
	               </ul>
	               <ul class="d-flex align-items-center px-0 mb-4 border-bottom pb-4">
	                   <li class="d-flex align-items-center list-unstyled " >
	                       <button class="btn btn-text-dark" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no="${dcmDetail.pmtDcmRecEmpno}">
	                           <b class="m-0 pe-2">${dcmDetail.pmtDcmRecEmponepos}</b>
	                           <span>${dcmDetail.pmtDcmRecEmpnm}</span>
	                       </button>
	                   </li>
	                   <li class="ms-auto list-unstyled ">
	                       <span class="badge bg-label-dark">
	                       <c:choose>
								<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01110'}">
									대기
								</c:when>
								<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01120'}">
									예정
								</c:when>
								<c:when test="${dcmDetail.pmtDcmRecStano eq 'DB01140'}">
									완료
								</c:when>
							</c:choose>
	                       </span>
	                   </li>
	               </ul>
	               <ul class="px-0 mx-0 ">
	                   <li class="fw-bold fs-5 px-0 mx-0 list-unstyled">참조인원</li>
	               </ul>
	               <ul class="d-flex flex-wrap align-items-center px-0 mb-4 border-bottom pb-4 gap-2">
	               		<c:choose>
							<c:when test="${not empty refList}">
			               		<c:forEach items="${refList}" var="ref">
			               			<li class="list-unstyled">
				                       <button class="btn btn-sm btn-label-secondary" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no="${ref.pmtDcmRefEmpNo}">
				                       		${ref.pmtDcmRefEmpNm}
				                       </button>
				                    </li>
			               		</c:forEach>
							</c:when>
							<c:otherwise>
								참조인원이 없습니다.
							</c:otherwise>
						</c:choose>
	               </ul>
	               <button class="btn btn-primary w-100" id="print" target="_blank" >
	                   <i class='bx bx-printer bx-sm me-2'></i>
	                   Print
	               </button>
	           </nav>
	       </div>
       </div>
       <!-- /Invoice Actions -->
    </div>
    <div class="modal fade " id="empMethods" tabindex="-1" aria-modal="true" role="dialog">
        <div class="modal-dialog modal-md modal-simple modal-enable-otp modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold fs-4" id="empMethodsLabel">직원 상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</div>


<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/document-detail.js"></script>
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/emp-modal.js"></script>