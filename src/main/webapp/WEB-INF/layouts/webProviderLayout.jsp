<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" scope="application"/>

<!doctype html>

<html lang="en" class="light-style layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="${cPath}/resources/webProvider/assets/" data-template="horizontal-menu-template-no-customizer-starter" data-style="light">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Connent</title>

    <meta name="description" content="" />
    
    <tiles:insertAttribute name="preScript" />
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
    <div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
        <div class="layout-container">
    				<tiles:insertAttribute name="header" />

		            <!-- Content -->
					<tiles:insertAttribute name="contentPage" />
		            <!--/ Content -->
		
		            <!-- Footer -->
		            <footer class="content-footer footer bg-footer-theme">
		            	
						<tiles:insertAttribute name="footer" />
		                
		            </footer>
		            <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!--/ Content wrapper -->
            </div>

            <!--/ Layout container -->
        </div>
    </div>


    <div class="layout-overlay layout-menu-toggle"></div>
    <div class="drag-target"></div>

            	
	<tiles:insertAttribute name="postScript" />
    <tiles:insertAttribute name="customScript"/>

</body>

</html>