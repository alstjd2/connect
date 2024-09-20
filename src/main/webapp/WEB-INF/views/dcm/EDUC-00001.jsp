<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 제목 및 내용 시작 -->
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
                <!-- 내용 시작 -->
                <table class="table">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <tbody>
                        <!-- 신청자 정보 -->
                        <tr>
                            <th rowspan="4">신청자 정보</th>
                            <th>팀 / 그룹</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>직위 / 성명</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>사 번</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <!-- 교육개요 -->
                        <tr>
                            <th rowspan="4">교육개요</th>
                            <th>교육명</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>교육기간</th>
                            <td><input class="form-control bg-white" type="text"> ~ <input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>교육비</th>
                            <td><input class="form-control bg-white" type="text"> 원</td>
                        </tr>
                        <tr>
                            <th>교육기관 및 장소</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <!-- 교육목적 -->
                        <tr>
                            <th>교육목적</th>
                            <td colspan="2"><textarea class="form-control"></textarea></td>
                        </tr>
                        <!-- 교육내용 -->
                        <tr>
                            <th>교육내용</th>
                            <td colspan="2"><textarea class="form-control"></textarea></td>
                        </tr>
                        <!-- 신청사항 -->
                        <tr>
                            <th rowspan="2">신청사항</th>
                            <th>교육기관 신청여부</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <th>교육비 납부여부</th>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 내용 끝 -->
            </td>
        </tr>
    </tbody>
</table>

