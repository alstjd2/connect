<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table">
    <colgroup><col><col><col><col></colgroup>
    <tbody>
        <tr><th>구입사유</th><td colspan="3"><span><textarea id="reason" class="form-control"></textarea></span></td></tr>
    </tbody>
</table>
<table class="table" id="purchaseTable">
    <colgroup><col><col><col><col><col><col><col></colgroup>
    <tbody>
        <tr><th>No.</th><th>도서명</th><th>저자</th><th>출판사</th><th>수량</th><th>예상단가</th><th>금액</th></tr>
        <tr>
            <th>1.</th>
            <td><span><input id="bookName1" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookWriter1" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookPublisher1" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookAmount1" class="form-control bg-white quantity" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookPrice1" class="form-control bg-white price" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookTotal1" class="form-control bg-white total disabled" type="number" readonly disabled="disabled"></span></td>
        </tr>
        <tr>
            <th>2.</th>
            <td><span><input id="bookName2" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookWriter2" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookPublisher2" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookAmount2" class="form-control bg-white quantity" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookPrice2" class="form-control bg-white price" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookTotal2" class="form-control bg-white total disabled" type="number" readonly disabled="disabled"></span></td>
        </tr>
        <tr>
            <th>3.</th>
            <td><span><input id="bookName3" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookWriter3" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookPublisher3" class="form-control bg-white" type="text"></span></td>
            <td><span><input id="bookAmount3" class="form-control bg-white quantity" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookPrice3" class="form-control bg-white price" type="number" min="0" value="0"></span></td>
            <td><span><input id="bookTotal3" class="form-control bg-white total disabled" type="number" readonly disabled="disabled"></span></td>
        </tr>
        <tr>
            <th>4.</th>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white quantity" type="number" min="0" value="0"></span></td>
            <td><span><input class="form-control bg-white price" type="number" min="0" value="0"></span></td>
            <td><span><input class="form-control bg-white total disabled" type="number" readonly disabled="disabled"></span></td>
        </tr>
        <tr>
            <th>5.</th>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white" type="text"></span></td>
            <td><span><input class="form-control bg-white quantity" type="number" min="0" value="0"></span></td>
            <td><span><input class="form-control bg-white price" type="number" min="0" value="0"></span></td>
            <td><span><input class="form-control bg-white total disabled"  type="number" readonly disabled="disabled"></span></td>
        </tr>
        <tr>
            <th colspan="4">합계</th>
            <td><span><input class="form-control bg-white disabled" id="totalQuantity" type="number" readonly disabled="disabled"></span></td>
            <th>금액</th>
            <td><span><input class="form-control bg-white disabled" id="grandTotal" type="number" readonly disabled="disabled"></span></td>
        </tr>
    </tbody>
</table>


<script type="text/javascript">
//수량과 예상단가가 변경될 때 금액과 합계를 계산
document.querySelectorAll('.quantity, .price').forEach(input => {
    input.addEventListener('input', calculateTotals);
});

function calculateTotals() {
    let grandTotal = 0;
    let totalQuantity = 0;

    // 각 행의 수량 * 예상단가 계산하여 금액 필드에 입력
    document.querySelectorAll('tr').forEach(row => {
        const quantityInput = row.querySelector('.quantity');
        const priceInput = row.querySelector('.price');
        const totalInput = row.querySelector('.total');

        if (quantityInput && priceInput && totalInput) {
            const quantity = parseFloat(quantityInput.value) || 0;
            const price = parseFloat(priceInput.value) || 0;
            const total = quantity * price;
            totalInput.value = total.toFixed(0);

            grandTotal += total; // 전체 금액 합계
            totalQuantity += quantity; // 전체 수량 합계
        }
    });

    // 합계 필드에 전체 수량과 금액 합계를 입력
    document.getElementById('totalQuantity').value = totalQuantity;
    document.getElementById('grandTotal').value = grandTotal.toFixed(0);
}

// 초기 계산
calculateTotals();
</script>
