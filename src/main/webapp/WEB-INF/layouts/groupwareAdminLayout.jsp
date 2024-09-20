<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath }" scope="application"/>

<!doctype html>

<html lang="ko" class="light-style layout-navbar-fixed layout-compact layout-menu-fixed" dir="ltr"
    data-theme="theme-default" data-assets-path="${cPath}/resources/groupwareAdmin/assets/" data-template="vertical-menu-template-starter"
    data-style="light">


<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>${company.comNm} - 관리자페이지</title>
    <meta name="description" content="" />
    
    <tiles:insertAttribute name="preScript"/>
    <tiles:insertAttribute name="customCss"/>

</head>

<body data-context-path="${cPath}">

    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div> 
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
			<tiles:insertAttribute name="sidebar"/>

            <div class="layout-page" style="padding-top: 30px !important;">
                <div class="content-wrapper">
	                <tiles:insertAttribute name="contentPage" />
                </div>
            </div>
        </div>
        <div class="layout-overlay layout-menu-toggle"></div>
        <div class="drag-target"></div>
    </div>
    
    <tiles:insertAttribute name="postScript"/>
    <tiles:insertAttribute name="customScript"/>
</body>

</html>