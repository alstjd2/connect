/**
 * Form Layout Vertical
 */
'use strict';

(function() {


	const phoneMaskList = document.querySelectorAll('.phone-mask'),
		creditCardMask = document.querySelector('.credit-card-mask'),
		expiryDateMask = document.querySelector('.expiry-date-mask'),
		cvvMask = document.querySelector('.cvv-code-mask'),
		datepickerList = document.querySelectorAll('.dob-picker'),
		formCheckInputPayment = document.querySelectorAll('.form-check-input-payment');

	// Phone Number
	if (phoneMaskList) {
		phoneMaskList.forEach(function(phoneMask) {
			new Cleave(phoneMask, {
				phone: true,
				phoneRegionCode: 'US'
			});
		});
	}

	// Credit Card
	if (creditCardMask) {
		new Cleave(creditCardMask, {
			creditCard: true,
			onCreditCardTypeChanged: function(type) {
				if (type != '' && type != 'unknown') {
					document.querySelector('.card-type').innerHTML =
						'<img src="' + assetsPath + 'img/icons/payments/' + type + '-cc.png" height="20"/>';
				} else {
					document.querySelector('.card-type').innerHTML = '';
				}
			}
		});
	}

	// Expiry Date Mask
	if (expiryDateMask) {
		new Cleave(expiryDateMask, {
			date: true,
			delimiter: '/',
			datePattern: ['m', 'y']
		});
	}

	// CVV
	if (cvvMask) {
		new Cleave(cvvMask, {
			numeral: true,
			numeralPositiveOnly: true
		});
	}

	// Flat Picker Birth Date
	if (datepickerList) {
		datepickerList.forEach(function(datepicker) {
			datepicker.flatpickr({
				locale: 'ko',
				monthSelectorType: 'static'
			});
		});
	}

	// Toggle CC Payment Method based on selected option
	if (formCheckInputPayment) {
		formCheckInputPayment.forEach(function(paymentInput) {
			paymentInput.addEventListener('change', function(e) {
				const paymentInputValue = e.target.value;
				if (paymentInputValue === 'credit-card') {
					document.querySelector('#form-credit-card').classList.remove('d-none');
				} else {
					document.querySelector('#form-credit-card').classList.add('d-none');
				}
			});
		});
	}
})();

$(function() {
	var topSpacing;
	const stickyEl = $('.sticky-element');

	window.Helpers.initCustomOptionCheck();

	if (Helpers.isNavbarFixed()) {
		topSpacing = $('.layout-navbar').height() + 7;
	} else {
		topSpacing = 0;
	}

	if (stickyEl.length) {
		stickyEl.sticky({
			topSpacing: topSpacing,
			zIndex: 9
		});
	}

	var select2 = $('.select2');
	if (select2.length) {
		select2.each(function() {
			var $this = $(this);
			$this.wrap('<div class="position-relative"></div>').select2({

				dropdownParent: $this.parent()
			});
		});
	}
});

$(document).ready(function() {
	// 휴가 종류 선택 시 동작
	$('select[id="vacationSelect"]').on('change', function() {
		var selectedText = $(this).find("option:selected").text();
		$('td#vacationType').text(selectedText);
		$('input[name="vacationType"]').val(selectedText);  // Hidden input 업데이트
	});

	// 결재자 선택 시 동작
	$('select[id="결재자"]').on('change', function() {
		//        var selectedValue = $(this).val();
		var selectedText = $(this).find("option:selected").text();
		$('b#approverName').text(selectedText);


	});

	// 대무자 선택 시 동작
	$('select[id="대무자"]').on('change', function() {
		var selectedText = $(this).find("option:selected").text();
		console.log(selectedText);
		$('td#proxyName').text(selectedText);
	});

	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0');
	var yyyy = today.getFullYear();

	today
		= yyyy + '-' + mm + '-' + dd;

	$('#applicationDate').text(today);

	$('#todoContent').on('input', function() {
		var inputValue = $(this).val();
		$('#approverName').text(inputValue);
	});
$('#startDate, #endDate').on('change', function() {
    const $this = $(this);
    const inputId = $this.attr('id');
    const tableId = `#table${inputId.charAt(0).toUpperCase() + inputId.slice(1)}`; // 테이블 셀 ID 동적으로 생성

    const selectedDate = new Date($this.val());
    const today = new Date();

    // 유효성 검사
    if (inputId === 'startDate' && selectedDate < today) {
        // 시작일이 오늘 이전인 경우
        Swal.fire({
            icon: 'warning',
            title: '휴가 시작일 확인',
            text: '휴가 시작일은 오늘 날짜 이후여야 합니다.',
            confirmButton: '확인'
        }).then(() => {
            $this.val(''); // 입력 값 초기화
            $(tableId).text(''); // 테이블 셀 내용 초기화
        });
    } else if (inputId === 'endDate' && (selectedDate < new Date($('#startDate').val()) || selectedDate < today)) {
        // 종료일이 시작일보다 이전이거나 오늘 이전인 경우
        Swal.fire({
            icon: 'warning',
            title: '휴가 종료일 확인',
            text: '휴가 종료일은 시작일보다 늦어야 하며, 오늘 날짜 이후여야 합니다.',
            confirmButton: '확인'
        }).then(() => {
            $this.val(''); // 입력 값 초기화
            $(tableId).text(''); // 테이블 셀 내용 초기화
        });
    } else {
        // 유효한 경우 테이블 셀 업데이트
        $(tableId).text($this.val());
    }
});

$('#startDate').on('change', function() {
  const selectedDate = new Date($(this).val());
  const today = new Date();

  // Validate start date
  if (selectedDate < today) {
    Swal.fire({
      icon: 'warning',
      title: '휴가 시작일 확인',
      text: '휴가 시작일은 오늘 날짜 이후여야 합니다.',
      confirmButton: '확인'
    }).then(() => {
      $(this).val(''); // Clear input value
      $('#tableStartDate').text(''); // Clear table cell content
    });
    return; // Exit function if start date is invalid
  }

  // Set end date to start date by default
  $('#endDate').val(selectedDate.toISOString().split('T')[0]);
  $('#tableEndDate').text(selectedDate.toISOString().split('T')[0]);
});

$('#endDate').on('change', function() {
  const selectedDate = new Date($(this).val());
  const startDate = new Date($('#startDate').val());

  // Validate end date
  if (selectedDate < startDate || selectedDate < today) {
    Swal.fire({
      icon: 'warning',
      title: '휴가 종료일 확인',
      text: '휴가 종료일은 시작일보다 늦어야 하며, 오늘 날짜 이후여야 합니다.',
      confirmButton: '확인'
    }).then(() => {
      $(this).val(''); // Clear input value
      $('#tableEndDate').text(''); // Clear table cell content
    });
    return; // Exit function if end date is invalid
  }

  // Update table cell if user manually changes end date
  $('#tableEndDate').text($(this).val());
});

document.getElementById('todoContent').addEventListener('blur', function() {
  this.value = this.value.trim();
});

$('form').submit(function(event) {
    event.preventDefault(); // 기본 submit 동작 방지
	 if ($('#todoContent').val().trim() === '') {
      event.preventDefault(); // Prevent form submission

      // Show Sweet Alert with confirmation
      Swal.fire({
        icon: 'warning',
        title: '주의',
        text: '사유를 입력하지 않으셨습니다. 입력하시겠습니까?',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '입력하러 가기',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
          // User wants to go to textarea
          $('#todoContent').focus();
        }
      });
    }
    // 스위트 알럿으로 확인
    Swal.fire({
        title: '휴가 신청 확인',
        text: '정말로 휴가를 신청하시겠습니까?'	,
		text: '한번 신청한 휴가는 수정이 불가합니다.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // 확인 버튼 클릭 시
             $.ajax({
      url: `${contextPath}/gw/vacation/applicationInsert.do`,
      type: 'POST',
      data: $(this).serialize(),
      success: function() {
        Swal.fire({
          icon: 'success',
          title: '휴가 신청 성공',
          text: '휴가 신청이 완료되었습니다.'
        }).then(() => {
          // 신청 완료 후 처리 (예: 페이지 이동)
          location.href = `${contextPath}/gw/myInfo/vacation.do`;
        });
      },
      error: function() {
        Swal.fire({
          icon: 'error',
          title: '오류 발생',
          text: '휴가 신청 중 오류가 발생했습니다.'
        });
      }
    });
        }
    });
});


});