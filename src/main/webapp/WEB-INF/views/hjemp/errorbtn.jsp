<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 여기에 오류 문의 글쓰는거 연결 해주기 -->
	<c:url value="#" var="errorURL">
	</c:url>
	<a href="${errorURL }">오류문의</a>
	
	여기에 필요한 로직은 
	우선 1. 오류문의에서 세션을 확인하는 코드가 필요함. 
	예를 들면 이런 코드임
	<%--
    Boolean isAuthenticated = (Boolean) session.getAttribute("isAuthenticated");
    if (isAuthenticated == null || !isAuthenticated) {
        response.sendRedirect("login.jsp?redirectUrl=error-inquiry.jsp");
        return;
    }
	--%>
	
	이후 로그인 페이지에서 로직을 처리할 때 
	
        if (isAuthenticated) {
            request.getSession().setAttribute("isAuthenticated", true);
            if (redirectUrl != null && !redirectUrl.isEmpty()) {
                response.sendRedirect(redirectUrl);
            } else {
                response.sendRedirect("main.jsp"); // 기본적으로 메인 페이지로 리디렉션
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
        
        이러한 과정을 통해 redirectUrl의 여부를 따져보고 거기로 리다이렉션 해주는 방식을 해야함.
</body>
</html>