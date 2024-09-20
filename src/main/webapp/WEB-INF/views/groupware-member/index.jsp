<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page import="java.util.Locale"%>
<script defer type="text/javascript" src="${cPath}/resources/js/app/jmsaa/board.js"></script>
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
<%-- 		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal" var="principal" />
			<security:authentication property="authorities" var="authorities" />
			<div>
				principal.realUser : ${ principal.realUser } <br>
				<hr>
				authorities : ${ authorities }
			</div>
		</security:authorize> --%>

		<main class="row g-5">
			<div class="col-12">
				<div class="card">
	               <div class="card-widget-separator-wrapper">
	                 <div class="card-body card-widget-separator">
						<div class="pb-5">
							<a href="${cPath}/gw/document/list.do" class="m-0 h5 d-flex align-items-center main-title">
								<b>내 문서관리 </b>
								<i class='bx bx-chevron-right'></i>
							</a>
						</div>
	                   <div class="row gy-4 gy-sm-1">
	                     <div class="col-sm-6 col-lg-3">
	                       <div class="d-flex justify-content-between align-items-center card-widget-1 border-end pb-4 pb-sm-0">
	                         <div>
	                           <h4 class="mb-0"><b class="fs-2 fw-bold pe-2 text-dark">${myAppNowDcm}</b>개 </h4>
	                           <p class="mb-0">대기문서</p>
	                         </div>
	                         <div class="avatar me-sm-6">
	                           <span class="avatar-initial rounded bg-label-success text-success">
	                             <i class="bx bx-left-arrow-circle bx-26px"></i>
	                           </span>
	                         </div>
	                       </div>
	                       <hr class="d-none d-sm-block d-lg-none me-6">
	                     </div>
	                     <div class="col-sm-6 col-lg-3">
	                       <div class="d-flex justify-content-between align-items-center card-widget-2 border-end pb-4 pb-sm-0">
	                         <div>
	                           <h4 class="mb-0"><b class="fs-2 fw-bold pe-2 text-dark">${myAppAffDcm}</b>개 </h4>
	                           <p class="mb-0">예정문서</p>
	                         </div>
	                         <div class="avatar me-lg-6">
	                           <span class="avatar-initial rounded bg-label-info text-info">
	                             <i class="bx bx-pause-circle bx-26px"></i>
	                           </span>
	                         </div>
	                       </div>
	                       <hr class="d-none d-sm-block d-lg-none">
	                     </div>
	                     <div class="col-sm-6 col-lg-3">
	                       <div class="d-flex justify-content-between align-items-center border-end pb-4 pb-sm-0 card-widget-3">
	                         <div>
	                           <h4 class="mb-0"><b class="fs-2 fw-bold pe-2 text-dark">${myRefDcm}</b>개 </h4>
	                           <p class="mb-0">참조문서</p>
	                         </div>
	                         <div class="avatar me-sm-6">
	                           <span class="avatar-initial rounded bg-label-secondary text-heading">
	                             <i class="bx bx-check-double bx-26px"></i>
	                           </span>
	                         </div>
	                       </div>
	                     </div>
	                     <div class="col-sm-6 col-lg-3">
	                       <div class="d-flex justify-content-between align-items-center">
	                         <div>
	                           <h4 class="mb-0"><b class="fs-2 fw-bold pe-2 text-dark">${myRecDcm}</b>개</h4>
	                           <p class="mb-0">수신문서</p>
	                         </div>
	                         <div class="avatar">
	                           <span class="avatar-initial rounded bg-label-danger text-danger">
	                             <i class="bx bx-error-circle bx-26px"></i>
	                           </span>
	                         </div>
	                       </div>
	                     </div>
	                   </div>
	                 </div>
	               </div>
	             </div>
            </div>
			<div class="col-12 col-lg-4">
				<div class="card d-flex flex-column align-items-start p-8 overflow-hidden justify-content-start text-dark h-100 w-100">
					<div class="pb-5">
						<a href="${cPath }/gw/myInfo/vacation.do" class="m-0 h5 d-flex align-items-center main-title">
							<b>내 휴가관리 </b>
							<i class='bx bx-chevron-right'></i>
						</a>
						<span class="m-0 fw-light text-seconary toDay" style="font-size: 12px"></span>
					</div>
					<ul class="row list-unstyled w-100 m-0 h-100">
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">발생연차</p>
							<p class="mb-0 text-black-50 text-end">

							<b class="fs-2 fw-bold pe-2 text-dark">${vacCnt.applicationList[0].vacationInfo.vaciDay }</b>일

							</p>
						</li>
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">사용연차</p>
							<p class="mb-0 text-black-50 text-end">
							<c:if test="${not empty vacUseCnt.applicationList[0].cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">${vacUseCnt.applicationList[0].cnt} </b>일
							</c:if>
							<c:if test="${empty vacUseCnt.applicationList[0].cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">0 </b>일
							</c:if>
							</p>
						</li>
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">잔여연차</p>
							<p class="mb-0 text-black-50 text-end"><b class="fs-2 fw-bold pe-2 text-dark"><c:set
											var="remainingDays"
											value="${vacCnt.applicationList[0].vacationInfo.vaciDay - vacUseCnt.applicationList[0].cnt}" />
										${remainingDays}</b>일 </p>
						</li>
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">발생특별휴가</p>
							<p class="mb-0 text-black-50 text-end">
							<c:if test="${not empty speAllCnt.cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">${speAllCnt.cnt }</b>일
							</c:if>
							<c:if test="${empty speAllCnt.cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">0 </b>일
							</c:if>
							</p>
						</li>
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">사용특별휴가</p>
							<p class="mb-0 text-black-50 text-end">
							<c:if test="${not empty speUseCnt.cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">${speUseCnt.cnt }</b>일
							</c:if>
							<c:if test="${empty speUseCnt.cnt}">
							<b class="fs-2 fw-bold pe-2 text-dark">0 </b>일
							</c:if>
							</p>
						</li>
						<li class="col col-sm-4 p-3 pt-5 border-bottom">
							<p class="mb-0 text-black-50">잔여특별휴가</p>
							<p class="mb-0 text-black-50 text-end">
							<b class="fs-2 fw-bold pe-2 text-dark">

							<c:set var="remainingSpeDays" value="${speAllCnt.cnt - speUseCnt.cnt}" />
												${remainingSpeDays}</b>일 </p>
						</li>
					</ul>
					<a href="${cPath }/gw/vacation/applicationInsert.do" class="btn btn-primary w-100 mt-5">
						<i class='bx bx-18 bx-plus me-2'></i> <span class="align-middle">부재일정 추가</span>
					</a>
				</div>
			</div>
			<div class="col-12 col-lg-8">
              <div class="card h-100">
                <div class="row row-bordered g-0">
                  <div class="col-md-8">
                    <div class="d-flex flex-column align-items-start p-8 overflow-hidden justify-content-start text-dark h-100 w-100">
						<div class="pb-5">
							<a href="${cPath }/gw/myInfo/empattendanceList.do" class="m-0 h5 d-flex align-items-center main-title">
								<b>금일 근태현황</b>
								<i class='bx bx-chevron-right'></i>
							</a>
							<span class="m-0 fw-light text-seconary toDay" style="font-size: 12px"></span>
						</div>
						<div class="container-xxl pb-5 text-center fs-1 fw-bold mt-5" id="currentTime"></div>
							<div class="w-100 text-center">
							<form id="attendanceForm" method="post" enctype="multipart/form-data">
								<input type="hidden" name="attIp" value="${pageContext.request.remoteAddr }">
								<!-- 출근 버튼 -->
							<button type="button" class="btn btn-primary me-2"
							        onclick="submitAttendance('start')"
							        <c:if test="${not empty todayAtt.attStart }">disabled</c:if>>
							    <i class='bx bx-18 bx-log-in-circle me-2'></i>
							    <span class="align-middle">출근</span>
							</button>
						
							<!-- 퇴근 버튼 -->
							<button type="button" class="btn btn-primary ms-2"
							        onclick="submitAttendance('end')">
							    <i class='bx bx-18 bx-log-out-circle me-2'></i>
							    <span class="align-middle">퇴근</span>
							</button>
						
							</form>
						</div>
					</div>
				  </div>
                  <div class="col-md-4">
                    <div class="card-body">
                      <div class="report-list">
                        <div class="report-list-item rounded-2 mb-4">
                          <div class="d-flex align-items-center">
                            <div class="report-list-icon shadow-xs me-4">
                              <i class="bx bx-up-arrow-circle bx-lg text-heading text-primary"></i>
                            </div>
                            <div class="d-flex justify-content-between align-items-center w-100 flex-wrap gap-2">
                              <div class="d-flex flex-column">
                                <span>출근 시간</span>
                                <h5 class="mb-0">
									<c:if test="${not empty todayAtt.attStart }">
									<b>${todayAtt.attStart.substring(11) }</b>
									</c:if>
									<c:if test="${empty todayAtt.attStart }">
									<b> -</b>
									</c:if>
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="report-list-item rounded-2 mb-4">
                          <div class="d-flex align-items-center">
                            <div class="report-list-icon shadow-xs me-4">
                              <i class="bx bx-down-arrow-circle bx-lg text-warning"></i>
                            </div>
                            <div class="d-flex justify-content-between align-items-center w-100 flex-wrap gap-2">
                              <div class="d-flex flex-column">
                                <span>퇴근 시간</span>
                                <h5 class="mb-0">
									<c:if test="${not empty todayAtt.attEnd }">
										<b>${todayAtt.attEnd.substring(11) }</b>
									</c:if>
									<c:if test="${empty todayAtt.attEnd }">
										<b> -</b>
									</c:if>
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="report-list-item rounded-2">
                          <div class="d-flex align-items-center">
                            <div class="report-list-icon shadow-xs me-4">
                              <i class='bx bx-time bx-lg text-info'></i>
                            </div>
                            <div class="d-flex justify-content-between align-items-center w-100 flex-wrap gap-2">
                              <div class="d-flex flex-column">
                                <span>총 근무시간</span>
                                <h5 class="mb-0">
									<c:if test="${not empty todayAtt.workTime }">
										<b>${todayAtt.workTime }</b>
									</c:if>
									<c:if test="${empty todayAtt.workTime }">
										<b> -</b>
									</c:if>
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
				  <div class="col-12 p-5">
				  	<div class="mb-3 d-flex justify-content-between">
				  		<h6>월별 근태현황</h6>
				  		<div>
				  			<span class="badge rounded-pill bg-info">정상근무</span>
				  			<span class="badge rounded-pill bg-warning">지각</span>
				  			<span class="badge rounded-pill bg-danger-subtle">조퇴</span>
				  			<span class="badge rounded-pill bg-dark">기타</span>
				  		</div>
				  	</div>
					<div class="vehicles-overview-progress progress rounded-3 bg-transparent overflow-hidden" style="height: 46px">
						<c:forEach items="${attWorkStatus}" var="status">
							<c:if test="${status.workStatus ne '기타'}">
								<div class="progress-bar fw-medium text-start shadow-none
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
                  </div>
                  
                </div>
              </div>
              <!--/ Total Income -->
            </div>
			<c:set var="todoCount" value="${fn:length(todayTodoList)}" />
			<c:set var="comCount" value="${fn:length(todayComList)}" />
			<c:set var="depCount" value="${fn:length(todayDepList)}" />
			<c:set var="totalCount" value="${todoCount + comCount + depCount}" />
			<div class="col-12 col-lg-4">
				<div class="card d-flex flex-column align-items-start p-8 overflow-hidden justify-content-start text-dark h-100 w-100">
					<div class="pb-5">
						<a href="${cPath }/gw/todoList/calendar.do" class="m-0 h5 d-flex align-items-center main-title">
							<b>내 오늘일정 <span class="badge bg-danger text-white badge-notifications">${totalCount }</span></b>
							<i class='bx bx-chevron-right'></i>
						</a>
						<span class="m-0 fw-light text-seconary toDay" style="font-size: 12px"></span>
					</div>
					<ul class="list-unstyled w-100 m-0 h-100">
						<c:forEach items="${todayTodoList }" var="todoList">
    							<li class="p-3 pt-5 border-bottom d-flex justify-content-between flex-column">
          			 				 <b class="mb-2">
			        					<a href="#" class="mb-0 text-dark offcanClass form-check-primary">
							               <input type="checkbox" class="form-check-input me-2" data-todo-no="${todoList.todoNo}"
										       id="checkbox-${todoList.todoNo}"
										       onchange="toggleTodoStatus(this)"
										       ${todoList.todoState == 'BB03110' ? 'checked' : ''} />
							                <span data-todo-title="${todoList.todoNo}" class="form-check-label" id="todoTitle-${todoList.todoNo}">${todoList.todoTitle}</span>
			       						 </a>

           							 </b>
           							 
      			  					<p class="mb-0 text-black-50"><b>${todoList.todoCate.todocateTitle}</b> |  ${todoList.todoStart.substring(11)} ~ ${todoList.todoEnd.substring(11)}</p>
        			   					 
  							  </li>
						</c:forEach>
							<c:forEach items="${todayComList }" var="todocomList">
    							<li class="p-3 pt-5 border-bottom d-flex justify-content-between flex-column">
          			 				 <b class="mb-2">
			        					<a href="#" class="mb-0 text-dark offcanClass form-check-primary">
							               <input type="checkbox" class="form-check-input me-2" data-todo-no="${todocomList.todoNo}"
										       id="checkbox-${todocomList.todoNo}"
										       onchange="toggleTodoStatus(this)"
										       ${todocomList.todoState == 'BB03110' ? 'checked' : ''} />
							                <span data-todo-title="${todocomList.todoNo}" class="form-check-label" id="todoTitle-${todocomList.todoNo}"> ${todocomList.todoTitle}</span>
			       						 </a>

           							 </b>
        			   					 
      			  					<p class="mb-0 text-black-50"> <b>기업일정</b> |  ${todocomList.todoStart.substring(11)} ~ ${todocomList.todoEnd.substring(11)}</p>
  							  </li>
							</c:forEach>
							<c:forEach items="${todayDepList }" var="tododepList">
    							<li class="p-3 pt-5 border-bottom d-flex justify-content-between flex-column">
          			 				 <b class="mb-2">
			        					<a href="#" class="mb-0 text-dark offcanClass form-check-primary">
							               <input type="checkbox" class="form-check-input me-2" data-todo-no="${tododepList.todoNo}"
										       id="checkbox-${tododepList.todoNo}"
										       onchange="toggleTodoStatus(this)"
										       ${tododepList.todoState == 'BB03110' ? 'checked' : ''} />
							                <span data-todo-title="${tododepList.todoNo}"  class="form-check-label"  id="todoTitle-${tododepList.todoNo}">${tododepList.todoTitle}</span>
			       						 </a>
           							 </b>
      			  					<p class="mb-0 text-black-50"><b>부서일정</b> |  ${tododepList.todoStart.substring(11)} ~ ${tododepList.todoEnd.substring(11)}</p>
  							  </li>
							</c:forEach>

					</ul>
					<a href="${cPath }/gw/todoList/empTodoList.do" class="btn btn-primary w-100 mt-5">
						<i class='bx bx-18 bx-plus me-2'></i> <span class="align-middle">할일 생성</span>
					</a>
				</div>
			</div>
				<div class="col-12 col-lg-4">
				    <div class="card d-flex flex-column align-items-start p-8 overflow-hidden justify-content-start text-dark h-100 w-100">
				        <div class="pb-5">
				            <a href="${cPath }/gw/board/board.do" class="m-0 h5 d-flex align-items-center main-title">
				                <b>최신 게시글 <span class="badge bg-danger text-white badge-notifications">${grBoardList.size()}</span></b>
				                <i class='bx bx-chevron-right'></i>
				            </a>
				        </div>
				        <div class="list-unstyled w-100 m-0 h-100">
				            <c:forEach var="board" items="${grBoardList}" varStatus="status">
				                <c:if test="${status.index < 3}"> <!-- 최신 3개의 게시글만 표시 -->
				                    <div class="p-3 pt-5 border-bottom d-flex justify-content-between flex-column"
				                         data-grb-no="${board.grbNo}" style="cursor: pointer;" onclick="fetchBoardDetail(${board.grbNo})">
				                        <p class="mb-2 text-dark fw-bold fs-6">${board.grbTitle}</p>
				                        <p class="mb-0 text-black-50 fw-light"><b>${board.gubun.grbGubunTitle}</b> | ${board.grbDate.substring(0, 16)}</p>
				                    </div>
				                </c:if>
				            </c:forEach>
				        </div>
				        <a href="${cPath}/gw/board/grbGubunInsertForm.do" class="btn btn-primary w-100 mt-5">
				            <i class='bx bx-18 bx-plus me-2'></i> <span class="align-middle">게시글 작성</span>
				        </a>
				    </div>
				</div>
 			<div class="col-12 col-md-4 outlien">
 				<div class="row h-100 w-100 g-3 m-0">
					<div class="col-6 mt-0 ps-0">
						<a href="/connect/gw/company/companyInfoUpdate.do" class="card btn d-flex flex-column align-items-start border-0 py-3 px-5 position-relative overflow-hidden justify-content-center text-dark h-100">
			                <p class="fw-bold fs-5 pt-3 px-5">
			                    <i class="menu-icon tf-icons bx bx-message-square-check"></i>
			                    설문
			                </p>
			                <p class="px-5 fw-light text-start">설문 생성, 설문 응답 자세히 보기, 설문 응답</p>
			            </a>
					</div>
					<div class="col-6 mt-0 pe-0">
						<a href="${cPath}/gw/msg.do" class="card btn d-flex flex-column align-items-start border-0 py-3 px-5 position-relative overflow-hidden justify-content-center text-dark h-100">
			                <p class="fw-bold fs-5 pt-3 px-5">
			                    <i class="menu-icon tf-icons bx bx-chat"></i>
			                    메세지
			                </p>
			                <p class="px-5 fw-light text-start">채팅을 통한 개인, 단체 실시간 소통 및 이전 메시지 확인 가능</p>
			            </a>
					</div>
					<div class="col-6 ps-0 ">
						<a href="${cPath}/gw/conference/conferenceList.do" class="card btn d-flex flex-column align-items-start border-0 py-3 px-5 position-relative overflow-hidden justify-content-center text-dark h-100">
			                <p class="fw-bold fs-5 pt-3 px-5">
			                    <i class="menu-icon tf-icons bx bx bx-camera-home"></i>
			                    화상회의
			                </p>
			                <p class="px-5 fw-light text-start">화상회의 생성, 화상회의 목록 조회, 화상회의 입장</p>
			            </a>
					</div>
					<div class="col-6 pe-0">
						<a href="${cPath }/gw/edrive/edrivePage.do" class="card btn d-flex flex-column align-items-start border-0 py-3 px-5 position-relative overflow-hidden justify-content-center text-dark h-100">
			                <p class="fw-bold fs-5 pt-3 px-5">
			                    <i class="menu-icon tf-icons bx bx-cloud-upload"></i>
			                    드라이브
			                </p>
			                <p class="px-5 fw-light text-start">개인의 파일을 언제 어디서든 업로드,다운로드,삭제 하여 사용</p>
			            </a>
					</div>
 				
 				</div>
			</div> 

		</main>

		<div class="content-backdrop fade"></div>
	</div>
</div>
<script defer src="${cPath}/resources/js/app/jhjUa/groupware-member-index.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-kanban2.js"></script>
<script>
	const toDay = document.querySelectorAll(".toDay");
	function updateTime() {
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();

		// Format the time (optional)
		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;

		var currentTime = hours + ":" + minutes + ":" + seconds;

		// Update the element containing the time
		document.getElementById("currentTime").innerHTML = currentTime;

		toDay.forEach(item =>
			item.innerHTML = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일 "+getDayKo(date.getDay())
		);
	}
	function getDayKo(day){
	    switch(day){
	        case 0 : return '일요일'
	        case 1 : return '월요일'
	        case 2 : return '화요일'
	        case 3 : return '수요일'
	        case 4 : return '목요일'
	        case 5 : return '금요일'
	        case 6 : return '토요일'
	    }
	}

	setInterval(updateTime, 1000);

	const todoTitles = {};

	document.addEventListener('DOMContentLoaded', function () {
	  const checkboxes = document.querySelectorAll('input[type="checkbox"]');

	  checkboxes.forEach(function  
	 (checkbox) {
	    const todoNo = checkbox.getAttribute('data-todo-no');
	    const todoTitleElement = checkbox.closest('.offcanClass').querySelector('span[data-todo-title="' + todoNo + '"]');

	    if (todoTitleElement) {
	      todoTitles[todoNo] = todoTitleElement;
	    } else {
	      console.error(`Element with ID todoTitle-${todoNo} not found`);
	    }
	  });
	  checkboxes.forEach(applyTodoStyles);
	});


	function toggleTodoStatus(checkbox) {
		const todoNo = checkbox.getAttribute('data-todo-no');
		  const todoTitleElement = todoTitles[todoNo];

		  if (todoTitleElement) {
		    todoTitleElement.style.textDecoration = checkbox.checked ? 'line-through' : 'none';
		  } else {
		    console.error(`Element with data-todo-no="${todoNo}" not found in todoTitles`);
		  }

	    // 서버 업데이트 로직
	    const newState = checkbox.checked ? 'BB03110' : 'BB03120';
	    $.ajax({
	        type: 'POST',
	        url: `${cPath}/gw/todoList/updateTodoState.do`,
	        data: {
	            todoNo: todoNo,
	            newState: newState
	        },
	        success: function(response) {
	            console.log("상태 업데이트 성공");
	        },
	        error: function(error) {
	            console.log("상태 업데이트 오류", error);
	        }
	    });
	}

	function applyTodoStyles(checkbox) {
		  const todoNo = checkbox.getAttribute('data-todo-no');
		  // Use querySelector to target specific element within the offcanClass anchor
		  const todoTitleElement = checkbox.closest('.offcanClass').querySelector('span[data-todo-title="' + todoNo + '"]');

		  if (todoTitleElement) {
		    todoTitleElement.style.textDecoration = checkbox.checked ? 'line-through' : 'none';
		  } else {
		    console.error("Couldn't find todoTitleElement for", todoNo);
		  }
		}


	// 페이지 로드 시 체크박스 상태에 따라 스타일 적용
	document.addEventListener('DOMContentLoaded', function () {
	    document.querySelectorAll('input[type="checkbox"]').forEach(function (checkbox) {
	        applyTodoStyles(checkbox);
	    });
	});


</script>


