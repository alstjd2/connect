<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%
	String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
	if (originalUri == null) {
	    originalUri = request.getRequestURI(); // fallback if not forwarded
	}
%>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    const contextPath = '<%= request.getContextPath() %>';
    const socketEmpNo = '${principal.realUser.empNo}';
</script>
<c:choose>
	<c:when test="${not empty company.comOg and company.comOg eq 1}">

		<div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed p-3 d-flex gap-3 flex-wrap" style="top: 120px; right: 20px; z-index: 10000; width: 350px;">
			<div id="toast-template" class="bs-toast toast fade bg-primary" role="alert" aria-live="assertive" aria-atomic="true">
			    <div class="toast-header pb-e">
			      <i class="bx bx-bell me-2"></i>
			      <div class="me-auto fw-medium">알림</div>
			      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			    </div>
			    <div class="toast-body pt-0">메세지</div>
			</div>
		</div>
		
		<nav class="layout-navbar navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">
          <div class="container-xxl">
            <div class="navbar-brand app-brand demo d-none d-xl-flex py-0 me-4">
              <a href="${cPath}/gw/index.do" class="app-brand-link">
		            <span class="app-brand-logo demo">
		            	<c:choose>
							<c:when test="${not empty company.comClogo and company.comClogo != '0'}">
							<c:url value='/files/${company.atchFile.fileDetails[0].comClogoStrefileNm}' var="fileUrl"/>
								<img src="${fileUrl }"
								class="d-block w-px-60 h-px-60 rounded" id="uploadedAvatars"
								alt="symbol" width="60" height="60"/>
							</c:when>
							<c:otherwise>
		                		<img src="${cPath}/resources/groupwareMember/assets/img/branding/symbol.png" alt="symbol">
							</c:otherwise>
						</c:choose>
		            </span>
		            <span class="app-brand-text demo menu-text fw-bold ms-2">
		                ${ company.comNm }
		            </span>
		        </a>
		
		        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-xl-none">
	                <i class="bx bx-chevron-left bx-sm d-flex align-items-center justify-content-center"></i>
	              </a>
            </div>

            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="bx bx-menu bx-md"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto">	
				<!-- 알림 -->
	        	<li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-2">
	               <a class="nav-link dropdown-toggle hide-arrow"
	                 href="javascript:void(0);"
	                 data-bs-toggle="dropdown"
	                 data-bs-auto-close="outside"
	                 aria-expanded="false">
	                 <span class="position-relative">
	                   <i class="bx bx-bell bx-md"></i>
	                   <span class="badge rounded-pill  badge-dot badge-notifications "></span>
	                 </span>
	               </a>
	               <ul class="dropdown-menu dropdown-menu-end p-0">
	                 <li class="dropdown-menu-header border-bottom">
	                   <div class="dropdown-header d-flex align-items-center py-3">
	                     <h6 class="mb-0 me-auto">알림</h6>
	                     <div class="d-flex align-items-center h6 mb-0">
	                       <span class="badge bg-label-primary me-2"></span>
	                     </div>
	                   </div>
	                 </li>
	                 <li class="dropdown-notifications-list " style="max-height : 50vh; overflow-y : scroll;">
	                   <ul class="list-group list-group-flush">
	                     
	                     <c:forEach var="alarm" items="${alarmList}">
						    <li class="list-group-item list-group-item-action dropdown-notifications-item  ${alarm.alarmChk == 'Y' ? 'marked-as-read' : ''}">
						        <div class="d-flex">
						            <div class="flex-shrink-0 me-3">
						                <div class="avatar">
						                    <span class="avatar-initial rounded-circle bg-label-danger">${alarm.alarmHeader.substring(0, 2)}</span>
						                </div>
						            </div>
						            <div class="flex-grow-1">
						                <h6 class="small mb-0">${alarm.alarmHeader}</h6>
						                <small class="mb-1 d-block text-body">${alarm.alarmComncode}</small>
						                <small class="text-muted">${alarm.alarmDate}</small>
						            </div>
						            <div class="flex-shrink-0 dropdown-notifications-actions">
						                <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
						                <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
						            </div>
						        </div>
						    </li>
						</c:forEach>    
	
	                   </ul>
	                 </li>
	                
	               </ul>
	             </li>        	
				<!--/알림 -->
                <!-- 직원 -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
	                <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);"
	                    data-bs-toggle="dropdown">
	                    <div class="avatar avatar-online">
	                        <c:choose>
								<c:when test="${not empty principal.realUser.empProfileNm and principal.realUser.empProfileNm != '0'}">
								<c:url value='/files/${principal.realUser.empProfileNm}' var="fileUrl"/>
									<img src="${fileUrl }" alt="" class="w-px-40 h-px-40 rounded-circle"/>
								</c:when>
								<c:otherwise>
									<img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
								</c:otherwise>
							</c:choose>
	                    </div>
	                </a>
	                <ul class="dropdown-menu dropdown-menu-end">
	                    <li>
	                        <a class="dropdown-item" href="#">
	                            <div class="d-flex">
	                                <div class="flex-shrink-0 me-3">
	                                    <div class="avatar avatar-online">
	                                    	<c:choose>
												<c:when test="${not empty principal.realUser.empProfileNm and principal.realUser.empProfileNm != '0'}">
												<c:url value='/files/${principal.realUser.empProfileNm}' var="fileUrl"/>
													<img src="${fileUrl }" alt="" class="w-px-40 h-px-40 rounded-circle"/>
												</c:when>
												<c:otherwise>
							                		<img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
												</c:otherwise>
											</c:choose>
	                                    </div>
	                                </div>
	                                <div class="flex-grow-1">
	                                    <h6 class="mb-0">${principal.realUser.empNm}</h6>
	                                    <small class="text-muted">직원</small>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <div class="dropdown-divider my-1"></div>
	                    </li>
	                    <li>
	                        <a class="dropdown-item" href="${cPath }/gw/login/logout.do">
	                            <i class="bx bx-power-off bx-md me-3"></i><span>Log Out</span>
	                        </a>
	                    </li>
	                </ul>
	            </li>
                <!--/ 직원 -->
              </ul>
            </div>
          </div>
        </nav>		
	    <aside id="layout-menu" class="layout-menu-horizontal menu-horizontal menu bg-menu-theme flex-grow-0">
           <div class="container-xxl d-flex h-100">
             <ul class="menu-inner py-1">
               <!-- Page -->
		        <li class="menu-item <%= originalUri.contains("/employee/") || originalUri.contains("/myInfo") ? "active open" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-user'></i>
		                <div class="text-truncate" data-i18n="개인정보">개인정보</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/employee/employeeInfoUpdate.do") ? "active" : "" %>">
		                    <a href="${cPath}/gw/employee/employeeInfoUpdate.do" class="menu-link">
		                    	<i class='menu-icon bx bx-edit-alt'></i>
		                        <div class="text-truncate" data-i18n="정보수정">정보수정</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/myInfo/vacation.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/myInfo/vacation.do"class="menu-link">
		                    	<i class='menu-icon bx bx-calendar-star'></i>
		                        <div class="text-truncate" data-i18n="휴가관리">휴가관리</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/myInfo/empattendanceList.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/myInfo/empattendanceList.do" class="menu-link">
		                    	<i class='menu-icon bx bx-timer'></i>
		                        <div class="text-truncate" data-i18n="근태현황">근태현황</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/address/") ? "active" : "" %>">
		            <a href="${cPath}/gw/address/orgaddressList.do" class="menu-link">
		                <i class='menu-icon tf-icons bx bxs-user-detail'></i>
		                <div class="text-truncate" data-i18n="주소록">주소록</div>
		            </a>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/department/") ? "active open" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-group'></i>
		                <div class="text-truncate" data-i18n="부서(조직) 근태">부서(조직) 근태</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/department/vacation.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/department/vacation.do"  class="menu-link">
		                    	<i class='menu-icon bx bx-calendar-star'></i>
		                        <div class="text-truncate" data-i18n="부서(조직) 휴가관리">부서(조직) 휴가관리</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/department/attendance.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/department/attendance.do"  class="menu-link">
		                    	<i class='menu-icon bx bx-timer'></i>
		                        <div class="text-truncate" data-i18n="부서(조직) 근태현황">부서(조직) 근태현황</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/todoList/") ? "active open" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-calendar-check'></i>
		                <div class="text-truncate" data-i18n="일정관리">일정관리</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/todoList/calendar.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/todoList/calendar.do" class="menu-link">
		                    	<i class='menu-icon bx bx-calendar'></i>
		                        <div class="text-truncate" data-i18n="캘린더">캘린더</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/todoList/empTodoList.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/todoList/empTodoList.do" class="menu-link">
		                    	<i class='menu-icon bx bx-calendar-check'></i>
		                        <div class="text-truncate" data-i18n="개인일정">개인일정</div>
		                    </a>
		                </li>
		                <li class="menu-item ">
		                    <a href="${cPath }/gw/room/roomReservation.do" class="menu-link">
		                    	<i class='menu-icon bx bx-log-in'></i>
		                        <div class="text-truncate" data-i18n="회의실">회의실</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/document/") ? "active open" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-spreadsheet'></i>
		                <div class="text-truncate" data-i18n="문서결재">문서결재</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/document/insert") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/insert.do" class="menu-link">
		                    	<i class='menu-icon bx bx-message-alt-edit' ></i>
		                        <div class="text-truncate" data-i18n="문서생성">문서생성</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/list") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/list.do" class="menu-link">
		                    	<i class='menu-icon bx bx-message-alt-add' ></i>
		                        <div class="  text-truncate" data-i18n="결재문서">결재문서</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/reference") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/reference.do" class="menu-link">
		                    	<i class='menu-icon bx bx-message-alt-detail' ></i>
		                        <div class="text-truncate" data-i18n="참조문서">참조문서</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/receive") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/receive.do" class="menu-link">
		                    	<i class='menu-icon bx bx-message-alt-check'></i>
		                        <div class="text-truncate" data-i18n="수신문서">수신문서</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/gmail/") ? "active" : "" %>">
		            <a href="${cPath}/gw/gmail" class="menu-link">
		                <i class='menu-icon tf-icons bx bx-envelope'></i>
		                <div class="text-truncate" data-i18n="메일">메일</div>
		            </a>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/msg") ? "active" : "" %>">
		            <a href="${cPath}/gw/msg.do" class="menu-link">
		                <i class='menu-icon tf-icons bx bx-chat'></i>
		                <div class="text-truncate" data-i18n="메시지">메시지</div>
		            </a>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/survey/") ? "active" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-message-square-check'></i>
		                <div class="text-truncate" data-i18n="설문">설문</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/survey/create") ? "active" : "" %>">
		                    <a href="${cPath}/gw/survey/create/myList.do" class="menu-link">
		                    	<i class='menu-icon bx bx-edit'></i>
		                        <div class="text-truncate" data-i18n="만든 설문">만든 설문</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/survey/answer") ? "active" : "" %>">
		                    <a href="${cPath}/gw/survey/answer/myList.do" class="menu-link">
		                    	<i class='menu-icon bx bx-check-square'></i>
		                        <div class="text-truncate" data-i18n="받은 설문">받은 설문</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/board/") ? "active" : "" %>">
		            <a href="${cPath }/gw/board/board.do" class="menu-link">
		                <i class='menu-icon tf-icons bx bx-clipboard'></i>
		                <div class="text-truncate" data-i18n="게시판">게시판</div>
		            </a>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/conference/") ? "active" : "" %>">
		            <a href="${cPath}/gw/conference/conferenceList.do" class="menu-link">
		                <i class='menu-icon tf-icons bx bx bx-camera-home'></i>
		                <div class="text-truncate" data-i18n="화상회의">화상회의</div>
		            </a>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/edrive/") ? "active" : "" %>">
		            <a href="${cPath }/gw/edrive/edrivePage.do" class="menu-link">
		                <i class='menu-icon tf-icons bx bx-cloud-upload'></i>
		                <div class="text-truncate" data-i18n="드라이브">드라이브</div>
		            </a>
		        </li>
		        <li class="menu-item px-8"></li>
             </ul>
           </div>
         </aside>
	</c:when>
	<c:otherwise>
	

		<div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed p-3 d-flex gap-3 flex-wrap" style="top: 80px; right: 20px; z-index: 10000; width: 350px;">
			<div id="toast-template" class="bs-toast toast fade bg-primary" role="alert" aria-live="assertive" aria-atomic="true">
			    <div class="toast-header pb-e">
			      <i class="bx bx-bell me-2"></i>
			      <div class="me-auto fw-medium">알림</div>
			      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			    </div>
			    <div class="toast-body pt-0">메세지</div>
			</div>
		</div>
	
		<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
		    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
		        <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
		            <i class="bx bx-menu bx-md"></i>
		        </a>
		    </div>
		    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
		        <div class="navbar-nav align-items-center">
		            <div class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
		                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
		                    data-bs-toggle="dropdown">
		                    <i class="bx bx-md"></i>
		                </a>
		                <ul class="dropdown-menu dropdown-menu-start dropdown-styles">
		                    <li>
		                        <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
		                            <span><i class="bx bx-sun bx-md me-3"></i>Light</span>
		                        </a>
		                    </li>
		                    <li>
		                        <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
		                            <span><i class="bx bx-moon bx-md me-3"></i>Dark</span>
		                        </a>
		                    </li>
		                    <li>
		                        <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
		                            <span><i class="bx bx-desktop bx-md me-3"></i>System</span>
		                        </a>
		                    </li>
		                </ul>
		            </div>
		        </div>
		        <ul class="navbar-nav flex-row align-items-center ms-auto">        	
					<!-- 알림 -->
		        	<li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-2">
		               <a class="nav-link dropdown-toggle hide-arrow"
		                 href="javascript:void(0);"
		                 data-bs-toggle="dropdown"
		                 data-bs-auto-close="outside"
		                 aria-expanded="false">
		                 <span class="position-relative">
		                   <i class="bx bx-bell bx-md"></i>
		                   <span class="badge rounded-pill  badge-dot badge-notifications "></span>
		                 </span>
		               </a>
		               <ul class="dropdown-menu dropdown-menu-end p-0">
		                 <li class="dropdown-menu-header border-bottom">
		                   <div class="dropdown-header d-flex align-items-center py-3">
		                     <h6 class="mb-0 me-auto">알림</h6>
		                     <div class="d-flex align-items-center h6 mb-0">
		                       <span class="badge bg-label-primary me-2"></span>
		                     </div>
		                   </div>
		                 </li>
		                 <li class="dropdown-notifications-list " style="max-height : 50vh; overflow-y : scroll;">
		                   <ul class="list-group list-group-flush">
		                     
		                     <c:forEach var="alarm" items="${alarmList}">
							    <li class="list-group-item list-group-item-action dropdown-notifications-item  ${alarm.alarmChk == 'Y' ? 'marked-as-read' : ''}">
							        <div class="d-flex">
							            <div class="flex-shrink-0 me-3">
							                <div class="avatar">
							                    <span class="avatar-initial rounded-circle bg-label-danger">${alarm.alarmHeader.substring(0, 2)}</span>
							                </div>
							            </div>
							            <div class="flex-grow-1">
							                <h6 class="small mb-0">${alarm.alarmHeader}</h6>
							                <small class="mb-1 d-block text-body">${alarm.alarmComncode}</small>
							                <small class="text-muted">${alarm.alarmDate}</small>
							            </div>
							            <div class="flex-shrink-0 dropdown-notifications-actions">
							                <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
							                <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
							            </div>
							        </div>
							    </li>
							</c:forEach>    
		
		                   </ul>
		                 </li>
		                
		               </ul>
		             </li>        	
					<!--/알림 -->
		        	
		            <li class="nav-item navbar-dropdown dropdown-user dropdown">
		                <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);"
		                    data-bs-toggle="dropdown">
		                    <div class="avatar avatar-online">
		                        <c:choose>
									<c:when test="${not empty principal.realUser.empProfileNm and principal.realUser.empProfileNm != '0'}">
									<c:url value='/files/${principal.realUser.empProfileNm}' var="fileUrl"/>
										<img src="${fileUrl }" alt="" class="w-px-40 h-px-40 rounded-circle"/>
									</c:when>
									<c:otherwise>
										<img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
									</c:otherwise>
								</c:choose>
		                    </div>
		                </a>
		                <ul class="dropdown-menu dropdown-menu-end">
		                    <li>
		                        <a class="dropdown-item" href="#">
		                            <div class="d-flex">
		                                <div class="flex-shrink-0 me-3">
		                                    <div class="avatar avatar-online">
		                                    	<c:choose>
													<c:when test="${not empty principal.realUser.empProfileNm and principal.realUser.empProfileNm != '0'}">
													<c:url value='/files/${principal.realUser.empProfileNm}' var="fileUrl"/>
														<img src="${fileUrl }" alt="" class="w-px-40 h-px-40 rounded-circle"/>
													</c:when>
													<c:otherwise>
								                		<img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
													</c:otherwise>
												</c:choose>
		                                    </div>
		                                </div>
		                                <div class="flex-grow-1">
		                                     <h6 class="mb-0">${principal.realUser.empNm}</h6>
		                                    <small class="text-muted">직원</small>
		                                </div>
		                            </div>
		                        </a>
		                    </li>
		                    <li>
		                        <div class="dropdown-divider my-1"></div>
		                    </li>
		                    <li>
		                        <a class="dropdown-item" href="${cPath }/gw/login/logout.do">
		                            <i class="bx bx-power-off bx-md me-3"></i><span>Log Out</span>
		                        </a>
		                    </li>
		                </ul>
		            </li>
		        </ul>
		    </div>
		</nav>
	</c:otherwise>
</c:choose>
<script defer type="text/javascript" src="${cPath}/resources/js/app/hjadr/alarm.js"></script>