<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<security:authorize access="isAuthenticated()">
			<security:authentication property="principal" var="principal" />
			<security:authentication property="authorities" var="authorities" />
</security:authorize>

<!-- Favicon -->

<c:choose>
	<c:when test="${not empty company.comFavicon and company.comFavicon != '0'}">
		<c:url value='/files/${company.atchFile.fileDetails[0].comFaviconStreFileNm}' var="fileUrl2"/>
			<link rel="icon" type="image/x-icon" href="${fileUrl2 }" />						
	</c:when>
	<c:otherwise>
		<link rel="icon" type="image/x-icon" href="${cPath}/resources/groupwareMember/assets/img/favicon/favicon.ico" />				
	</c:otherwise>
</c:choose>
<%-- <c:choose> --%>
<%-- 	<c:when test="${not empty principal.realUser.company.comFavicon and principal.realUser.company.comFavicon != '0'}"> --%>
<%-- 		<c:url value='/files/${principal.realUser.company.atchFile.fileDetails[0].comFaviconStreFileNm}' var="fileUrl2"/> --%>
<%-- 			<link rel="icon" type="image/x-icon" href="${fileUrl2 }" />						 --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 		<link rel="icon" type="image/x-icon" href="${cPath}/resources/groupwareMember/assets/img/favicon/favicon.ico" />				 --%>
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>


<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/css/font.css" />

<!-- Font-icon -->
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<c:choose>
	<c:when test="${not empty company.comOg and company.comOg eq 1}">		
	    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/core.css"/>
	    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/theme-default.css"/>
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/core.css" />
		<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/theme-default.css"  />
	</c:otherwise>
</c:choose>


<style> :root { --color-main: ${ company.comCorno }; } </style>
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/css/connect.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/jkanban/jkanban.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/select2/select2.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/tagify/tagify.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/flatpickr/flatpickr.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/quill/typography.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/quill/katex.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/quill/editor.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/apex-charts/apex-charts.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/jstree/jstree.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/@form-validation/form-validation.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/sweetalert2/sweetalert2.css" />

<!-- Page CSS -->
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-invoice.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-logistics-dashboard.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-addr.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-email.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-chat.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-calendar.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/app-kanban.css" />

<!-- Helpers -->
<script src="${cPath}/resources/groupwareMember/assets/vendor/js/helpers.js"></script>

<script src="${cPath}/resources/groupwareMember/assets/vendor/js/template-customizer.js"></script>

<script src="${cPath}/resources/groupwareMember/assets/js/config.js"></script>