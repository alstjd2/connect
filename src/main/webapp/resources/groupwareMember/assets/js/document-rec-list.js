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
    statusRecObj = {
        "DB01110": { title: '처리대기', class: 'bg-label-info', icon:"bx bx-left-arrow-circle", color:'info', comment :'결재가 완료된 문서로 처리를 대기중인 문서' },
        "DB01120": { title: '수신예정', class: 'bg-label-secondary', icon:"bx bx-pause-circle", color:'secondary', comment :'결재가 완료되지 않은 문서로 처리 예정인 문서' },
        "DB01140": { title: '처리완료', class: 'bg-label-success', icon:"bx bx-play-circle" , color:'success', comment :'결재가 완료된 문서로 처리가 완료된 문서' }
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

  // Datepicker for advanced filter
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
    if (i == 5 || i== 6 || i==9) {
      var startDate = startDateEle.val(),
        endDate = endDateEle.val();
      if (startDate !== '' && endDate !== '') {
        $.fn.dataTableExt.afnFiltering.length = 0; // Reset datatable filter
        dt_adv_filter_table.dataTable().fnDraw(); // Draw table after filter
        filterByDate(i, startDate, endDate); // We call our filter function
      }
      dt_adv_filter_table.dataTable().fnDraw();
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
  // 고급 검색 기능 종료

  // Advanced Search
  // --------------------------------------------------------------------

  // Advanced Filter table
  if (dt_adv_filter_table.length) {
    var dt_adv_filter = dt_adv_filter_table.DataTable({
	  stateSave: true,
 	  stateSaveCallback: function (settings, data) {  localStorage.setItem( 'yj_3',JSON.stringify(data));  },
	  stateLoadCallback: function (settings) { return JSON.parse(localStorage.getItem('yj_3'));  },
      dom: "<'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
      ajax: {
			"url":contextPath+"/gw/document/recList",
			"dataSrc": ""
		},
      columns: [
        { data: '' },
        { data: 'pmtDcmStaNo' },
        //{ data: 'comdcmNum' },
        //{ data: 'dcmFormCode' },
        { data: 'dcmFormCode' },
        { data: 'pmtDcmTitle' },
        { data: 'pmtDcmEmpnm' },
        { data: 'pmtDcmSaveDate' },
        { data: 'pmtDcmEndDate' },
        { data: 'pmtDcmRecStano' },
        { data: 'pmtDcmRecEmpnm' },
        { data: 'pmtDcmRecDate' }
      ],
	  order: [[5, "desc"]],
      columnDefs: [
        {
          className: '',
          orderable: false,
	      visible: false,
          targets: 0,
          render: function (data, type, full, meta) {
            return `<span style="display:none">${full['dcmFormCode']}</span>`;
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
          render: function (data, type, full, meta) {
            let $form = full['dcmFormCode'];

            return (
              formObj[$form].title 
            );
          }
        },
/*        {
          targets: 3,
          render: function (data, type, full, meta) {
            let $form = full['dcmFormCode'];

            return (
              formObj[$form].title 
            );
          }
        },*/
        {
          targets: 3,
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
          targets: 4,
	      width: 40,
          render: function (data, type, full, meta) {
            let $empName = full['pmtDcmEmpnm'],
            $pmtEmpNo = full['pmtDcmEmpno'];

            return (
                '<button type="button" class="btn btn-sm rounded-pill btn-outline-primary" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no='+$pmtEmpNo+'>'+$empName+'</button>'
            );
          }
        },
        {
          targets: 5,
	      width: 90
        },
        {
          targets: 6,
	      width: 90
        },
        {
          targets: 7,
          render: function (data, type, full, meta) {
            let $status = full['pmtDcmRecStano'];

            return (
              '<span class="badge ' +
              statusRecObj[$status].class +
              '" text-capitalized>' +
              statusRecObj[$status].title +
              '</span>'
            );
          }
        },
        {
          targets: 8,
	      width: 40,
          render: function (data, type, full, meta) {
            let $empName = full['pmtDcmRecEmpnm'],
            $pmtEmpNo = full['pmtDcmRecEmpno'];

            return (
                '<button type="button" class="btn btn-sm rounded-pill btn-outline-info" data-bs-toggle="modal" data-bs-target="#empMethods" data-pmt-emp-no='+$pmtEmpNo+'>'+$empName+'</button>'
            );
          }
        },
        {
          targets: 9,
	      width: 90
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
              extend: 'print',
              text: '<i class="bx bx-printer me-2" ></i>Print',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5, 6, 7, 8, 9],
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
              extend: 'excel',
              text: '<i class="bx bxs-file-export me-2"></i>Excel',
              className: 'dropdown-item',
              exportOptions: {
                columns: [1, 2, 3, 4, 5, 6, 7, 8, 9],
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
            .columns(2)
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
            .columns(4)
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
		this.api()
        .columns(7)
        .every(function () {
            let column = this;
			

            let select = $('<div class="row"></div>') // 필터 옵션을 담을 div 생성
                .appendTo('.doc-statusRec') // .doc-statusRec에 필터 옵션을 추가
                .on('change', function () {
                    let val = $('input[name="customOptionRadioIcon"]:checked').val(); // 선택된 라디오 버튼의 값을 가져옴
					column.columns(0).search(val).draw();
                });

            // '전체' 옵션 추가
            select.append(
                '<div class="col-md mb-md-0 mb-5">' +
	                '<div class="form-check custom-option card card-border-shadow-primary p-5 h-100">' +
		                '<label class="form-check-label custom-option-content" for="customRadioIconAll">' +
			                '<span class="d-flex align-items-center mb-2">' +
								'<div class="avatar me-4">'+
		                          '<span class="avatar-initial rounded bg-label-primary"><i class="bx bx-grid-small bx-lg"></i></span>'+
		                        '</div>'+
								'<h4 class="mb-0"><b>'+column.data().length+'</b> 건</h4>'+ // '전체' 텍스트
			                '</span>' +
                            '<span class="custom-option-title text-start d-block fs-3 py-2 fw-bold">처리전체</span>' +
							'<p>수신을 받아 처리를 진행해야 하는 문서</p>'+
			                '<input name="customOptionRadioIcon" class="form-check-input d-none" type="radio" value="" id="customRadioIconAll" checked>' + // '전체'는 빈 값으로 설정
		                '</label>' +
	                '</div>' +
                '</div>'
            );

            // 각 상태에 대한 필터 옵션 추가
            column
                .data()
                .unique()
                .sort()
                .each(function (d, j) {
		            const count = column.data().toArray().reduce(function (n, val) {
			            return n + (val === d);
			        }, 0);
                    // statusObj가 제대로 된 데이터를 가지고 있는지 확인
                    if (statusRecObj[d]) {
                        select.append(
                            '<div class="col-md mb-md-0 mb-5">' +
								'<div class="dcm form-check custom-option card card-border-shadow-' + statusRecObj[d].color + ' p-5 h-100" style="border-color: var(--bs-' + statusRecObj[d].color + ') !important;">' +
					                '<label class="form-check-label custom-option-content" for="customRadioIcon' + d + '">' +
						                '<span class="d-flex align-items-center mb-2">' +
											'<div class="avatar me-4">'+
					                          '<span class="avatar-initial rounded bg-label-' + statusRecObj[d].color + '"><i class="' + statusRecObj[d].icon + '"></i></span>'+
					                        '</div>'+
											'<h4 class="mb-0"><b>'+count+'</b> 건</h4>'+ // '전체' 텍스트
						                '</span>' +
			                            '<span class="custom-option-title text-start d-block fs-3 py-2 fw-bold">' + statusRecObj[d].title + '</span>' +
										'<p>'+statusRecObj[d].comment+'</p>'+
						                '<input name="customOptionRadioIcon" class="form-check-input d-none" type="radio" value="' + d + '" id="customRadioIcon' + d + '">' + // '전체'는 빈 값으로 설정
					                '</label>' +
				                '</div>' +
                            '</div>'
                        );
                    }
                });
        });

		const data = localStorage.getItem('yj_3');
		if (data) {
		    try {
		        // JSON 파싱
		        const parsedData = JSON.parse(data);
		
		        // 파싱된 객체에서 값 접근 (예: columns 배열의 첫 번째 요소의 search.search 값)
		        const status = parsedData.columns[1].search.search;
				
		        const search = parsedData.search.search;
		        const name = parsedData.columns[4].search.search;
				$('input[name="customOptionRadioIcon"][value="' + (status || '') + '"]').prop('checked', true);
				
				if (formObj.hasOwnProperty(search)) {
				    // formObj에 search 키가 존재하면 실행할 코드
					$('.doc-form-name select').val(search || '').prop('select', true);
					
				} 
				$('.doc-emp-name select').val(name || '').prop('select', true);
		
		    } catch (error) {
		        console.error("JSON 파싱 중 오류가 발생했습니다:", error);
		    }
		} else {
		    console.warn("로컬 스토리지에 'yj_3' 항목이 존재하지 않습니다.");
		}
      }
    });
	 $('#reset').on('click', function () {
	    // 필터 상태를 초기화하고 시각적으로 업데이트
	    $('.doc-status select').val('');
	    $('.doc-form-name select').val('');
	    $('.doc-emp-name select').val('');
	    $('.filter-status').empty(); 
		if($($('.dayContainer').find('.selected')).length>0){
			$('input.dt-date[name="dt_date"]').val('');
			$('input.dt-date[name="value_from_start_date"]').val('');
			$('input.dt-date[name="value_from_end_date"]').val('');
			$('.dayContainer').find('.selected').removeClass('inRange');
			$('.dayContainer').find('.selected').removeClass('startRange');
			$('.dayContainer').find('.selected').removeClass('endRange');
			$('.dayContainer').find('.selected').removeClass('selected');
			location.reload();
		}
		
	    dt_adv_filter.state.clear();
	    dt_adv_filter.search('').columns().search('').draw();
	});
  }
  // on key up from input field
  $('input.dt-input').on('keyup', function () {
    filterColumn($(this).attr('data-column'), $(this).val());
  });

    

});


