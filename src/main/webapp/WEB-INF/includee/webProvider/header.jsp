<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<% 
	String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
	if (originalUri == null) {
	    originalUri = request.getRequestURI(); // fallback if not forwarded
	}
%>

<security:authentication property="principal" var="principal"/>
<security:authentication property="authorities" var="authorities"/>


<nav class="layout-navbar navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">
    <div class="container-xxl">
        <div class="navbar-brand app-brand demo d-none d-xl-flex py-0 me-4">
            <a href="${cPath }/w/membership/membershipListPage.do" class="app-brand-link gap-2">
                <span class="app-brand-logo demo">
                    <img src="${cPath}/resources/webProvider/assets/img/branding/logo.png" alt="logo이미지">
                </span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-xl-none">
                <i class="d-flex align-items-center justify-content-center"></i>
            </a>
        </div>

        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="bx bx-menu bx-md"></i>
            </a>
        </div>

        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                    <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);"
                        data-bs-toggle="dropdown">
                        <div class="avatar avatar-online">
                            <img src="${cPath}/resources/webProvider/assets/img/avatars/1.png" alt
                                class="w-px-40 h-auto rounded-circle" />
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="#">
                                <div class="d-flex">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="avatar avatar-online">
                                            <img src="${cPath}/resources/webProvider/assets/img/avatars/1.png" alt
                                                class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-0">${principal.realUser.memNm}</h6>
                                        <small class="text-muted">${authorities }</small>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider my-1"></div>
                        </li>
<%--                         <li>
                            <a class="dropdown-item" href="#">
                                <i class="bx bx-user bx-md me-3"></i><span>My Profile</span>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"> <i
                                    class="bx bx-cog bx-md me-3"></i><span>Settings</span> </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="${cPath }/w/membership/listJsonData.do">
                                <span class="d-flex align-items-center align-middle">
                                    <i class="flex-shrink-0 bx bx-credit-card bx-md me-3"></i><span
                                        class="flex-grow-1 align-middle ms-1">Billing Plan</span>
                                    <span class="flex-shrink-0 badge rounded-pill bg-danger">4</span>
                                </span>
                            </a>
                        </li>
                        <li>
                            <div class="dropdown-divider my-1"></div>
                        </li> --%>
                        <li>
                            <a class="dropdown-item" href="${cPath }/w/login/logout.do">
                                <i class="bx bx-power-off bx-md me-3"></i><span>Log Out</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--/ User -->
            </ul>
        </div>
    </div>
</nav>

<!-- / Navbar -->

<!-- Layout container -->
<div class="layout-page">
    <!-- Content wrapper -->
    <div class="content-wrapper">
        <!-- Menu -->
        <aside id="layout-menu"
            class="layout-menu-horizontal menu-horizontal menu bg-menu-theme flex-grow-0">
            <div class="container-xxl d-flex h-100">
                <ul class="menu-inner py-1">
                    <!-- Page -->
                    <li class="menu-item  <%= originalUri.endsWith("/membershipListPage.do") ? "active" : "" %>">
                        <a href="${cPath }/w/membership/membershipListPage.do" class="menu-link">
                            <i class='menu-icon tf-icons bx bx-user'></i>
                            <div data-i18n="회원관리">회원관리</div>
                        </a>
                    </li>
                    <li class="menu-item  <%= originalUri.endsWith("/salesRefund/sales.do") || originalUri.endsWith("/saleDetail.do") ? "active" : "" %>">
<!--                         <a href="javascript:void(0)" class="menu-link menu-toggle"> -->
                        <a href="${cPath }/w/salesRefund/sales.do" class="menu-link ">
                            <i class='menu-icon tf-icons bx bx-line-chart'></i>
                            <div data-i18n="매출·환불관리">매출·환불관리</div>
                        </a>
<!--                         <ul class="menu-sub"> -->
<!--                             <li class="menu-item "> -->
<%--                                 <a href="${cPath }/w/salesRefund/sales" class="menu-link"> --%>
<!--                                     <i class='menu-icon tf-icons bx bx-trending-up'></i> -->
<!--                                     <div data-i18n="매출관리">매출관리</div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li class="menu-item"> -->
<%--                                 <a href="${cPath }/w/salesRefund/refund" class="menu-link" target="_blank"> --%>
<!--                                     <i class='menu-icon tf-icons bx bx-trending-down'></i> -->
<!--                                     <div data-i18n="환불관리">환불관리</div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                         </ul> -->
                    </li>
                    <li class="menu-item <%= originalUri.contains("/promotion/") || originalUri.contains("/notice/") || originalUri.contains("/eventWrite/") ? "active" : "" %>">
                        <a href="javascript:void(0)" class="menu-link menu-toggle">
                            <i class='menu-icon tf-icons bx bx-news'></i>
                            <div data-i18n="참고자료관리">참고자료관리</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item <%= originalUri.contains("/promotion/") || originalUri.contains("/eventWrite/") ? "active" : "" %>">
                                <a href="${cPath }/w/promotion/list.do" class="menu-link">
                                    <i class='menu-icon tf-icons bx bx-news'></i>
                                    <div data-i18n="이벤트">이벤트</div>
                                </a>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/notice/") ? "active" : "" %>">
                                <a href="${cPath }/w/notice/list.do" class="menu-link">
                                    <i class='menu-icon tf-icons bx bx-news'></i>
                                    <div data-i18n="공지사항">공지사항</div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%-- <li class="menu-item <%= originalUri.contains("/support/") ? "active" : "" %>">
                        <a href="javascript:void(0)" class="menu-link menu-toggle">
                            <i class='menu-icon tf-icons bx bx-book-open'></i>
                            <div data-i18n="지원관리">지원관리</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item <%= originalUri.contains("/support/guide") ? "active" : "" %>">
                                <a href="javascript:void(0);" class="menu-link menu-toggle">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="가이드관리">가이드관리</div>
                                </a>
                                <ul class="menu-sub">
                                    <li class="menu-item <%= originalUri.contains("/support/guideService") ? "active" : "" %>">
                                        <a href="${cPath }/w/support/guideService.do" class="menu-link">
                                        <div data-i18n="사용자 가이드">사용자 가이드</div>
                                        </a>
                                    </li>
                                    <li class="menu-item <%= originalUri.contains("/support/guideAdmin") ? "active" : "" %>">
                                        <a href="${cPath }/w/support/guideAdmin.do" class="menu-link">
                                        <div data-i18n="관리자 가이드">관리자 가이드</div>
                                        </a>
                                    </li>
                                    <li class="menu-item <%= originalUri.contains("/support/guideRefund") ? "active" : "" %>">
                                        <a href="${cPath }/w/support/guideRefund.do" class="menu-link">
                                        <div data-i18n="환불 가이드">환불 가이드</div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/support/faq") ? "active" : "" %>">
                                <a href="${cPath }/w/support/faq.do" class="menu-link" >
                                    <i class='menu-icon tf-icons bx bx-file-blank'></i>
                                    <div data-i18n="FAQ관리">FAQ관리</div>
                                </a>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/support/supportPolicyPersonal") ? "active" : "" %>">
                                <a href="${cPath }/w/support/supportPolicyPersonal.do" class="menu-link" target="_blank">
                                    <i class='menu-icon tf-icons bx bx-file-blank'></i>
                                    <div data-i18n="개인정보처리방침">개인정보처리방침</div>
                                </a>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/support/supportPolicyUse") ? "active" : "" %>">
                                <a href="${cPath }/w/support/supportPolicyUse.do" class="menu-link" target="_blank">
                                    <i class='menu-icon tf-icons bx bx-file-blank'></i>
                                    <div data-i18n="이용약관">이용약관</div>
                                </a>
                            </li>
                        </ul>
                    </li> --%>
                    <li class="menu-item <%= originalUri.contains("/non/") || originalUri.contains("/early/") || originalUri.contains("/err/") ? "active" : "" %>">
                        <a href="javascript:void(0)" class="menu-link menu-toggle">
                            <i class='menu-icon tf-icons bx bx-support'></i>
                            <div data-i18n="지원문의관리">지원문의관리</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item <%= originalUri.contains("/non/") ? "active" : "" %>">
                                <a href="${cPath}/w/non/nonList.do" class="menu-link">
                                    <i class='menu-icon tf-icons bx bx-envelope'></i>
                                    <div data-i18n="비회원문의">비회원문의</div>
                                </a>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/early/") ? "active" : "" %>">
                                <a href="${cPath }/w/early/earlyList.do" class="menu-link">
                                    <i class='menu-icon tf-icons bx bx-phone-call' ></i>
                                    <div data-i18n="초기지원문의">초기지원문의</div>
                                </a>
                            </li>
                            <li class="menu-item <%= originalUri.contains("/err/") ? "active" : "" %>">
                                <a href="${cPath }/w/err/errList.do" class="menu-link">
                                    <i class='menu-icon tf-icons bx bx-bug' ></i>
                                    <div data-i18n="오류문의">오류문의</div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </aside>
        <!-- / Menu -->