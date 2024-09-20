<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table">
    <tbody>
        <tr>
            <th>제목</th>
            <td colspan="3"><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>작성일자</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>품명</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>모델명</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>시험명</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>재발여부</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>검토자</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th rowspan="2">부적합내용</th>
            <td colspan="3">
                1. 발생일: <input class="form-control bg-white" type="text">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                2. 내용: <input class="form-control bg-white" type="text">
            </td>
        </tr>
        <tr>
            <th>검토단계</th>
            <td colspan="3">
                <input class="form-control bg-white" type="checkbox" id="devReview" value="개발검토">
                <label for="devReview">개발검토</label>
                <input class="form-control bg-white" type="checkbox" id="ppReview" value="P.P검토">
                <label for="ppReview">P.P검토</label>
                <input class="form-control bg-white" type="checkbox" id="massReview" value="양산검토">
                <label for="massReview">양산검토</label>
                <input class="form-control bg-white" type="checkbox" id="other" value="기타">
                <label for="other">기타</label>
            </td>
        </tr>
        <tr>
            <td colspan="4">※ 참조사항:</td>
        </tr>
        <tr>
            <td colspan="4">
                1. 신뢰성 재시험의 경우 "신뢰성의뢰서(I-103-4) 뒷면에 "개선 검토 보고서 (I-103-5)를 별첨해야 재 신뢰성 시험이 가능합니다. 2. 유효성 검증 자료의 경우 협력사 시험결과서를 첨부하였을 경우 수용합니다.
            </td>
        </tr>
        <tr>
            <th>부적합현상</th>
            <td colspan="3">
                ※ 부적합 발생부위/시험시간/현상에 대해 세부적으로 기재하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <th>부적합원인</th>
            <td colspan="3">
                ※ 부적합 발생 원인에 대해 세부적으로 기재하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
    </tbody>
</table>

<table class="table">
    <tbody>
        <tr>
            <th rowspan="2">개선대책</th>
            <th>임시대책</th>
            <td>※ 단기 개선 진행안에 대해 기재 하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <th>임시대책</th>
            <td>※ 단기 개선 진행안에 대해 기재 하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <th rowspan="3">유효성검증</th>
            <th>검증일자</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>검증결과</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>검증내용</th>
            <td>※ 개선 적용품에 대한 자체 신뢰성 시험결과 내용을 기재 하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <th>부적합원인</th>
            <td colspan="2">
                ※ 도면/규격류 변경이 되어야 할 경우 기재 하시기 바랍니다.
                <textarea class="form-control"></textarea>
            </td>
        </tr>
    </tbody>
</table>
