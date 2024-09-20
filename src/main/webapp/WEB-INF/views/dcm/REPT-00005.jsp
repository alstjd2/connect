<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Title and Content Section -->
<table class="table">
    <colgroup>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>제목</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <td colspan="2">
                <!-- Customer Information Table -->
                <table class="table">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th rowspan="3">고객정보</th>
                            <th>회원번호</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>고객명</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Claim Details Table -->
                <table class="table">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>클레임사유</th>
                            <td colspan="3"><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>상세내용</th>
                            <td colspan="3"><textarea class="form-control"></textarea></td>
                        </tr>
                        <tr>
                            <th rowspan="5">보상내역</th>
                            <th>항목</th>
                            <th>금액</th>
                            <th>비고</th>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>합계</th>
                            <td colspan="2"><input class="form-control bg-white" type="text"></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>

