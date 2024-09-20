<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html
  lang="ko"
  class="light-style layout-wide customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${cPath}/resources/groupwareMember/assets/"
  data-template="vertical-menu-template-no-customizer"
  data-style="light">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Connect - erorr</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${cPath}/resources/groupwareMember/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"  rel="stylesheet" />
	<link rel="stylesheet" href="${cPath}/resources/groupwareAdmin/assets/css/font.css" />

    <!-- Icons -->
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/core.css" />
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/rtl/theme-default.css" />
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/libs/typeahead-js/typeahead.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${cPath}/resources/groupwareMember/assets/vendor/css/pages/page-misc.css" />

    <!-- Helpers -->
    <script src="${cPath}/resources/groupwareMember/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${cPath}/resources/groupwareMember/assets/js/config.js"></script>
  </head>

  <body class="bg-white">
    <!-- Content -->

    <!-- Error -->
    <div class="container-xxl container-p-y">
      <div class="misc-wrapper">
        <div class="mt-6">
          <img src="${cPath}/resources/images/find.gif" alt="page-misc-error-light" width="300"/>
        </div>
        <h1 class="mb-2 mx-2" style="line-height: 6rem; font-size: 6rem">유지보수 중!</h1>
        <h4 class="mb-2 mx-2">불편을 끼쳐 드려 죄송합니다.</h4>
        <p class="mb-6 mx-2">현재 페이지는 유지보수 중 입니다..</p>
        <a href="#" id="backButton" class="btn btn-info">뒤로가기</a>
      </div>
    </div>

    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/popper/popper.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/js/bootstrap.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${cPath}/resources/groupwareMember/assets/vendor/js/menu.js"></script>
	    <script>
        document.getElementById('backButton').addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            window.history.back(); // 브라우저의 히스토리에서 이전 페이지로 이동
        });
    </script>

  </body>
</html>