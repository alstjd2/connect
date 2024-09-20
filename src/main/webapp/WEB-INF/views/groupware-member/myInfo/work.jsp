<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <table>
        <thead>
            <tr>
                <th>요일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="date" items="${dates}">
                <tr>
                    <td>${date.dayOfWeek}(${date.monthValue}/ ${date.dayOfMonth}일)</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
