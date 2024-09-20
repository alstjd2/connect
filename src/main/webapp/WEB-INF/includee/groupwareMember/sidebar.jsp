<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<c:choose>
	<c:when test="${not empty company.comOg and company.comOg eq 1}"></c:when>
	<c:otherwise>
		<!-- Menu -->
		<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
		    <div class="app-brand demo">
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
		
		        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
		            <i class="bx bx-chevron-left bx-sm d-flex align-items-center justify-content-center"></i>
		        </a>
		    </div>
		
		    <div class="menu-inner-shadow"></div>
		
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
		                        <div class="text-truncate" data-i18n="정보수정">정보수정</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/myInfo/vacation.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/myInfo/vacation.do"class="menu-link">
		                        <div class="text-truncate" data-i18n="휴가관리">휴가관리</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/myInfo/empattendanceList.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/myInfo/empattendanceList.do" class="menu-link">
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
		                        <div class="text-truncate" data-i18n="부서(조직) 휴가관리">부서(조직) 휴가관리</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/department/attendance.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/department/attendance.do"  class="menu-link">
		                        <div class="text-truncate" data-i18n="부서(조직) 근태현황">부서(조직) 근태현황</div>
		                    </a>
		                </li>
		            </ul>
		        </li>
		        <li class="menu-item <%= originalUri.contains("/todoList/") || originalUri.contains("/room/") ? "active open" : "" %>">
		            <a href="javascript:void(0);" class="menu-link menu-toggle">
		                <i class='menu-icon tf-icons bx bx-calendar-check'></i>
		                <div class="text-truncate" data-i18n="일정관리">일정관리</div>
		            </a>
		            <ul class="menu-sub">
		                <li class="menu-item <%= originalUri.contains("/todoList/empTodoList.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/todoList/empTodoList.do" class="menu-link">
		                        <div class="text-truncate" data-i18n="개인일정">개인일정</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/todoList/calendar.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/todoList/calendar.do" class="menu-link">
		                        <div class="text-truncate" data-i18n="캘린더">캘린더</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/room/roomReservation.do") ? "active" : "" %>">
		                    <a href="${cPath }/gw/room/roomReservation.do" class="menu-link">
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
		                        <div class="text-truncate" data-i18n="문서생성">문서생성</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/list") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/list.do" class="menu-link">
		                        <div class="  text-truncate" data-i18n="결재문서">결재문서</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/reference") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/reference.do" class="menu-link">
		                        <div class="text-truncate" data-i18n="참조문서">참조문서</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/document/receive") ? "active" : "" %>">
		                    <a href="${cPath}/gw/document/receive.do" class="menu-link">
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
		                        <div class="text-truncate" data-i18n="만든 설문">만든 설문</div>
		                    </a>
		                </li>
		                <li class="menu-item <%= originalUri.contains("/survey/answer") ? "active" : "" %>">
		                    <a href="${cPath}/gw/survey/answer/myList.do" class="menu-link">
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
		    </ul>
		</aside>
	</c:otherwise>
</c:choose>



