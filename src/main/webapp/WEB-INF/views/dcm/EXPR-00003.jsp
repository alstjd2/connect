<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 제목 및 내용 시작 -->
<table class="table">
    <colgroup>
        <col>
        <col>
    </colgroup>
    <tbody>
        <tr>
            <td colspan="2">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>휴대폰번호</th>
                            <th colspan="3">사용기간</th>
                            <th>지원금액</th>
                            <th>비고</th>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td colspan="3">
                            	<span class="d-flex align-items-center gap-3"><input class="form-control bg-white" type="date">~<input class="form-control bg-white" type="date"></span>
                            </td>
                            <td><input class="form-control bg-white  sum" type="number"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td colspan="3">
                            	<span class="d-flex align-items-center gap-3"><input class="form-control bg-white" type="date">~<input class="form-control bg-white" type="date"></span>
                            </td>
                            <td><input class="form-control bg-white  sum" type="number"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <tr>
                            <td><input class="form-control bg-white" type="text"></td>
                            <td colspan="3">
                            	<span class="d-flex align-items-center gap-3"><input class="form-control bg-white" type="date">~<input class="form-control bg-white" type="date"></span>
                            </td>
                            <td><input class="form-control bg-white  sum" type="number"></td>
                            <td><input class="form-control bg-white" type="text"></td>
                        </tr>
                        <!-- 중략: 추가 항목을 필요에 따라 추가 -->
                        <tr>
                            <td colspan="4">합계</td>
                            <td><input class="form-control bg-white total disabled" type="number" disabled="disabled" readonly="readonly"></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<script>
    // 합계를 계산하는 함수
    function calculateTotal() {
        let total = 0;
        document.querySelectorAll('.sum').forEach(function(input) {
            const value = parseFloat(input.value);
            if (!isNaN(value)) {
                total += value;
            }
        });
        document.querySelector('.total').value = total;
    }

    // 모든 sum 클래스의 input에 이벤트 리스너 추가
    document.querySelectorAll('.sum').forEach(function(input) {
        input.addEventListener('keyup', calculateTotal);
    });

    // 초기 계산 (값이 미리 입력되어 있을 경우를 대비)
    calculateTotal();
</script>
