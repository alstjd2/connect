/**
 * DataTables Advanced (jquery)
 */

'use strict';

$(function() {
	moment.locale('ko');
	const contextPath = document.body.dataset.contextPath;
	var dt_adv_filter_table = $('.dt-advanced-search'),
		startDateEle = $('.start_date'),
		endDateEle = $('.end_date')
	var statusObj = {
		"진행중": { title: '진행중', class: 'bg-label-secondary' },
		"승인완료": { title: '승인완료', class: 'bg-label-success' },
		"반려": { title: '반려', class: 'bg-label-warning' }
	};

	// 고급 검색 기능 시작
	// --------------------------------------------------------------------

	// 고급 필터를 위한 날짜 선택기
	var rangePickr = $('.flatpickr-range'),
		dateFormat = 'YYYY-DD-MM';

	if (rangePickr.length) {
		rangePickr.flatpickr({
			mode: 'range',
			dateFormat: 'Y-m-d',
			orientation: isRtl ? 'auto right' : 'auto left',
			locale: 'ko',
			onClose: function(selectedDates, dateStr, instance) {
				var startDate = '',
					endDate = new Date();
				if (selectedDates[0] != undefined) {
					startDate = moment(selectedDates[0]).format('YYYY-DD-MM');
					startDateEle.val(startDate);
				}
				if (selectedDates[1] != undefined) {
					endDate = moment(selectedDates[1]).format('YYYY-DD-MM');
					endDateEle.val(endDate);
				}
				$(rangePickr).trigger('change').trigger('keyup');
			}
		});
	}

	// 열별 필터 기능
	function filterColumn(i, val) {
		if (i == 5) {
			var startDate = startDateEle.val(),
				endDate = endDateEle.val();
			if (startDate !== '' && endDate !== '') {
				$.fn.dataTableExt.afnFiltering.length = 0; // 데이터 테이블 필터 재설정
				dt_adv_filter_table.dataTable().fnDraw(); // 필터 적용 후 테이블 다시 그리기
				filterByDate(i, startDate, endDate); // 날짜별 필터 함수 호출
			}
			dt_adv_filter_table.dataTable().fnDraw();
		} else {
			dt_adv_filter_table.DataTable().column(i).search(val, false, true).draw();
		}
	}

	// 고급 필터 함수
	// 열 번호, 시작 날짜, 종료 날짜를 전달받습니다.
	$.fn.dataTableExt.afnFiltering.length = 0;
	var filterByDate = function(column, startDate, endDate) {
		// 새로운 필터를 글로벌 필터 배열에 추가합니다.
		$.fn.dataTableExt.afnFiltering.push(function(oSettings, aData, iDataIndex) {
			var rowDate = normalizeDate(aData[column]),
				start = normalizeDate(startDate),
				end = normalizeDate(endDate);

			// 행의 날짜가 시작 날짜와 종료 날짜 사이에 있는지 확인합니다.
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

	// 날짜 문자열을 Date 객체로 변환한 후 YYYYMMMDD 형식으로 정규화합니다. 날짜 비교를 더 쉽게 만들어줍니다. ex: 20131220 > 20121220
	var normalizeDate = function(dateString) {
		var date = new Date(dateString);
		var normalized =
			date.getFullYear() + '' + ('0' + (date.getMonth() + 1)).slice(-2) + '' + ('0' + date.getDate()).slice(-2);
		return normalized;
	};
	// 고급 검색 기능 끝

	// 고급 필터 테이블 설정
	if (dt_adv_filter_table.length) {
		var dt_adv_filter = dt_adv_filter_table.DataTable({
			dom: "<'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
			ajax: {
				"url": contextPath + '/gw/myInfo/applicationList',
				"dataSrc": function(json) {
					// JSON 데이터를 평탄화합니다.
					let flattenedData = [];
					json.forEach(item => {
						item.applicationList.forEach(application => {
							flattenedData.push({
								rnum: application.rnum, // 신청 번호 사용
								vaciTypeNm: application.vaciTypeNm,
								appDetail: application.appDetail,
								appStrdate: application.appStrdate,
								days: application.days,
								appStateNm: application.appStateNm
							});
						});
					});
					return flattenedData;
				}
			},
			columns: [
				{ data: null, defaultContent: '' },
				{ data: 'rnum' },
				{ data: 'vaciTypeNm' },
				{ data: 'appDetail' },
				{ data: 'appStrdate' },
				{ data: 'days' },
				{ data: 'appStateNm' }
			],

			columnDefs: [
				{
					targets: 2, // 휴가 유형
					render: function(data, type, full, meta) {
						var $role = full['vaciTypeNm'];
						var roleBadgeObj = {
							연차: '<i class="bx bx-calendar-event text-primary me-2"></i> 연차',
							경조: '<i class="bx bx-calendar-exclamation text-warning me-2"></i> 경조',
							특별휴가: '<i class="bx bx-calendar-star text-success me-2"></i> 특별휴가'
						};
						return (
							"<span class='text-truncate d-flex align-items-center text-heading'>" +
							roleBadgeObj[$role] +
							'</span>'
						);
					}
				},
				{
					targets: 3, // 신청 상세
					render: function(data, type, full, meta) {
						var $appDetail = full['appDetail'];
						return '<a href=`${contextPath}/gw/myInfo/vacationDetail.do`>' + $appDetail + '</a>';
					}
				},
				{
					targets: 5, // 신청 상세
					render: function(data, type, full, meta) {
						var $days = full['days'];
						return  $days + ' 일';
					}
				},
				{
					targets: 6, // 신청 상태
					render: function(data, type, full, meta) {
						var $status = full['appStateNm'];

						// $status 값 확인
						console.log('appStateNm:', $status);

						// 기본값 설정
						var statusInfo = statusObj[$status] || { title: '알 수 없음', class: 'bg-label-default' };
						return (
							'<span class="badge ' +
							statusInfo.class +
							'" text-capitalized>' +
							statusInfo.title +
							'</span>'
						);
					}
				},

				{
					className: 'control',
					orderable: false,
					targets: 0,
					render: function() {
						return '';
					}
				},
			],

			language: {
				paginate: {
					next: '<i class="bx bx-chevron-right bx-18px"></i>',
					previous: '<i class="bx bx-chevron-left bx-18px"></i>'
				}
			},
			 orderCellsTop: true,
        initComplete: function () {
            this.api()
            .columns(6)
            .every(function () {
                var column = this;
                var select = $(
                '<select id="appState" class="form-select text-capitalize"><option value=""> 상태구분 </option></select>'
                )
                .appendTo('.app_state')
                .on('change', function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());
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
        }
		});
	}

	// 입력 필드에서 키 입력 시
	$('input.dt-input').on('keyup', function() {
		filterColumn($(this).attr('data-column'), $(this).val());
	});

	// 필터 입력란의 기본 크기로 복원
	setTimeout(() => {
		$('.dataTables_filter .form-control').removeClass('form-control-sm');
		$('.dataTables_length .form-select').removeClass('form-select-sm');
	}, 200);
});
