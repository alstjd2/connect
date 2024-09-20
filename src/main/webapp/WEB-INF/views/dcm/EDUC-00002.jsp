<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 제목 -->
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
    </tbody>
</table>

<!-- 교육개요 -->
<table class="table">
    <colgroup>
        <col>
        <col>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th colspan="4">1. 교육개요</th>
        </tr>
        <tr>
            <th>교육목표</th>
            <td colspan="3"><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>교육과정</th>
            <td colspan="3"><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>교육기간</th>
            <td><input class="form-control bg-white" type="text"> ~ <input class="form-control bg-white" type="text"></td>
            <th>교육기관</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>전달교육일시</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>전달교육장소</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
    </tbody>
</table>

<!-- 교육내용 -->
<table class="table">
    <colgroup>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>2. 교육내용</th>
        </tr>
        <tr>
            <td>
            	<span id="editor">에디터(본문)</span>
            </td>
        </tr>
    </tbody>
</table>

<!-- 업무적용점 -->
<table class="table">
    <colgroup>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>3. 업무적용점</th>
        </tr>
        <tr>
            <td><textarea class="form-control"></textarea></td>
        </tr>
    </tbody>
</table>

<!-- 기타 -->
<table class="table">
    <colgroup>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>4. 기타</th>
        </tr>
        <tr>
            <td><textarea class="form-control"></textarea></td>
        </tr>
    </tbody>
</table>

