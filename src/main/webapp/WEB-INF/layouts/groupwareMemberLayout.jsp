<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" scope="application"/>

<!doctype html>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
<html 
	lang="ko" 
	<c:choose>
		<c:when test="${not empty company.comOg and company.comOg eq 1}">
			class="light-style layout-menu-fixed layout-compact"
			data-template="horizontal-menu-template-no-customizer-starter"
		</c:when>
		<c:otherwise>
			class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" 
			data-template="vertical-menu-template-starter"
		</c:otherwise>
	</c:choose>
	dir="ltr"
    data-theme="theme-default" 
    data-assets-path="${cPath}/resources/groupwareMember/assets/" 
    data-style="light"
    data-themes="${company.comWlogo}"
    >

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>${company.comNm}</title>
    <meta name="description" content="" />

    <tiles:insertAttribute name="preScript"/>
    <tiles:insertAttribute name="customCss"/>
</head>

<body data-context-path="${cPath}" 
	<c:if test="${not empty company.comOg and company.comOg eq 1}">
		class="py-10 mt-10"
	</c:if>
>

    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <!-- Layout wrapper -->
	<c:choose>
		<c:when test="${not empty company.comOg and company.comOg eq 1}">
			<div class='layout-wrapper layout-navbar-full layout-horizontal layout-without-menu '>
		</c:when>
		<c:otherwise>
			<div class='layout-wrapper layout-content-navbar'>
		</c:otherwise>
	</c:choose>
        <div class="layout-container">
    		<tiles:insertAttribute name="sidebar"/>
            <div class="layout-page">
                <tiles:insertAttribute name="header"/>
                <tiles:insertAttribute name="contentPage" />
<!--                 <div class="content-backdrop fade"></div> -->
            </div>
        </div>
        <div class="layout-overlay layout-menu-toggle"></div>
        <div class="drag-target"></div>
    </div>
    <tiles:insertAttribute name="postScript"/>
    <tiles:insertAttribute name="customScript"/>
</body>

</html>
