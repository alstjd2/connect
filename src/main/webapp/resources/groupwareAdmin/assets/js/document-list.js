/**
 * DataTables Advanced (jquery)
 */

'use strict';

$(function () {
	
	const contextPath = document.body.dataset.contextPath;	
  var dt_adv_filter_table = $('.dt-advanced-search'),
    statusObj = {
        "DB01110": { title: '결재대기', class: 'bg-label-warning' },
        "DB01120": { title: '결재예정', class: 'bg-label-info' },
        "DB01130": { title: '결재처리', class: 'bg-label-secondary' },
        "DB01140": { title: '결재완료', class: 'bg-label-success' }
    },
    formObj = {
	    "ATTM-00001": { title: '연차신청서', class: 'bg-label-warning', cont: '근태관리' },
	    "ATTM-00002": { title: '연장근무신청서', class: 'bg-label-warning', cont: '근태관리' },
	    "EDUC-00001": { title: '교육참가신청서', class: 'bg-label-warning', cont: '교육' },
	    "EDUC-00002": { title: '사외 교육 결과 보고서', class: 'bg-label-warning', cont: '교육' },
	    "EDUC-00003": { title: '외부교육참석 보고서', class: 'bg-label-warning', cont: '교육' },
	    "REPT-00001": { title: '안전관리 상태보고서', class: 'bg-label-warning', cont: '보고/시행문' },
	    "REPT-00003": { title: '개선 검토 보고서', class: 'bg-label-warning', cont: '보고/시행문' },
	    "REPT-00004": { title: '불만 발생 보고서', class: 'bg-label-warning', cont: '보고/시행문' },
	    "REPT-00005": { title: '소비자 클레임 보고서', class: 'bg-label-warning', cont: '보고/시행문' },
	    "REPT-00006": { title: '회의록', class: 'bg-label-warning', cont: '보고/시행문' },
	    "REPT-00007": { title: '시행문', class: 'bg-label-warning', cont: '보고/시행문' },
	    "HRMS-00001": { title: '거래처 경조사 화환신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00002": { title: '경조금 신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00003": { title: '경조금지급신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00004": { title: '경력증명서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00005": { title: '재직증명서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00006": { title: '직장 내 교육훈련(OJT) 계획 및 점검표', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00007": { title: '시말서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00008": { title: '지각사유서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00009": { title: '직원 채용 요청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00010": { title: '차량렌탈신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00011": { title: '동호회 승인신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00012": { title: '동호회 해체신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00013": { title: '사원증 신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00014": { title: '증명서 신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00015": { title: '퇴직금 중간 정산 신청서', class: 'bg-label-warning', cont: '인사' },
	    "HRMS-00016": { title: '서직서', class: 'bg-label-warning', cont: '인사' },
	    "GENA-00001": { title: '협조문', class: 'bg-label-warning', cont: '일반기안' },
	    "GENA-00002": { title: '기안문', class: 'bg-label-warning', cont: '일반기안' },
	    "GENA-00003": { title: '품의서', class: 'bg-label-warning', cont: '일반기안' },
	    "EXPR-00001": { title: '시내교통비 청구서', class: 'bg-label-warning', cont: '지출결의서' },
	    "EXPR-00002": { title: '유류대실비 청구서', class: 'bg-label-warning', cont: '지출결의서' },
	    "EXPR-00003": { title: '통신비 신청서', class: 'bg-label-warning', cont: '지출결의서' },
	    "EXPR-00004": { title: '의료비 신청서', class: 'bg-label-warning', cont: '지출결의서' },
	    "EXPR-00005": { title: '일반 지출결의서', class: 'bg-label-warning', cont: '지출결의서' },
	    "TRVL-00001": { title: '출장결과보고서', class: 'bg-label-warning', cont: '출장' },
	    "TRVL-00002": { title: '출장신청서', class: 'bg-label-warning', cont: '출장' },
	    "ACFM-00001": { title: '구매품의서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00002": { title: '도서구입신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00003": { title: '매출보고서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00004": { title: '비품/소모품 구입신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00005": { title: '진료비 지원 신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00006": { title: '사무용품 신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00007": { title: '학자금 신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00008": { title: '법인카드 발급 신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00009": { title: '법인카드 사용 신청서', class: 'bg-label-warning', cont: '회계/총무' },
	    "ACFM-00010": { title: '택배/퀵 신청서', class: 'bg-label-warning', cont: '회계/총무' }
    },
    startDateEle = $('.start_date'),
    endDateEle = $('.end_date');
    

  // Advanced Search Functions Starts
  // --------------------------------------------------------------------

var rangePickr = $('.flatpickr-range'),
    dateFormat = 'YYYY-MM-DD';

  if (rangePickr.length) {
    rangePickr.flatpickr({
      mode: 'range',
      dateFormat: 'Y-m-d',
      orientation: isRtl ? 'auto right' : 'auto left',
       locale: 'ko',
      onClose: function (selectedDates, dateStr, instance) {
        var startDate = '',
          endDate = new Date();
        if (selectedDates[0] != undefined) {
          startDate = moment(selectedDates[0]).format('YYYY-MM-DD');
          startDateEle.val(startDate);
        }
        if (selectedDates[1] != undefined) {
          endDate = moment(selectedDates[1]).format('YYYY-MM-DD');
          endDateEle.val(endDate);
        }
        $(rangePickr).trigger('change').trigger('keyup');
      }
    });
  }

  // Filter column wise function
  function filterColumn(i, val) {
    if (i == 7 || i == 8) {
      var startDate = startDateEle.val(),
        endDate = endDateEle.val();
      if (startDate !== '' && endDate !== '') {
        $.fn.dataTableExt.afnFiltering.length = 0; // Reset datatable filter
        dt_adv_filter_table.dataTable().fnDraw(); // Draw table after filter
        filterByDate(i, startDate, endDate); // We call our filter function
      }
      dt_adv_filter_table.dataTable().fnDraw();
/*		console.log( dt_adv_filter_table.DataTable().columns(7));
		console.log(dt_adv_filter_table.DataTable().rows({ filter: 'applied' }));
		console.log(dt_adv_filter_table.DataTable().rows({ filter: 'applied' }).data().toArray());*/
    } else {
      dt_adv_filter_table.DataTable().column(i).search(val, false, true).draw();
    }
  }

  // Advance filter function
  // We pass the column location, the start date, and the end date
  $.fn.dataTableExt.afnFiltering.length = 0;
  var filterByDate = function (column, startDate, endDate) {
    // Custom filter syntax requires pushing the new filter to the global filter array
    $.fn.dataTableExt.afnFiltering.push(function (oSettings, aData, iDataIndex) {
      var rowDate = normalizeDate(aData[column]),
        start = normalizeDate(startDate),
        end = normalizeDate(endDate);

      // If our date from the row is between the start and end
      if (start <= rowDate && rowDate <= end) {
        return true;
      } else if (rowDate >= start && end === '' && start !== '') {
        return true;
      } else if (rowDate <= end && start === '' && end !== '') {
        return true;
      } else {
        return false;
      }
    });
  };

  // converts date strings to a Date object, then normalized into a YYYYMMMDD format (ex: 20131220). Makes comparing dates easier. ex: 20131220 > 20121220
  var normalizeDate = function (dateString) {
    var date = new Date(dateString);
    var normalized =
      date.getFullYear() + '' + ('0' + (date.getMonth() + 1)).slice(-2) + '' + ('0' + date.getDate()).slice(-2);
    return normalized;
  };


  // Advanced Search
  // --------------------------------------------------------------------

  // Advanced Filter table
  if (dt_adv_filter_table.length) {
    var dt_adv_filter = dt_adv_filter_table.DataTable({
      dom: "<'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
      ajax: {
			"url":contextPath+"/gw/document/list",
			"dataSrc": ""
		},
      columns: [
        { data: '' },
        { data: 'pmtDcmStaNo' },
        { data: 'comdcmNum' },
        { data: 'dcmFormCode' },
        { data: 'dcmFormCode' },
        { data: 'pmtDcmTitle' },
        { data: 'pmtDcmEmpnm' },
        { data: 'pmtDcmSaveDate' },
        { data: 'pmtDcmEndDate' }
      ],
      columnDefs: [
        {
          className: 'control',
          orderable: false,
	      visible: false,
          targets: 0,
          render: function (data, type, full, meta) {
            return '';
          }
        },
        {
          targets: 1,
          render: function (data, type, full, meta) {
            let $status = full['pmtDcmStaNo'];

            return (
              '<span class="badge ' +
              statusObj[$status].class +
              '" text-capitalized>' +
              statusObj[$status].title +
              '</span>'
            );
          }
        },
        {
          targets: 2,
	      width: 100
        },
        {
          targets: 3,
          render: function (data, type, full, meta) {
            let $form = full['dcmFormCode'];

            return (
              formObj[$form].cont 
            );
          }
        },
        {
          targets: 4,
          render: function (data, type, full, meta) {
            let $form = full['dcmFormCode'];

            return (
              formObj[$form].title 
            );
          }
        },
        {
          targets: 5,
          render: function (data, type, full, meta) {
            let $tilte = full['pmtDcmTitle'],
            $pmtDcmNo = full['pmtDcmNo'];
			//console.log($pmtDcmNo);
            return (
              '<a href="detail.do?what='+$pmtDcmNo+'">'+$tilte+'</a>'
            );
          }
        },
        {
          targets: 6,
          render: function (data, type, full, meta) {
            let $empName = full['pmtDcmEmpnm'],
            $pmtEmpNo = full['pmtDcmEmpno'];

            return (
                '<button type="button" class="btn btn-sm rounded-pill btn-outline-primary" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no='+$pmtEmpNo+'>'+$empName+'</button>'
            );
          }
        },
        {
          targets: 7,
	      width: 100
        },
        {
          targets: 8,
	      width: 100
        }
      ],
      dom:
        '<"row"' +
        '<"col-md-2"<"ms-n2"l>>' +
        '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-6 mb-md-0 mt-n6 mt-md-0"fB>>' +
        '>t' +
        '<"row"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      // Buttons with Dropdown
      buttons: [
        {
          extend: 'collection',
          className: 'btn btn-label-secondary dropdown-toggle mx-4',
          text: '<i class="bx bx-export me-2 bx-sm"></i>Export',
          buttons: [
            {
              extend: 'excel',
              text: '<i class="bx bxs-file-export me-2"></i>Excel',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5, 6, 7, 8],
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
        }
      ],
      language: {
        url: '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json',
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: '전체 검색',
        paginate: {
            next: '<i class="bx bx-chevron-right bx-18px"></i>',
            previous: '<i class="bx bx-chevron-left bx-18px"></i>'
        }
      },
      orderCellsTop: true,
      
      initComplete: function () {
		const uniqueForms = new Set();
        this.api()
            .columns(1)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="FilterTransaction" class="form-select text-capitalize"><option value=""> 상태선택 </option></select>'
                )
                .appendTo('.doc-status')
                .on('change', function () {
                    let val = $.fn.dataTable.util.escapeRegex($(this).val());
                    column.search(val ? '^' + val + '$' : '', true, false).draw();
                });

                column
                .data()
                .unique()
                .sort()
                .each(function (d, j) {
                    select.append(
                    '<option value="' +
                        statusObj[d].title +
                        '" class="text-capitalize">' +
                        statusObj[d].title +
                        '</option>'
                    );
                });
        });
        this.api()
	    .columns(3)
	    .every(function () {
	        let column = this;
	        let select = $(
	            '<select id="category" class="form-select text-capitalize"><option value=""> 카테고리 선택 </option></select>'
	        )
	        .appendTo('.doc-category')
	        .on('change', function () {
	            let val = $.fn.dataTable.util.escapeRegex($(this).val());
	            column.search(val ? '^' + val + '$' : '', true, false).draw();
	        });
	
	        // 고유한 카테고리를 추적하기 위한 Set 생성
	        let uniqueCategories = new Set();
	
	        column
	            .data()
	            .unique()
	            .sort()
	            .each(function (d, j) {
	                // formObj[d].cont 값을 추출
	                let category = formObj[d].cont;
	
	                // Set에 카테고리가 이미 존재하지 않으면 추가
	                if (!uniqueCategories.has(category)) {
	                    uniqueCategories.add(category);
	                    select.append(
	                        '<option value="' + category + '" class="text-capitalize">' + category + '</option>'
	                    );
	                }
	            });
	    });
        this.api()
            .columns(4)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 서식명 선택 </option></select>'
                )
                .appendTo('.doc-form-name')
                .on('change', function () {
                    column.table().search($(this).val()).draw();
                });
                column
                .data()
                .unique()
                .sort()
                .each(function (d, j) {
                    select.append(
						'<option value="' + d +'" class="text-capitalize">' + formObj[d].title +'</option>'
					);
                });
        });
        this.api()
            .columns(6)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 작성자 선택 </option></select>'
                )
                .appendTo('.doc-emp-name')
                .on('change', function () {
                    let val = $.fn.dataTable.util.escapeRegex($(this).val());
                    column.search(val ? '^' + val + '$' : '', true, false).draw();
                });
                column
                .data()
                .unique()
                .sort()
                .each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>');
                });
        });
      }
    });
  }
  // on key up from input field
  $('input.dt-input').on('keyup', function () {
    filterColumn($(this).attr('data-column'), $(this).val());
  });

    

});


