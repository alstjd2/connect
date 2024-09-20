<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath }" scope="application"/>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Connect</title>
    <meta name="author" content="커넥트" />
    <meta name="keywords" content="커넥트,connect,그룹웨어,소통,협업,근태" />
    <meta name="description" content="커넥트는 편리함과 기술, 일하는 방식을 담은 통합 업무 플렛폼입니다. 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여보세요." />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- 모바일 노출내용 -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Connect" />
    <meta property="og:site_name" content="커넥트" />
    <meta property="og:description" content="커넥트는 편리함과 기술, 일하는 방식을 담은 통합 업무 플렛폼입니다. 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여보세요." />
    <meta property="og:keywords" content="" />
    <meta property="og:url" content="" />
    <meta property="og:image" content="" />
    <meta property="og:image:width" content="800" />
    <meta property="og:image:height" content="400" />

    <tiles:insertAttribute name="preCss"/>
    <tiles:insertAttribute name="customCss"/>

</head>

<c:if test="${not empty message }">
	<script>
	document.addEventListener("DOMContentLoaded", () => {
		function successSwal(msg){
			swal({
				title : msg,
				icon  : "success",
				closeOnClickOutside : false
				});
		}
		successSwal("${message}");
	});
	</script>
</c:if>

<body data-context-path="${cPath}">
	<div class="preloader">
	    <div class="preloader-inner">
	        <div class="preloader-icon">
	            <span></span>
	            <span></span>
	        </div>
	    </div>
	</div>
	<header class="header">
	    <tiles:insertAttribute name="header"/>
	</header>

	<tiles:insertAttribute name="contentPage" />

	<footer class="footer">
	    <tiles:insertAttribute name="footer"/>
	</footer>
	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover">
	    <i class="las la-angle-up"></i>
	</a>
    <tiles:insertAttribute name="postScript"/>
    <tiles:insertAttribute name="customScript"/>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</html>
