'use strict';

document.addEventListener('DOMContentLoaded', function (e) {
  // Form validation for Add new record
  const formAccSettings = document.querySelector('#formAccountSettings'),
        deactivateAcc = document.querySelector('#formAccountDeactivation');

  if (formAccSettings) {
    const fv = FormValidation.formValidation(formAccSettings, {
      fields: {
        firstName: {
          validators: {
            notEmpty: {
              message: 'Please enter first name'
            }
          }
        },
        lastName: {
          validators: {
            notEmpty: {
              message: 'Please enter last name'
            }
          }
        }
      },
      plugins: {
        trigger: new FormValidation.plugins.Trigger(),
        bootstrap5: new FormValidation.plugins.Bootstrap5({
          eleValidClass: '',
          rowSelector: '.col-md-6'
        }),
        submitButton: new FormValidation.plugins.SubmitButton(),
        autoFocus: new FormValidation.plugins.AutoFocus()
      },
      init: instance => {
        instance.on('plugins.message.placed', function (e) {
          if (e.element.parentElement.classList.contains('input-group')) {
            e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
          }
        });
      }
    });
  }

  // CleaveJS validation
  const phoneNumber = document.querySelector('#phoneNumber'),
        zipCode = document.querySelector('#zipCode');

  if (phoneNumber) {
    new Cleave(phoneNumber, {
      phone: true,
      phoneRegionCode: 'US'
    });
  }

  if (zipCode) {
    new Cleave(zipCode, {
      delimiter: '',
      numeral: true
    });
  }

  let accountUserImage = document.getElementById('uploadedAvatar');
  const fileInput = document.querySelector('.account-file-input'),
        resetFileInput = document.querySelector('.account-image-reset');

  if (accountUserImage && fileInput && resetFileInput) {
    const resetImage = accountUserImage.src;

    fileInput.addEventListener('change', () => {
      // 콘솔에 파일 선택 로그 추가
      console.log('File input changed');
      if (fileInput.files[0]) {
        // 선택한 파일 확인
        console.log('Selected file:', fileInput.files[0]);
        // URL.createObjectURL 호출 로그 추가
        console.log('Creating object URL for the file');
        accountUserImage.src = URL.createObjectURL(fileInput.files[0]);
        console.log('Image source updated:', accountUserImage.src);
      } else {
        console.log('No file selected');
      }
    });

    resetFileInput.addEventListener('click', () => {
      fileInput.value = '';
      accountUserImage.src = resetImage;
    });
  } else {
  }

  // Select2 (jquery)
  $(function () {
    var select2 = $('.select2');
    if (select2.length) {
      select2.each(function () {
        var $this = $(this);
        $this.wrap('<div class="position-relative"></div>');
        $this.select2({
          dropdownParent: $this.parent()
        });
      });
    }
  });
});