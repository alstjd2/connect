<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table">
    <!-- Data2 -->
    <colgroup>
        <col>
        <col>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th>신청일자</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>부서(팀)</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>직위</th>
            <td><input class="form-control bg-white" type="text"></td>
            <th>이름</th>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>구분</th>
            <td colspan="7">신청(분실)사유</td>
        </tr>
        <tr>
            <th>① 신청 사유</th>
            <td colspan="7"><textarea class="form-control"></textarea></td>
        </tr>
        <tr>
            <th>② 분실 사유</th>
            <td colspan="7"><textarea class="form-control"></textarea></td>
        </tr>
        <tr>
            <td colspan="8">
                □ 상기 본인은 위의 ①항과 같이 법인카드 발급을 신청하오니 발급하여 주시기 바랍니다. (※신규 발급신청의 경우) - 신규 발급시 첨부서류: 신분증(앞, 뒤) □ 상기 본인은 위의 ②항과 같은 사유로 인하여 법인카드를 분실하였습니다. 이에 재발급을 신청하오니 발급하여 주시기 바랍니다. (※분실한 경우) ※ 관리부서 작성 [법인카드 한도]: {{currency}}(백만원) [비고사항]: {{textarea}}
            </td>
        </tr>
    </tbody>
</table>
