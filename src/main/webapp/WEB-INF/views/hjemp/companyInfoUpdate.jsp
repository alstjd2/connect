<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Form</title>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("comAdr").value = data.roadAddress;
                }
            }).open();
        }
    </script>
</head>
<body>
    <form:form method="post" modelAttribute="company">
        <form:hidden path="comNo" />
        <table class="table">
            <tr>
                <th>회사명</th>
                <td>
                    <form:input type="text" path="comNm" class="form-control" required="required" />
                    <form:errors path="comNm" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <th>사업자명</th>
                <td>
                    <form:input type="text" path="comBsnm" class="form-control" />
                    <form:errors path="comBsnm" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <th>사업자등록번호</th>
                <td>
                    <form:input type="text" path="comBsno" class="form-control" />
                    <form:errors path="comBsno" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td>
                    <form:input type="text" path="comZipcode" id="comZipcode" class="form-control" readonly="readonly" />
                    <button type="button" onclick="execDaumPostcode()">검색</button>
                    <form:errors path="comZipcode" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <form:input type="text" path="comAdr" id="comAdr" class="form-control" readonly="readonly" />
                    <button type="button" onclick="execDaumPostcode()">검색</button>
                    <form:errors path="comAdr" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <th>연락처</th>
                <td>
                    <form:input type="text" path="comTel" class="form-control" />
                    <form:errors path="comTel" cssClass="text-danger" element="span" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">전송</button>
                    <button type="reset" class="btn btn-danger">취소</button>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>
