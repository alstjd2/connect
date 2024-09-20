<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 차량렌탈 신청서 시작-->
<table class="table">
    <colgroup>
        <col>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>제목</th>
            <td colspan="2"><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <td colspan="3">아래와 같이 차량렌탈을 신청합니다.</td>
        </tr>
        <tr>
            <th rowspan="2">신청인</th>
            <th>부서명</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th rowspan="4">신청내역</th>
            <th>신청기간</th>
            <td>
                <input class="form-control bg-white" type="text">
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분부터
                <input class="form-control bg-white" type="text">
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분까지
            </td>
        </tr>
        <tr>
            <th>신청사유</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>희망차종</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>기타</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
    </tbody>
</table>
<!-- 차량렌탈 신청서 끝-->
