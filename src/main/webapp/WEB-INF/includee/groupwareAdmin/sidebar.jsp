<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
	if (originalUri == null) {
	    originalUri = request.getRequestURI(); // fallback if not forwarded
	}
%>

<!-- Menu -->
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="${cPath }/gw/adminPage.do" class="app-brand-link">
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
        <li class="menu-item <%= originalUri.contains("/company/") ? "active" : "" %>">
            <a href="${cPath}/gw/company/companyInfoUpdate.do" class="menu-link">
                <i class='menu-icon tf-icons bx bx-buildings'></i>
                <div class="text-truncate" data-i18n="기업관리">기업관리</div>
            </a>
        </li>
        <li class="menu-item <%= originalUri.contains("/organization/") || originalUri.contains("/adminEmployee/") || originalUri.contains("/adminPosition/") ? "active open" : "" %>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-group'></i>
                <div class="text-truncate" data-i18n="인사관리">인사관리</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item <%= originalUri.contains("/organization/") ? "active" : "" %>">
                    <a href="${cPath}/gw/organization/adminOrganization.do" class="menu-link">
                        <div class="text-truncate" data-i18n="조직 관리">조직관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/adminEmployee/") ? "active" : "" %>">
                    <a href="${cPath}/gw/adminEmployee/adminEmployeeList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="직원 관리">직원관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/adminPosition/") ? "active" : "" %>">
                    <a href="${cPath}/gw/adminPosition/list.do" class="menu-link">
                        <div class="text-truncate" data-i18n="직급직책 관리">직급직책 관리</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menu-item <%= originalUri.contains("/attendance/") || originalUri.contains("/application/") || originalUri.contains("/vacation/") ? "active open" : "" %>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-transfer-alt'></i>
                <div class="text-truncate" data-i18n="근태관리">근태관리</div>
            </a>
            <ul class="menu-sub">
                 <li class="menu-item <%= originalUri.contains("/vacation/") ? "active" : "" %>">
                    <a href="${cPath }/gw/vacation/vacationList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="부재 항목 관리">부재 항목 관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/application/") ? "active" : "" %>">
                    <a href="${cPath }/gw/application/vacation.do"class="menu-link">
                        <div class="text-truncate" data-i18n="부재 신청 현황">부재 신청 현황</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/attendance/") ? "active" : "" %>">
                    <a href="${cPath }/gw/attendance/attendanceList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="근태 시간 현황">근태 시간 현황</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menu-item <%= originalUri.contains("/document/") ? "active open" : "" %>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-file'></i>
                <div class="text-truncate" data-i18n="문서관리">문서관리</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item <%= originalUri.contains("/document/documentNumber.do") ? "active" : "" %>">
                    <a href="${cPath }/gw/document/documentNumber.do" class="menu-link">
                        <div class="text-truncate" data-i18n="문서 번호 관리">문서 번호 관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/document/list.do") || originalUri.contains("/document/detail.do") ? "active" : "" %>">
                    <a href="${cPath }/gw/document/list.do" class="menu-link">
                        <div class="text-truncate" data-i18n="결재 문서 현황">결재 문서 현황</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menu-item <%= originalUri.contains("/todoList/") || originalUri.contains("/room/") || originalUri.contains("/board/") || originalUri.contains("/survey/") ? "active open" : "" %>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-customize'></i>
                <div class="text-truncate" data-i18n="서비스관리">서비스관리</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item <%= originalUri.contains("/todoList/") ? "active" : "" %>">
                    <a href="${cPath }/gw/todoList/comTodoList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="기업일정 관리">기업일정 관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/room/roomList.do") ? "active" : "" %>">
                    <a href="${cPath }/gw/room/roomList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="회의실 관리">회의실 관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/room/comRoomReservationList.do") ? "active" : "" %>">
                    <a href="${cPath }/gw/room/comRoomReservationList.do" class="menu-link">
                        <div class="text-truncate" data-i18n="회의실 예약조회">회의실 예약조회</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/board/") ? "active" : "" %>">
                    <a href="${cPath }/gw/board/gubun.do" class="menu-link">
                        <div class="text-truncate" data-i18n="게시판 관리">게시판 관리</div>
                    </a>
                </li>
                <li class="menu-item <%= originalUri.contains("/survey/") ? "active" : "" %>">
                    <a href="${cPath}/gw/survey/list.do" class="menu-link">
                        <div class="text-truncate" data-i18n="설문 관리">설문 관리</div>
                    </a>
                </li>
            </ul>
        </li>
<!--         <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-doughnut-chart'></i>
                <div class="text-truncate" data-i18n="사용통계">사용통계</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="statistics.html" class="menu-link">
                        <div class="text-truncate" data-i18n="드라이브 사용용량">드라이브 사용용량</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="statistics.html" class="menu-link">
                        <div class="text-truncate" data-i18n="메시지 관리">구성원 증감 추세</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="statistics.html" class="menu-link">
                        <div class="text-truncate" data-i18n="보낸 메일 수">보낸 메일 수</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="statistics.html" class="menu-link">
                        <div class="text-truncate" data-i18n="게시판 사용현황">게시판 사용현황</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="statistics.html" class="menu-link">
                        <div class="text-truncate" data-i18n="회의 진행 통계">회의 진행 통계</div>
                    </a>
                </li>
            </ul>
        </li> -->
    </ul>

    <div class="p-5">
	    <a href="${cPath }/gw/login/logout.do" class="btn btn-text-dark w-100">
	          <span class="tf-icons bx bx-log-out bx-18px"></span><b class="text-truncate"> 로그아웃</b>
	    </a>
	</div>
</aside>

<script defer type="text/javascript" src="${cPath}/resources/js/app/hjadr/alarmsocket.js"></script>