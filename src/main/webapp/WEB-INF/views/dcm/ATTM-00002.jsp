<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="table" id="timelineApprovalForm">
    <tbody>
        <tr>
            <th colspan="4">신청 현황</th>
        </tr>
        <tr>
            <td><b>*</b> 근무구분</td>
            <td colspan="3">
                <input class="form-control bg-white" type="radio" name="workType" value="연장" id="overtime">
                <label for="overtime">연장</label>
                <input class="form-control bg-white" type="radio" name="workType" value="야간" id="night">
                <label for="night">야간</label>
                <input class="form-control bg-white" type="radio" name="workType" value="휴일" id="holiday">
                <label for="holiday">휴일</label>
            </td>
        </tr>
        <tr>
            <td><b>*</b> 근무일시</td>
            <td colspan="3">
                <input class="form-control bg-white" type="text">
                <span id="startTime">
                    <select>
                        <option value="00" selected>00</option>
                        <option value="01">01</option>
                    </select>시
                    <select>
                        <option value="00" selected>00</option>
                        <option value="01">01</option>
                    </select>분
                </span>
                ~
                <span id="endTime">
                    <select>
                        <option value="00" selected>00</option>
                        <option value="01">01</option>
                    </select>시
                    <select>
                        <option value="00" selected>00</option>
                        <option value="01">01</option>
                    </select>분
                </span>
            </td>
        </tr>
        <tr>
            <td><b>*</b> 근무시간</td>
            <td colspan="3"><span id="totalTime"></span></td>
        </tr>
        <tr>
            <td colspan="4">
                <p>* 주간 근무시간 - 근무일이 포함된 한 주</p>
                <p>정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다.</p>
                <p>근태관리에서 시간 수정이 가능하므로 주간 근무시간은 상이해질 수 있습니다.</p>
            </td>
        </tr>
        <tr>
            <td><b>*</b> 신청 사유</td>
            <td colspan="3">
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <a id="timelineApprovalAddBtn">추가</a> 
                <a id="timelineApprovalDelBtn">삭제</a>
            </td>
        </tr>
    </tbody>
</table>
