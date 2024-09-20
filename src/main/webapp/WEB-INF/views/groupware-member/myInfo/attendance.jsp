<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Locale"%>
<c:set value="${pageContext.request.userPrincipal }" var="authentication"/>
		${authentication.details }
		${pageContext.request.remoteAddr }

<div>
	<div style="font-size: xx-large;"
		class="container-xxl flex-grow-1 container-p-y" id="currentTime"></div>
	<form:form method="post" modelAttribute="att"
		action="${cPath }/gw/attendance/attendanceInsert.do"
		enctype="multipart/form-data">
		<input type="hidden" name="attIp" value="${pageContext.request.remoteAddr }">
		<button type="submit" class="btn btn-primary">
			<i class="bx bx-plus bx-16px me-2"></i> <span class="align-middle">출근</span>
		</button>
		<button type="submit" class="btn btn-primary">
			<i class="bx bx-plus bx-16px me-2"></i> <span class="align-middle">퇴근</span>
		</button>
	</form:form>

</div>


<script>
	function updateTime() {
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();

		// Format the time (optional)
		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;

		var currentTime = hours + ":" + minutes + ":" + seconds;

		// Update the element containing the time
		document.getElementById("currentTime").innerHTML = currentTime;
	}

	setInterval(updateTime, 1000); // Call updateTime every second
</script>