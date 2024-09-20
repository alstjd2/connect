<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form method="post" modelAttribute="employee" enctype="multipart/form-data">
	<form:hidden path="comNo" />
	<form:hidden path="empNo" />
	<table class="table">
	<c:if test="${not empty employee}">
	    <p>${employee.empNm}</p>
	</c:if>
	<c:if test="${not empty employee}">
	    <p>Employee exists: ${employee.empNm}</p>
	    <p>File Name: ${employee.atchFile.atchFileId}</p>
	    <p>File Name: ${employee.atchFile.useAt}</p>
	    <p>File Name: ${employee.atchFile.fileDetails[0]}</p>
	    <p>File Name: ${employee.atchFile.fileDetails[0].streFileNm}</p>
	    <p>File Name: ${employee.atchFile.fileDetails[0].streFileNm}</p>
	    <p>File URL: <c:url value='/resources/images/${employee.atchFile.fileDetails[0].streFileNm}' var="imageUrl" />${imageUrl}</p>
	</c:if>
	
	

		<tr>
		
			<th>프로필사진</th>
			<td>
			
<!-- 				기존 프로필 사진이 있으면 표시 -->
				<c:if test="${not empty employee.empProfile}">
				   <img src="<c:url value='/resources/images/${employee.atchFile.fileDetails[0].streFileNm}' />" alt="프로필 사진" width="150" height="150"/>
				   
				</c:if>
				
				
				<!-- 새로운 프로필 사진 업로드 -->
				<input type="file" name="atchFile.fileDetails[0].uploadFile" class="form-control" />
				
<%-- 				<form:errors path="" cssClass="text-danger" element="span" /> --%>
			</td>
		
		
			
		</tr>
		<tr>
			<th>이름dd</th>
			<td><form:input type="text" path="empNm" class="form-control"
					required="required" readonly="true"  /> <form:errors path="empNm"
					cssClass="text-danger" element="span" /></td>
		</tr>

		<tr>
			<th>부서</th>
			<td><form:input type="number" path="empDep" class="form-control"
					readonly="true"  /> <form:errors path="empDep" cssClass="text-danger"
					element="span" /></td>
		</tr>
		<tr>
			<th>직급</th>
			<td><form:input type="number" path="empPos" class="form-control"
					readonly="true"  /> <form:errors path="empPos" cssClass="text-danger"
					element="span" /></td>
		</tr>
		<tr>
			<th>직책</th>
			<td><form:input type="number" path="empOnepos"
					class="form-control" readonly="true"  /> <form:errors path="empOnepos"
					cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>사내번호</th>
			<td><form:input type="text" path="empComtel"
					class="form-control" /> <form:errors path="empComtel"
					cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><form:input type="text" path="empTel" class="form-control" />
				<form:errors path="empTel" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><form:input type="text" path="empCommail"
					class="form-control" required="required" readonly="true"  /> <form:errors
					path="empCommail" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>개인이메일</th>
			<td><form:input type="text" path="empMail" class="form-control" />
				<form:errors path="empMail" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><form:input type="date" path="empBir" class="form-control" />
				<form:errors path="empBir" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><form:input type="date" path="empJoindate"
					class="form-control" readonly="true"  /> <form:errors path="empJoindate"
					cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">수정</button>
				<button type="reset" class="btn btn-danger">비밀번호변경</button>
			</td>
		</tr>

	</table>
</form:form>

