<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Applicant Details Table -->
<table class="table">
    <colgroup>
        <col>
        <col>
        <col>
        <col>
        <col>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th rowspan="2">1. 신청자</th>
            <th>소속</th>
            <th>직위</th>
            <th>성명</th>
            <th>차종</th>
            <th colspan="2">비고</th>
        </tr>
        <tr>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td colspan="2"><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th rowspan="4">2. 운행사항</th>
            <th>출발지</th>
            <th>도착지</th>
            <th>출발시간</th>
            <th>도착시간</th>
            <th>거리(Km)</th>
            <th>유류소요량</th>
        </tr>
        <tr>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td>
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>시
                <select>
                    <option value="00" selected="selected">00</option>
                    <option value="01">01</option>
                </select>분
            </td>
            <td><input class="form-control bg-white" type="text"></td>
            <td><input class="form-control bg-white" type="text"></td>
        </tr>
        <tr>
            <th>3. 업무목적(간단하게 기술)</th>
            <td colspan="6">
                <textarea class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <th>4. 유류비 계산</th>
            <td colspan="6">
                <input class="form-control bg-white" type="text"> 원
            </td>
        </tr>
        <tr>
            <td colspan="7">
                ※ 유류비 계산 기준 : 주행거리 (km) ÷ 연비 (km/ℓ) × ( ℓ당 연료비/보통 휘발유) × 150 % (10원 미만 절사)
            </td>
        </tr>
        <!--
        <tr>
            <td colspan="7">
                년월일
                신청인 (서명)
            </td>
        </tr>
        -->
    </tbody>
</table>


