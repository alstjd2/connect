/**
 * DataTables Advanced (jquery)
 */

'use strict';

$(function () {
	const contextPath = document.body.dataset.contextPath;
  // empCommail 자동 생성
  document.getElementById('empId').addEventListener('input', function() {
    let empId = this.value;
    let empCommail = empId + '@ddit.or.kr';
    document.getElementById('empCommail').value = empCommail;
});


// 아이디 생성 버튼 클릭 이벤트 핸들러
    $('#generateIdButton').click(function() {
        generateId();
    });

    // 비밀번호 생성 버튼 클릭 이벤트 핸들러
    $('#generatePasswordButton').click(function() {
        generatePassword();
    });

    // 아이디 생성 함수
    function generateId() {
        $.ajax({
            url: contextPath + '/gw/adminEmployee/generateId', // 서버 API 엔드포인트 설정
            method: 'GET',
            success: function(response) {
                $('#empId').val(response);
                $('#empCommail').val(response + '@ddit.or.kr'); // 회사 이메일 자동 업데이트
            }
        });
    }

    // 비밀번호 생성 함수
    function generatePassword() {
        $.ajax({
            url: contextPath + '/gw/adminEmployee/generatePassword', // 서버 API 엔드포인트 설정
            method: 'GET',
            success: function(response) {
                $('#empPw2').val(response);
            }
        });
    }


	function loadDepartments() {
    $.ajax({
        url: contextPath + '/gw/adminEmployee/getDepartments',  // 부서 목록을 가져오는 API 엔드포인트
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var departmentSelect = $('#orgDep');
            departmentSelect.empty();
			departmentSelect.append('<option value="">부서 선택</option>'); // 기본 옵션 추가
            $.each(data, function(index, department) {
                departmentSelect.append('<option value="' + department.orgNo + '">' + department.orgDep + '</option>');
            });
        },
        error: function() {
            alert('부서 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });
}

	// 페이지 로드 시 부서 목록을 불러오기
	$(document).ready(function() {
	    loadDepartments();
	});


	function loadOnePosNm() {
    $.ajax({
        url: contextPath + '/gw/adminEmployee/getOnePosNm',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var onePosSelect = $('#empOneposName');
            onePosSelect.empty();
			onePosSelect.append('<option value="">직책 선택</option>'); // 기본 옵션 추가
            $.each(data, function(index, item) {
                onePosSelect.append('<option value="' + item.empOnepos + '">' + item.empOneposName + '</option>');
            });
        },
        error: function() {
            alert('직책 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });
}

	function loadPosNm() {
    $.ajax({
        url: contextPath + '/gw/adminEmployee/getPosNm',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var posSelect = $('#empPosName');
            posSelect.empty();
            posSelect.append('<option value="">직급 선택</option>'); // 기본 옵션 추가
            $.each(data, function(index, item) {
                posSelect.append('<option value="' + item.empPos + '">' + item.empPosName + '</option>');
            });
        },
        error: function() {
            alert('직급 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });
}

// 페이지 로드 시 직책과 직급 목록을 불러오기
$(document).ready(function() {
    loadDepartments(); // 부서 로드
    loadOnePosNm(); // 직책 로드
    loadPosNm(); // 직급 로드
});







    var userView = 'personnel-employee-view.html',
        dt_filter_table = $('.dt-column-search');


	// 직원 상세 보기 클릭 시
    $(document).on('click', '[data-bs-target="#empDetail"]', function () {
        const empNo = $(this).attr('id').replace('empNo', '');
        loadEmployeeDetail(empNo);
    });

    // 직원 상세 정보 로드
    function loadEmployeeDetail(empNo) {
        $.ajax({
            url: contextPath + '/gw/adminEmployee/detail',
            method: 'GET',
            data: { empNo: empNo },
            success: function (employee) {
                $('#detailNameEmail').text(employee.empNm + ' (' + employee.empCommail + ')');
                $('#detailDepartmentPosition').text(employee.empDepName + ' / ' + employee.empPosName + ' / ' + employee.empOneposName);
                $('#detailStatus').text(employee.empState);
                $('#detailEmpNo').text(employee.empNo);

                // 데이터 로드 후 텍스트 표시, 입력 필드 숨기기
	            $('#viewEmpJoindate').text(employee.empJoindate).removeClass('d-none');
	            $('#editEmpJoindate').addClass('d-none').val(employee.empJoindate);

	            $('#viewEmpMail').text(employee.empMail).removeClass('d-none');
	            $('#editEmpMail').addClass('d-none').val(employee.empMail); // 값 설정

	            $('#viewEmpTel').text(employee.empTel).removeClass('d-none');
	            $('#editEmpTel').addClass('d-none').val(employee.empTel); // 값 설정

	            $('#viewEmpBir').text(employee.empBir).removeClass('d-none');
	            $('#editEmpBir').addClass('d-none').val(employee.empBir); // 값 설정

	            $('#editEmpNo').val(employee.empNo);

	            // 버튼 초기 상태 설정
	            $('#editButton').show();
	            $('#saveChangesButton').hide();
        	},
            error: function () {
                alert('직원 정보를 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

	// 수정 버튼 클릭 시
    $('#editButton').click(function () {
        // 텍스트 숨기기 및 입력 필드 표시
	    $('#viewEmpJoindate').addClass('d-none');
	    $('#editEmpJoindate').removeClass('d-none').prop('readonly', false);

	    $('#viewEmpMail').addClass('d-none');
	    $('#editEmpMail').removeClass('d-none').prop('readonly', false);

	    $('#viewEmpTel').addClass('d-none');
	    $('#editEmpTel').removeClass('d-none').prop('readonly', false);

	    $('#viewEmpBir').addClass('d-none');
	    $('#editEmpBir').removeClass('d-none').prop('readonly', false);

	    $(this).hide();
	    $('#saveChangesButton').show();
    });


	// 저장 버튼 클릭 시
    $('#saveChangesButton').click(function () {
        const empNo = $('#editEmpNo').val();
	    const empJoindate = $('#editEmpJoindate').val();
	    const empMail = $('#editEmpMail').val();
	    const empTel = $('#editEmpTel').val();
	    const empBir = $('#editEmpBir').val();

		console.log('empNo:', empNo); // empNo 값이 제대로 들어가 있는지 확인

		// empNo가 null이 아닌지 확인
	    if (!empNo) {
	        alert('직원 번호가 유효하지 않습니다.');
	        return;
	    }

	$.ajax({
            url: contextPath + '/gw/adminEmployee/edit',
            method: 'POST',
            data: {
                empNo: empNo,
                empJoindate: empJoindate,
                empMail: empMail,
                empTel: empTel,
                empBir: empBir
            },
            success: function () {
                alert('직원 정보가 성공적으로 수정되었습니다.');
                $('#empDetail').modal('hide');
                // 직원 정보를 새로고침 또는 갱신하는 로직 추가
                loadEmployeeDetail(empNo);
            },
            error: function () {
                alert('직원 정보를 수정하는 중 오류가 발생했습니다.');
            }
        });
	  });


  // Column Search
  // --------------------------------------------------------------------

  if (dt_filter_table.length) {
    // Setup - add a text input to each footer cell
    $('.dt-column-search thead tr').clone(true).appendTo('.dt-column-search thead');
    $('.dt-column-search thead tr:eq(1) th').each(function (i) {
      var title = $(this).text();
      var $input = $('<input type="text" class="form-control" placeholder="' + title + ' 검색" />');

      // Add left and right border styles to the parent element
      $(this).css('border-left', 'none');
      if (i === $('.dt-column-search thead tr:eq(1) th').length - 1) {
        $(this).css('border-right', 'none');
      }

      $(this).html($input);

      $('input', this).on('keyup change', function () {
        if (dt_filter.column(i).search() !== this.value) {
          dt_filter.column(i).search(this.value).draw();
        }
      });
    });
	// 데이터테이블
    var dt_filter = dt_filter_table.DataTable({
      ajax: {"url":contextPath+"/gw/adminEmployee/list", "dataSrc":""},
      columns: [
        { data: 'empNo', visible: false },
        { data: 'empNm' },
        { data: 'empDepName' },
        { data: 'empOneposName' },
        { data: 'empPosName' },
        { data: 'empState' }
      ],
      columnDefs: [
        {
            // User full name and email
            targets: 1,
            responsivePriority: 4,
            render: function (data, type, full, meta) {
              var $name = full['empNm'],
                $email = full['empCommail'],   // 회사 메일
                $image = full['empProfile'],
                $empNo = "empNo"+full['empNo'];
              if ($image) {
                // For Avatar image
                var $output =
                  '<img src="' + assetsPath + 'img/avatars/' + $image + '" alt="Avatar" class="rounded-circle">';
              } else {
                // For Avatar badge
                var stateNum = Math.floor(Math.random() * 6);
                var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                var $state = states[stateNum],
                    $name = full['empNm'],
                    $initials = $name[0] || '';  // 첫 글자만 가져옴
                $output = '<span class="avatar-initial rounded-circle bg-label-' + $state + '">' + $initials.toUpperCase() + '</span>';
              }
              // Creates full output for row
              var $row_output =
                '<div class="d-flex justify-content-start align-items-center user-name">' +
                '<div class="avatar-wrapper">' +
                '<div class="avatar avatar-sm me-4">' +
                $output +
                '</div>' +
                '</div>' +
                '<div class="d-flex flex-column">' +
                '<a href="javascript:void(0);" id="'+$empNo+'" class="text-heading text-truncate" data-bs-toggle="modal" data-bs-target="#empDetail"><span class="fw-medium">' +
                $name +
                '</span></a>' +
                '<small>' + ($email !== null && $email !== undefined ? $email : 'No email provided') + '</small>' +  // 여기에 회사 메일 표시
                '</div>' +
                '</div>';
              return $row_output;
            }
        }
      ],
	  order: [[0, 'desc']],
      orderCellsTop: true,
      dom:
        '<"row"' +
        '<"col-md-2"<"ms-n2"l>>' +
        '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-6 mb-md-0 mt-n6 mt-md-0"fB>>' +
        '>t' +
        '<"row"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      language: {
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: 'Search User',
        paginate: {
          next: '<i class="bx bx-chevron-right bx-18px"></i>',
          previous: '<i class="bx bx-chevron-left bx-18px"></i>'
        }
      },
      // Buttons with Dropdown
      buttons: [
        {
          extend: 'collection',
          className: 'btn btn-label-secondary dropdown-toggle mx-4',
          text: '<i class="bx bx-export me-2 bx-sm"></i>Export',
          buttons: [
            {
              extend: 'print',
              text: '<i class="bx bx-printer me-2" ></i>Print',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5],
                // prevent avatar to be print
                format: {
                  body: function (inner, coldex, rowdex) {
                    if (inner.length <= 0) return inner;
                    var el = $.parseHTML(inner);
                    var result = '';
                    $.each(el, function (index, item) {
                      if (item.classList !== undefined && item.classList.contains('user-name')) {
                        result = result + item.lastChild.firstChild.textContent;
                      } else if (item.innerText === undefined) {
                        result = result + item.textContent;
                      } else result = result + item.innerText;
                    });
                    return result;
                  }
                }
              },
              customize: function (win) {
                //customize print view for dark
                $(win.document.body)
                  .css('color', headingColor)
                  .css('border-color', borderColor)
                  .css('background-color', bodyBg);
                $(win.document.body)
                  .find('table')
                  .addClass('compact')
                  .css('color', 'inherit')
                  .css('border-color', 'inherit')
                  .css('background-color', 'inherit');
              }
            },
            {
              extend: 'csv',
              text: '<i class="bx bx-file me-2" ></i>Csv',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5],
                // prevent avatar to be display
                format: {
                  body: function (inner, coldex, rowdex) {
                    if (inner.length <= 0) return inner;
                    var el = $.parseHTML(inner);
                    var result = '';
                    $.each(el, function (index, item) {
                      if (item.classList !== undefined && item.classList.contains('user-name')) {
                        result = result + item.lastChild.firstChild.textContent;
                      } else if (item.innerText === undefined) {
                        result = result + item.textContent;
                      } else result = result + item.innerText;
                    });
                    return result;
                  }
                }
              }
            },
            {
              extend: 'excel',
              text: '<i class="bx bxs-file-export me-2"></i>Excel',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5],
                // prevent avatar to be display
                format: {
                  body: function (inner, coldex, rowdex) {
                    if (inner.length <= 0) return inner;
                    var el = $.parseHTML(inner);
                    var result = '';
                    $.each(el, function (index, item) {
                      if (item.classList !== undefined && item.classList.contains('user-name')) {
                        result = result + item.lastChild.firstChild.textContent;
                      } else if (item.innerText === undefined) {
                        result = result + item.textContent;
                      } else result = result + item.innerText;
                    });
                    return result;
                  }
                }
              }
            },
            {
              extend: 'pdf',
              text: '<i class="bx bxs-file-pdf me-2"></i>Pdf',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5],
                // prevent avatar to be display
                format: {
                  body: function (inner, coldex, rowdex) {
                    if (inner.length <= 0) return inner;
                    var el = $.parseHTML(inner);
                    var result = '';
                    $.each(el, function (index, item) {
                      if (item.classList !== undefined && item.classList.contains('user-name')) {
                        result = result + item.lastChild.firstChild.textContent;
                      } else if (item.innerText === undefined) {
                        result = result + item.textContent;
                      } else result = result + item.innerText;
                    });
                    return result;
                  }
                }
              }
            },
            {
              extend: 'copy',
              text: '<i class="bx bx-copy me-2" ></i>Copy',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5],
                // prevent avatar to be display
                format: {
                  body: function (inner, coldex, rowdex) {
                    if (inner.length <= 0) return inner;
                    var el = $.parseHTML(inner);
                    var result = '';
                    $.each(el, function (index, item) {
                      if (item.classList !== undefined && item.classList.contains('user-name')) {
                        result = result + item.lastChild.firstChild.textContent;
                      } else if (item.innerText === undefined) {
                        result = result + item.textContent;
                      } else result = result + item.innerText;
                    });
                    return result;
                  }
                }
              }
            }
          ]
        },
        {
          text: '<i class="bx bx-plus bx-sm me-0 me-sm-2"></i><span class="d-none d-sm-inline-block">직원등록</span>',
          className: 'add-new btn btn-primary',
          attr: {
            'data-bs-toggle': 'offcanvas',
            'data-bs-target': '#offcanvasAddUser'
          }
        },
		{
		  text: '<i class="bx bx-trash-alt bx-sm me-0 me-sm-2"></i><span class="d-none d-sm-inline-block">직원삭제</span>',
		  className: 'delete-user btn btn-danger ms-2',
		  attr: {
		    'data-bs-toggle': 'offcanvas',
		    'data-bs-target': '#offcanvasDeleteUser'
		  }
		}
      ],
      // For responsive popup
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['full_name'];
            }
          }),
          type: 'column',
          renderer: function (api, rowIdx, columns) {
            var data = $.map(columns, function (col, i) {
              return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                ? '<tr data-dt-row="' +
                    col.rowIndex +
                    '" data-dt-column="' +
                    col.columnIndex +
                    '">' +
                    '<td>' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td>' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/><tbody />').append(data) : false;
          }
        }
      }
    });
  }

});
