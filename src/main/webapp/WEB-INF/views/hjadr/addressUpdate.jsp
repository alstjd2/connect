<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form method="post" modelAttribute="address">
	<form:hidden path="adrNo" />
	<form:hidden path="empNo" />
	<table>
		<tr>
			<th>이름</th>
			<td><form:input type="text" path="adrNm" class="form-control"
					required="required" />
				<form:errors path="adrNm" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>직책</th>
			<td><form:input type="text" path="adrOnepos"
					class="form-control" />
				<form:errors path="adrOnepos" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>직급</th>
			<td><form:input type="text" path="adrPos" class="form-control" />
				<form:errors path="adrPos" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>부서</th>
			<td><form:input type="text" path="adrDep" class="form-control" />
				<form:errors path="adrDep" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>소속</th>
			<td><form:input type="text" path="adrAff" class="form-control" />
				<form:errors path="adrAff" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><form:input type="text" path="adrMail" class="form-control" />
				<form:errors path="adrMail" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><form:input type="text" path="adrTel" class="form-control"
					required="required" />
				<form:errors path="adrTel" cssClass="text-danger" element="span" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">전송</button>
			</td>
		</tr>
	</table>
</form:form>