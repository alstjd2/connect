<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<table class="table w-100"><!-- user -->
    <tbody>
        <tr>
        	<th>납품요청기한</th><td><input class="form-control bg-white" type="date"></td>
        	<th>발주기간</th><td><input class="form-control bg-white" type="date"></td>
        </tr>
        <tr><th>완납일자</th><td><input class="form-control bg-white" type="date"></td>
	        <th>납품기간</th><td class="d-flex align-items-center gap-1"><input class="form-control bg-white" type="date"> ~ <input class="form-control bg-white" type="date"></td>
	        
	    </tr>
        <tr>
	        <th>대금지불방법</th><td><input class="form-control bg-white" type="text"></td>
        	<th>사용목적</th><td><input class="form-control bg-white" type="text"></td>
        </tr>
    </tbody>
</table>
<table class="table">
        <thead>
            <tr>
                <th>품번</th>
                <th>품명</th>
                <th>규격</th>
                <th>단위</th>
                <th>수량</th>
                <th>단가</th>
                <th>금액</th>
                <th>비고</th>
            </tr>
        </thead>
        <tbody id="itemTable">
            <tr>
                <th>1</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>2</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>3</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>4</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>5</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>6</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>7</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>8</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>9</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <tr>
                <th>10</th>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" type="text"></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number"></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number"></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text"></td>
            </tr>
            <!-- Add more rows as needed -->
            <tr class="total">
                <th>합계</th>
                <td><input class="form-control bg-white" type="text" readonly></td>
                <td><input class="form-control bg-white" type="text" readonly></td>
                <td><input class="form-control bg-white" type="text" readonly></td>
                <td><input class="form-control bg-white" data-type="quantity" type="number" readonly></td>
                <td><input class="form-control bg-white" data-type="unit-price" type="number" readonly></td>
                <td><input class="form-control disabled" data-type="amount" type="number" readonly disabled="disabled"></td>
                <td><input class="form-control bg-white" type="text" readonly></td>
            </tr>
        </tbody>
    </table>
<script defer="defer" type="text/javascript">
function calculateRow(row) {
    const quantityInput = row.querySelector('input[data-type="quantity"]');
    const unitPriceInput = row.querySelector('input[data-type="unit-price"]');
    const amountInput = row.querySelector('input[data-type="amount"]');
    
    const quantity = parseFloat(quantityInput.value) || 0;
    const unitPrice = parseFloat(unitPriceInput.value) || 0;
    const amount = quantity * unitPrice;
    
    amountInput.value = amount.toFixed(0);
}

function calculateTotal() {
    const rows = document.querySelectorAll('#itemTable tr:not(.total)');
    let totalQuantity = 0;
    let totalAmount = 0;
    
    rows.forEach(row => {
        calculateRow(row);
        
        const quantity = parseFloat(row.querySelector('input[data-type="quantity"]').value) || 0;
        const amount = parseFloat(row.querySelector('input[data-type="amount"]').value) || 0;
        
        totalQuantity += quantity;
        totalAmount += amount;
    });
    
    const totalRow = document.querySelector('#itemTable tr.total');
    totalRow.querySelector('input[data-type="quantity"]').value = totalQuantity.toFixed(0);
    totalRow.querySelector('input[data-type="amount"]').value = totalAmount.toFixed(0);
}

document.querySelectorAll('#itemTable input[data-type="quantity"], #itemTable input[data-type="unit-price"]').forEach(input => {
    input.addEventListener('keyup', calculateTotal);
});

calculateTotal(); // Initialize the total calculation on page load
</script>
