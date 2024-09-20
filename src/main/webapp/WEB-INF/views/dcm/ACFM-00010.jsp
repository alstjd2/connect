<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table">
    <tbody>
        <tr>
            <th>종류</th>
            <td colspan="2">
                <select class="form-select bg-white">
                    <option selected="selected">택배 신청서</option>
                    <option>퀵 신청서</option>
                </select>
            </td>
            <th>발송목적</th>
            <td colspan="2">
                <input class="form-control bg-white" type="text">
            </td>
        </tr>
        <tr>
            <th>발송날짜</th>
            <td colspan="2">
                <input class="form-control bg-white" type="date">
            </td>
            <th>발송시간(예정)</th>
            <td colspan="2">
                <input class="form-control bg-white" type="time">
            </td>
        </tr>
        <tr>
            <th>수신처</th>
            <td>
                <input class="form-control bg-white" type="text">
            </td>
            <th>수신자명</th>
            <td>
                <input class="form-control bg-white" type="text">
            </td>
            <th>수신자 전화번호</th>
            <td>
                <input class="form-control bg-white" type="text">
            </td>
        </tr>
        <tr>
            <th>운송업체</th>
            <td>
                <input class="form-control bg-white" type="text">
            </td>
            <th>결재방법</th>
            <td>
                <input class="form-control bg-white" type="text">
            </td>
            <th>결재금액</th>
            <td>
                <input class="form-control bg-white" type="number">
            </td>
        </tr>
         <tr>
             <td colspan="6">* 급하게 받아야 할 물품의 경우 신청서 제출 후 담당자와 꼭 확인하시기 바랍니다.</td>
         </tr>
    </tbody>
</table>