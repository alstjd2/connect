<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
	if (originalUri == null) {
	    originalUri = request.getRequestURI(); // fallback if not forwarded
	}
	String surverType = originalUri.contains("create") ? "create" : "answer"; 
%>
<div class="container-xxl flex-grow-1 container-p-y dcmPage" id="surveyBody" data-survey-type="<%=surverType%>">
	<div class="pt-5 surber">
		<div >
			<table id="example" class="d-none" style="width:100%"></table>
		</div>
	</div>
</div>

<script defer src="${cPath}/resources/groupwareMember/assets/js/surver-list.js"></script>