﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table"><!-- Header -->
    <colgroup>
        <col>
        <col>
    </colgroup>

    <tbody>
        <tr>
            <td colspan="2">
                출장보고서
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <span id="addressInfo"></span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
                <table class="table"><!-- User -->
                    <colgroup>
                        <col>
                        <col>
                    </colgroup>

                    <tbody>
                        <tr>
                            <th>기안일</th>
                            <td><span><span>기안일</span></span></td>
                        </tr>
                        <tr>
                            <th>기안자</th>
                            <td><span><span>기안자</span></span></td>
                        </tr>
                        <tr>
                            <th>소속</th>
                            <td><span><span>기안부서</span></span></td>
                        </tr>
                        <tr>
                            <th>문서번호</th>
                            <td><span><span>문서번호</span></span></td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td>
                <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->[결재선]
            </td>
        </tr>
    </tbody>
</table>

<div>
    ※ 문서관리 → 회사규정 → 홈네트워크 사업본부 → 위임전결규정 양식을 참고하시고, 결재경로를 선택해 주세요.
</div>
<table class="table">
    <colgroup>
        <col>
        <col>
        <col>
        <col>
    </colgroup>

    <tbody>
        <tr>
            <th>참조</th>
            <td colspan="3"><span><span>참조자</span></span></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3"><span><input class="form-control bg-white" type="text"></span></td>
        </tr>
        <tr>
            <th>출장목적</th>
            <td colspan="3"><span><textarea class="form-control"></textarea></span></td>
        </tr>
        <tr>
            <th>출장기간</th>
            <td colspan="3">
                <span><input class="form-control bg-white" type="text"> ~ <input class="form-control bg-white" type="text"></span>
            </td>
        </tr>
        <tr>
            <th>출장지역</th>
            <td colspan="3"><span><input class="form-control bg-white" type="text"></span></td>
        </tr>
        <tr>
            <th>출장인원</th>
            <td colspan="3"><span><input class="form-control bg-white" type="text"></span>&nbsp;명</td>
        </tr>
        <tr>
            <th>출장결과</th>
            <td colspan="3">
            	<span id="editor">에디터(본문)</span>
            </td>
        </tr>
        <tr>
            <th>비고</th>
            <td colspan="3">
	            ※ 첨부파일 : 출장정산서 첨부
			    ※ 문서관리 -&gt; 양식 -&gt; 출장정산서 첨부 필수
            </td>
        </tr>
    </tbody>
</table>

