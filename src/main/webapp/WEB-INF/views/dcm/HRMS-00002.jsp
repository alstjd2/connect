<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Application Details Section -->
<table class="table">
    <colgroup>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>내용</th>
            <td><textarea class="form-control" placeholder="내용"></textarea></td>
        </tr>
        <tr>
            <th>본인과의 관계</th>
            <td><input class="form-control bg-white" type="text" placeholder="본인과의 관계"></td>
        </tr>
        <tr>
            <th>발생년월일</th>
            <td><input class="form-control bg-white" type="text" placeholder="발생년월일"></td>
        </tr>
        <tr>
            <th>장소</th>
            <td><input class="form-control bg-white" type="text" placeholder="장소"></td>
        </tr>
        <tr>
            <th>휴가기간</th>
            <td>
                <input class="form-control bg-white" type="text" placeholder="시작일"> ~ 
                <input class="form-control bg-white" type="text" placeholder="종료일">
            </td>
        </tr>
        <tr>
            <th>금액</th>
            <td><input class="form-control bg-white" type="text" placeholder="금액"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                위와 같은 사유로 경조금을 신청합니다.
            </td>
        </tr>
        <!-- Optional Signature Section -->
        <!--
        <tr>
            <td colspan="2">
                년월일
                신청인 (서명)
            </td>
        </tr>
        -->
    </tbody>
</table>

