<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<table class="table">
		<c:if test="${not empty company }">
			<tr>
				<td>기업(단체)명</td>
				<td>${company.comNm }</td>
			</tr>
			<tr>
				<td>대표명</td>
				<td>${company.comBsnm }</td>
			<tr>
			<tr>
				<td>사업자번호</td>
				<td>${company.comBsno }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${company.comAdr }</td>
			</tr>
			<tr>
				<td>기업(단체) 번호</td>
				<td>${company.comTel }</td>
			</tr>
			<tr>
				<td>매출규모</td>
				<td><fmt:formatNumber value="${company.comSapr }" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${company.comDate }</td>
			</tr>
		</c:if>
		<c:if test="${empty company }">
			<tr>
				<td colspan="7">기업(단체) 정보 없음.</td>
			</tr>
		</c:if>

	</table>
	