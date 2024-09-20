<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty Message }">
	<script>
		alert("${Message}");
	</script>
</c:if>

<!doctype html>

<html class="light-style layout-wide customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="${pageContext.request.contextPath}/resources/webProvider/assets/" data-template="horizontal-menu-template-no-customizer" data-style="light">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>CONNECT 그룹웨어 - 로그인</title>

    <meta name="description" content="CONNECT 그룹웨어 로그인페이지입니다." />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/webProvider/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/css/rtl/core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/css/rtl/theme-default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/typeahead-js/typeahead.css" />
    <!-- Vendor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/@form-validation/form-validation.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/css/pages/page-auth.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/js/helpers.js"></script>
<script src="${pageContext.request.contextPath}/resources/webProvider/assets/js/config.js"></script>
  </head>

  <body style="background-color: #fff">
    <!-- Content -->

    <div class="authentication-wrapper authentication-cover">
      <!-- Logo -->
      <a href="${pageContext.request.contextPath}/w/index.do" class="app-brand auth-cover-brand gap-2">
        <span class="app-brand-logo demo" style="max-width: 130px">
          <img src="${pageContext.request.contextPath}/resources/webProvider/assets/img/branding/logo.png" alt="logo이미지" class="w-100">
        </span>
      </a>
      <!-- /Logo -->
      <div class="authentication-inner row m-0">
        <!-- /Left Text -->
        <div class="d-none d-lg-flex col-lg-6 align-items-center p-5">
          <div class="w-100 d-flex justify-content-end">
            <img
              src="${pageContext.request.contextPath}/resources/images/login/index.gif"
              class="img-fluid"
              alt="Login image"
              width="550"/>
          </div>
        </div>
        <!-- /Left Text -->

        <!-- Login -->
        <div class="d-flex col-12 col-lg-6 align-items-center authentication-bg p-sm-12 p-6">
          <div class="w-px-400 mx-auto mt-12 pt-5">
            <h4 class="mb-1">커넥션 그룹웨어에 오신걸 환영합니다. 👋</h4>
            <p class="mb-6">사람과 사람을 연결하는 커넥트를 이용해보세요.</p>

            <form id="formAuthentication" class="mb-6" method="post">
              <div class="mb-6">
                <label for="email" class="form-label">ID</label>
                <input type="text" class="form-control" id="empId" name="empId" placeholder="아이디를 입력해주세요." autofocus>
              </div>
              <div class="mb-6 form-password-toggle">
                <label class="form-label" for="password">PW</label>
                <div class="input-group input-group-merge">
                    <input type="password" id="password" class="form-control" id="empPw" name="empPw" placeholder="비밀번호를 입력해주세요." aria-describedby="password" >
                  <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                </div>
              </div>
              <div class="my-8">
                <div class="d-flex justify-content-between">
                  <div class="form-check mb-0 ms-2">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> 아이디 기억하기 </label>
                  </div>
                </div>
              </div>
              <button class="btn btn-primary d-grid w-100">로그인 하기</button>
            </form>

            <p class="text-center">
              <span>커넥트?</span>
              <a href="${pageContext.request.contextPath}/w/index.do">
                <span>커넥트 웹사이트로 이동</span>
              </a>
            </p>
            <div class="d-flex flex-wrap border-top pt-3">
				<form method="post">
		        	<input type="hidden" name="empId" value="A001" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark" type="submit">HDC 관리자</button>
		        </form>
				<form method="post">
		        	<input type="hidden" name="empId" value="A041" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark" type="submit">HDC 김민준</button>
		        </form>
		        <form method="post">
		        	<input type="hidden" name="empId" value="A029" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark" type="submit">HDC 이원두</button>
		        </form>
<!-- 		        <form method="post">
		        	<input type="hidden" name="empId" value="A050" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark" type="submit">A회사 직원3</button>
		        </form> -->
		        <form method="post">
		        	<input type="hidden" name="empId" value="B001" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark" type="submit">한화이글스 관리자</button>
		        </form>
		        <form method="post">
		        	<input type="hidden" name="empId" value="B002" />
		        	<input type="hidden" name="empPw" value="java" />
		        	<button class="btn btn-text-dark wow fadeInUp" type="submit">한화이글스 김경문</button>
		        </form>
	        </div>
          </div>
        </div>
        <!-- /Login -->
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/@form-validation/popular.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/vendor/libs/@form-validation/auto-focus.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/webProvider/assets/js/pages-auth.js"></script>
  </body>
</html>
