<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table">
    <tbody>
        <tr>
            <th>수령방식</th>
            <td>
                <select class="form-select bg-white">
                    <option selected="selected">수령(오프라인)</option>
                    <option>미수령(온라인)</option>
                </select>
            </td>
            <th>신청매수</th>
            <td><span class="d-flex align-items-center gap-3"><input class="form-control bg-white" type="number"> 매</span></td>
            <th>사용금액</th>
            <td><span class="d-flex align-items-center gap-3"><input class="form-control bg-white" type="number"> 원</span></td>
        </tr>
        <tr>
            <th>사용처</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>사용목적</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>사용일자</th>
            <td><input class="form-control bg-white" type="date"></td>
        </tr>
        <tr>
            <th>카드종류</th>
            <td ><input class="form-control bg-white" type="text"></td>
            <th>카드번호</th>
            <td ><input class="form-control bg-white" type="text"></td>
            <th>반납예정일</th>
            <td ><input class="form-control bg-white" type="date"></td>
        </tr>
    </tbody>
</table>

