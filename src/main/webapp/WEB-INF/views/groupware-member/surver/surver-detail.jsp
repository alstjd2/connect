<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
<!-- Project Cards -->
<div class="container-xxl flex-grow-1 container-p-y dcmPage">
	<div class="mb-10 mt-5">
		<button onclick="goBack()" type="button" class="btn rounded-pill btn-label-primary">
         	<span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>뒤로가기
       </button>
	</div>
	<div class="card ">
		<div class="card-header">
			<div class="d-flex justify-content-between align-items-center pb-3">
				<div class="d-flex justify-content-between align-items-center mb-2">
                  <p class="mb-0 pe-2"><i class="bx bxs-user fs-6 me-1"></i><span class="text-heading fw-medium">${svyDetail.totalAnswerees}</span>명 중 <span class="text-heading fw-medium">${svyDetail.actualRespondents}</span>명 응답</p>
                  <small class="text-body">(응답률 <span class="text-heading fw-medium"> <fmt:formatNumber value="${svyDetail.actualRespondents/svyDetail.totalAnswerees * 100}" type="number" maxFractionDigits="1" />%</span>)</small>
                </div>
				<div class="d-flex gap-3 pb-3">
					<c:if test="${svyDetail.svyImpYn eq 'Y'}"><span class="badge bg-label-danger">중요설문</span></c:if>
					<c:if test="${svyDetail.svyAllYn eq 'Y'}"><span class="badge bg-label-info">모두투표</span></c:if>	
					<c:if test="${svyDetail.svyAnyYn eq 'Y'}"><span class="badge bg-label-secondary">익명투표</span></c:if>
			  	</div>
			</div>
			<div class="d-flex g-3 justify-content-between align-items-center pb-3 border-bottom">
				<div class="d-flex align-items-center h-100"> 
		            <div class="me-4 h-100">
		            	<c:choose>
		            		<c:when test="${svyDetail.svyStatus eq '진행중'}">
		            			<span class="badge bg-success h-100 d-flex align-items-center">진행중</span>
		            		</c:when>
		            		<c:when test="${svyDetail.svyStatus eq '대기'}">
		            			<span class="badge bg-success h-100 d-flex align-items-center">대기</span>
		            		</c:when>
		            		<c:when test="${svyDetail.svyStatus eq '종료'}">
		            			<span class="badge bg-dark h-100 d-flex align-items-center">종료</span>
		            		</c:when>
		            	</c:choose>
		            </div>
					<div>
		                <h5 class="mb-0 fw-bold"> ${svyDetail.svyNm} </h5>
		                <div class="text-body fw-light">
		                	시작: <b>${svyDetail.svyStrDate}</b> 
		                	종료: 
		                	<b>
			                	 <c:choose>
			                	 	<c:when test="${svyDetail.svyAllYn eq 'Y'}">모두 응답 시 종료</c:when>
			                	 	<c:otherwise>${svyDetail.svyEndDate}</c:otherwise>
			                	 </c:choose>
		                	</b>
		                </div>
		            </div>
				</div>
				<div class="d-flex "> 
					<div class="avatar me-4">
		                <img src="/connect/files/600c5840-3f50-4157-a228-cc6edc1e76b0" alt="맹동승" class="rounded-circle">
		            </div>
		            <div>
		                <p class="text-body mb-0 fw-light">작성자: <b>${svyDetail.employee.empNm}</b></p>
		                <p class="text-body mb-0 fw-light">생성일: <b>${svyDetail.svyAsk.svyAskDate}</b></p>
		            </div>
				</div>
			</div>
		</div> 
		<c:if test="${svyDetail.svyAnyYn ne 'Y'}">
			<div class="card-body ">
				<h6 class="fw-bold ps-5">설문지 답변자별 상세보기</h6>
				<div class="row g-3 pb-7 px-5 border-bottom">
					<c:forEach items="${ansList}" var="ans">
						<div class="d-flex align-items-center col-lg-2 col-sm-3" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#ansMethods" data-pmt-emp-no='${ans.empNo}' data-pmt-svy-no='${ans.svyNo}'>
		                  <div class="avatar me-2">
		                  	<c:choose>
		                  		<c:when test="${not empty ans.profileImg}">
		                  			<img src="/connect/files/${ans.profileImg}" alt="${ans.empNm}" class="rounded-circle" />
		                  		</c:when>
		                  		<c:otherwise>
		                  			<span class="avatar-initial rounded-circle"></span>
		                  		</c:otherwise>
		                  	</c:choose>
		                  </div>
		                  <div class="me-2">
		                    <p class="mb-0 h6 emp_name position-relative">
		                    	<c:choose>
		                    		<c:when test="${ans.svyAnsDate ne null}">
		                    			<span class="badge bg-label-success">완료</span>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<span class="badge bg-label-secondary">진행중</span>		                    			
		                    		</c:otherwise>
		                    	</c:choose>
		                    	${ans.empNm}
		                    	<c:if test="${principal.realUser.empNo eq ans.empNo}" ><span class="badge rounded-pill bg-danger badge-dot badge-notifications"></span></c:if>
		                    </p>
		                    <small>${ans.empDepNm} / ${ans.empPosNm}</small>
		                  </div>
		                </div>
					</c:forEach>
				</div>
				
			</div>
		</c:if>
		<div class="card-footer">
			<!-- <h6 class="fw-bold mb-0 fs-5">전체 통계 결과</h6> -->
			<section class="row">
				<c:forEach items="${svyResult[0].chiList}" var="svyResult" varStatus="status">
					<div class="col-md-6 p-5">
						<article class="px-8 py-10 border">
							<h6 class=" fs-5 d-flex justify-content-between">
								<c:set var="total" value="0"></c:set>
								<c:forEach items="${svyResult.clsList}" var="svyResultCls">
									<c:forEach items="${svyResultCls.svyAnsListList}" var="list">
									    <c:if test="${list.svyAnsNo ne 0}"> 
									        <c:set var="total" value="${total + 1}" />
									    </c:if>
									</c:forEach>
								</c:forEach>
								<b class="fw-bold"><span class="fw-light">${status.index+1}.</span> ${svyResult.chiNm}</b>
								<span class="fw-light fs-6"> (총 <b>${total}</b>표)</span>
							</h6>
							<c:set var="maxPercentage" value="0"></c:set>
							<c:forEach items="${svyResult.clsList}" var="svyResultCls">
							    <c:set var="count" value="0"></c:set>
							    <c:forEach items="${svyResultCls.svyAnsListList}" var="list">
							        <c:if test="${list.svyAnsNo ne 0}">
							            <c:set var="count" value="${count + 1}" />
							        </c:if>
							    </c:forEach>
							    <c:set var="currentPercentage" value="${(count/total) * 100}" />
							    
							    <!-- 최고값을 찾음 -->
							    <c:if test="${currentPercentage gt maxPercentage}">
							        <c:set var="maxPercentage" value="${currentPercentage}" />
							    </c:if>
							</c:forEach>
							<ul class="list-group">
							    <c:forEach items="${svyResult.clsList}" var="svyResultCls" varStatus="status2">
							        <c:set var="count" value="0"></c:set>
							        <c:forEach items="${svyResultCls.svyAnsListList}" var="list">
							            <c:if test="${list.svyAnsNo ne 0}">
							                <c:set var="count" value="${count + 1}" />
							            </c:if>
							        </c:forEach>
							
							        <!-- 현재 퍼센트 계산 -->
							        <c:set var="currentPercentage" value="${(count/total) * 100}" />
							
							        <!-- 최고값과 비교하여 스타일 적용 -->
							        <li class="list-group-item list-group-item-action d-flex align-items-center p-4">
							            <div class="badge ${currentPercentage eq maxPercentage ? 'bg-primary' : 'bg-secondary'} rounded p-2 me-3">${status2.index+1}</div>
							            <div class="w-100">
							                <h6 class="mb-2 d-flex justify-content-between">
							                    <span>${svyResultCls.clsCnt}</span>
							                    <span class="fw-light text-body">
							                        (<b>${count}</b>표 / 
							                        <b><fmt:formatNumber value="${currentPercentage}" type="number" maxFractionDigits="1" /></b>%)
							                    </span>
							                </h6>
							                <div class="progress" style="height: 5px">
							                    <div class="progress-bar ${currentPercentage eq maxPercentage ? 'bg-primary' : 'bg-secondary'}" role="progressbar" style="width: <fmt:formatNumber value="${currentPercentage}" type="number" maxFractionDigits="1" />%" aria-valuenow="${currentPercentage}" aria-valuemin="0" aria-valuemax="100"></div>
							                </div>
							            </div>
							        </li>
							    </c:forEach>
							</ul>
			           </article>
					</div>
				</c:forEach>
			</section>
			
		</div>
	</div>
	
	<div class="modal fade " id="ansMethods" tabindex="-1" aria-modal="true" role="dialog">
        <div class="modal-dialog modal-md modal-simple modal-enable-otp modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold fs-4" id="empMethodsLabel">답변 상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var colorClasses = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
    // 모든 avatar-initial 요소를 선택합니다.
    document.querySelectorAll('.avatar-initial').forEach(function(element) {
        var empNameElement = element.closest('div.d-flex.align-items-center.col-lg-2').querySelector('.emp_name');
        if (empNameElement) {
            var empName = empNameElement.textContent.trim();
            if (empName) {
            	
                // 첫 글자를 추출하고, 요소에 설정합니다.
                var firstLetter = empName.charAt(0);
                element.textContent = firstLetter;
            } else {
                console.log('Employee Name is empty');
            }
        } else {
            console.log('emp_name element not found');
        }
        var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
        element.classList.add('bg-label-' + randomColorClass);
    });
});
</script>

<script defer src="${cPath}/resources/groupwareMember/assets/js/svy-ans.js"></script>