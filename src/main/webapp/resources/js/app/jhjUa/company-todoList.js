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

	// Advanced Search Functions Starts
	// --------------------------------------------------------------------

	// Datepicker for advanced filter
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

	// Filter column wise function
	function filterColumn(i, val) {
		if (i == 6) {
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
	var filterByDate = function(column, startDate, endDate) {
		// Custom filter syntax requires pushing the new filter to the global filter array
		$.fn.dataTableExt.afnFiltering.push(function(oSettings, aData, iDataIndex) {
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
	var normalizeDate = function(dateString) {
		var date = new Date(dateString);
		var normalized =
			date.getFullYear() + '' + ('0' + (date.getMonth() + 1)).slice(-2) + '' + ('0' + date.getDate()).slice(-2);
		return normalized;
	};
	// Advanced Search Functions Ends

	// Advanced Filter table
	if (dt_adv_filter_table.length) {
		var dt_adv_filter = dt_adv_filter_table.DataTable({
			dom: "<'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
			order: [[1, 'asc']],
			ajax: {
				"url": contextPath + '/gw/todoList/companyTodoList',
				"dataSrc": function(json) {
					// Flatten the JSON data
					let flattenedData = [];
					json.forEach(item => {
							flattenedData.push({
								todoNo: item.todoNo,
								rnum: item.rnum, // Use application rnum
								todoTitle: item.todoTitle,
								todoStart: item.todoStart,
								todoEnd: item.todoEnd,
								todoDate: item.todoDate,
						});
					});
					return flattenedData;
				}
			},
			columns: [
				{ data: null, defaultContent: 'todoNo' },
				{ data: 'rnum' },
				{ data: 'todoTitle' },
				{ data: 'todoStart' },
				{ data: 'todoEnd' },
				{ data: 'todoDate' }
			],
			columnDefs: [
				{
					className: 'control',
					orderable: false,
					targets: 0,
					render: function(data, type, full, meta) {
						return '';
					}
				},

				{
					targets: 2, // 신청 상세
					render: function(data, type, full, meta) {
					  var $todoTitle = full['todoTitle'];
					  var $todoNo = full['todoNo'];

					 var detailUrl = `${contextPath}/gw/todoList/comTodoDetail.do?what=${$todoNo}`;

					  return '<a class="offcanClass" id="offcan" data-bs-toggle="offcanvas" href="#offcanvasRight" role="button" href="'
					      + 'aria-controls="offcanvasRight" data-detail-url=' + detailUrl + '>' + $todoTitle + '</a>';
}
				},
				{
					targets: 5, 
					render: function(data, type, full, meta) {
						 var $todoDate = full['todoDate']; 
						return '<i class="tf-icons bx bx-calendar-check"></i>'+ $todoDate;
					}
				},
				{
					targets: 3, 
					render: function(data, type, full, meta) {
						 var $todoStart = full['todoStart'].substring(2); 
						return '<i class="bx bx-alarm bx-16px me-2"></i>'+ $todoStart;
					}
				},
				{
					targets: 4, 
					render: function(data, type, full, meta) {
						 var $todoEnd = full['todoEnd'].substring(2); 
						return '<i class="bx bx-alarm bx-16px me-2"></i>'+ $todoEnd;
					}
				}
			],
			language: {
				paginate: {
					next: '<i class="bx bx-chevron-right bx-18px"></i>',
					previous: '<i class="bx bx-chevron-left bx-18px"></i>'
				}
			},
			orderCellsTop: true
		});
	}

	// on key up from input field
	$('input.dt-input').on('keyup', function() {
		filterColumn($(this).attr('data-column'), $(this).val());
	});

	// Filter form control to default size
	// ? setTimeout used for multilingual table initialization
	setTimeout(() => {
		$('.dataTables_filter .form-control').removeClass('form-control-sm');
		$('.dataTables_length .form-select').removeClass('form-select-sm');
	}, 200);
});
