/**
 * 폼 추가 기능
 */

'use strict';

(function () {
  const textarea = document.querySelector('#autosize-demo'),
    creditCard = document.querySelector('.credit-card-mask'),
    phoneMask = document.querySelector('.phone-number-mask'),
    dateMask = document.querySelector('.date-mask'),
    timeMask = document.querySelector('.time-mask'),
    numeralMask = document.querySelector('.numeral-mask'),
    blockMask = document.querySelector('.block-mask'),
    delimiterMask = document.querySelector('.delimiter-mask'),
    customDelimiter = document.querySelector('.custom-delimiter-mask'),
    prefixMask = document.querySelector('.prefix-mask');

  // 자동 크기 조절
  // --------------------------------------------------------------------
  if (textarea) {
    autosize(textarea);
  }

  // Cleave JS 입력 마스크
  // --------------------------------------------------------------------

  // 신용 카드
  if (creditCard) {
    new Cleave(creditCard, {
      creditCard: true,
      onCreditCardTypeChanged: function (type) {
        if (type != '' && type != 'unknown') {
          document.querySelector('.card-type').innerHTML =
            '<img src="' + assetsPath + 'img/icons/payments/' + type + '-cc.png" height="20"/>';
        } else {
          document.querySelector('.card-type').innerHTML = '';
        }
      }
    });
  }

  // 전화번호
  if (phoneMask) {
    new Cleave(phoneMask, {
      phone: true,
      phoneRegionCode: 'US' // 미국 지역 코드
    });
  }

  // 날짜
  if (dateMask) {
    new Cleave(dateMask, {
      date: true,
      delimiter: '-',
      datePattern: ['Y', 'm', 'd'] // 연, 월, 일 순서
    });
  }

  // 시간
  if (timeMask) {
    new Cleave(timeMask, {
      time: true,
      timePattern: ['h', 'm', 's'] // 시, 분, 초 순서
    });
  }

  // 숫자
  if (numeralMask) {
    new Cleave(numeralMask, {
      numeral: true,
      numeralThousandsGroupStyle: 'thousand' // 천 단위 구분
    });
  }

  // 블록
  if (blockMask) {
    new Cleave(blockMask, {
      blocks: [4, 3, 3], // 블록 길이 설정
      uppercase: true // 대문자로 변환
    });
  }

  // 구분자
  if (delimiterMask) {
    new Cleave(delimiterMask, {
      delimiter: '·', // 구분자 설정
      blocks: [3, 3, 3], // 블록 길이 설정
      uppercase: true // 대문자로 변환
    });
  }

  // 사용자 정의 구분자
  if (customDelimiter) {
    new Cleave(customDelimiter, {
      delimiters: ['.', '.', '-'], // 사용자 정의 구분자
      blocks: [3, 3, 3, 2], // 블록 길이 설정
      uppercase: true // 대문자로 변환
    });
  }

  // 접두어
  if (prefixMask) {
    new Cleave(prefixMask, {
      prefix: '+63', // 접두어 설정
      blocks: [3, 3, 3, 4], // 블록 길이 설정
      uppercase: true // 대문자로 변환
    });
  }
})();

// bootstrap-maxlength 및 repeater (jquery)
$(function () {
  var maxlengthInput = $('.bootstrap-maxlength-example'),
    formRepeater = $('.form-repeater'),
    formSpecial = $('.form-special');

  // Bootstrap 최대 길이
  // --------------------------------------------------------------------
  if (maxlengthInput.length) {
    maxlengthInput.each(function () {
        $(this).maxlength({
            warningClass: 'label label-success bg-success text-white', // 경고 시 클래스 설정
            limitReachedClass: 'label label-danger', // 한도 도달 시 클래스 설정
            separator: ' 중 ', // 구분자 설정
            preText: '입력한 문자 수: ', // 앞 텍스트 설정
            postText: ' 글자 사용 가능.', // 뒤 텍스트 설정
            validate: true, // 유효성 검사 설정
            threshold: +this.getAttribute('maxlength') // 임계값 설정
        });
    });
}

  // 폼 반복기
  // ! 폼 필드에 따라 동적 ID 및 클래스를 추가하기 위해 jQuery each 루프를 사용합니다. 필요에 따라 개선이 필요할 수 있습니다.
  // -----------------------------------------------------------------------------------------------------------------

    if (formRepeater.length) {
        var row = 2;
        var col = 1;
        formRepeater.on('submit', function (e) {
        e.preventDefault();
        });
        formRepeater.repeater({
        show: function () {
            var fromControl = $(this).find('.form-control, .form-select');
            var formLabel = $(this).find('.form-label');

            fromControl.each(function (i) {
            var id = 'form-repeater-' + row + '-' + col;
            $(fromControl[i]).attr('id', id);
            $(formLabel[i]).attr('for', id);
            col++;
            });

            row++;

            $(this).slideDown();
        },
        hide: function (e) {
            confirm('정말 삭제하시겠습니까?') && $(this).slideUp(e);
        }
        });
    }
    
    if (formSpecial.length) {
        var row = 2;
        var col = 1;
        formSpecial.on('submit', function (e) {
        e.preventDefault();
        });
        formSpecial.repeater({
        show: function () {
            var fromControl = $(this).find('.form-control, .form-select');
            var formLabel = $(this).find('.form-label');

            fromControl.each(function (i) {
            var id = 'form-special-' + row + '-' + col;
            $(fromControl[i]).attr('id', id);
            $(formLabel[i]).attr('for', id);
            col++;
            });

            row++;

            $(this).slideDown();
        },
        hide: function (e) {
            confirm('정말 삭제하시겠습니까?') && $(this).slideUp(e);
        }
        });
    }
});
