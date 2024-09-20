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
		<c:url value='/files/${principal.realUser.company.atchFile.fileDetails[0].comFaviconStreFileNm}' var="fileUrl2"/>
			<link rel="icon" type="image/x-icon" href="${fileUrl2 }" />	
	</c:when>
	<c:otherwise>
		<link rel="icon" type="image/x-icon" href="${cPath}/resources/groupwareMember/assets/img/favicon/favicon.ico" />				
	</c:otherwise>
</c:choose>

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
    href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
    rel="stylesheet" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/css/font.css" />

<!-- Font-icon -->
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" type="text/css" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/rtl/core.css" />
<link rel="stylesheet" type="text/css" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/rtl/theme-default.css" />
<link rel="stylesheet" type="text/css" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/rtl/theme-semi-dark.css">
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/css/connect.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/flatpickr/flatpickr.css">
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/quill/katex.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/quill/editor.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/select2/select2.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/tagify/tagify.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/@form-validation/form-validation.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/sweetalert2/sweetalert2.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/apex-charts/apex-charts.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/libs/jstree/jstree.css" />


<!-- Page CSS -->
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/pages/app-invoice.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/pages/app-logistics-dashboard.css" />
<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/vendor/css/pages/app-email.css" />



<!-- Helpers -->
<script src="${cPath}/resources/groupwareAdmin/assets/vendor/js/helpers.js"></script>
<!--! 템플릿 커스터마이저 & 테마 구성 파일은 <head> 섹션의 핵심 스타일시트와 helper.js 뒤에 포함되어야 합니다 -->
<!--? 템플릿 커스터마이저: 커스터마이저 세트를 숨기려면 config.js에서 Customizer 값을 false로 표시합니다.  -->
<script src="${cPath}/resources/groupwareAdmin/assets/vendor/js/template-customizer.js"></script>
<!--? Config: 필수 테마 구성 파일에 글로벌 var & 기본 테마 옵션이 포함되어 있습니다. 이 파일에서 선호하는 테마 옵션을 설정하십시오  -->
<script src="${cPath}/resources/groupwareAdmin/assets/js/config.js"></script>
    
    
