/**
 * DataTables Advanced (jquery)
 */

'use strict';

$(function () {
    moment.locale('ko');

    var dt_adv_filter_table = $('.dt-advanced-search'),
    startDateEle = $('.start_date'),
    endDateEle = $('.end_date'),
    statusObj = {
        1: { title: '진행중', class: 'bg-label-secondary' },
        2: { title: '승인완료', class: 'bg-label-success' },
        3: { title: '반려', class: 'bg-label-warning' }
      };

  // Advanced Search Functions Starts
  // --------------------------------------------------------------------


  // Datepicker for advanced filter
  var rangePickr = $('.flatpickr-range'),
    dateFormat = 'MM/DD/YYYY';

  if (rangePickr.length) {
    rangePickr.flatpickr({
      mode: 'range',
      dateFormat: 'm/d/Y',
      orientation: isRtl ? 'auto right' : 'auto left',
      locale: 'ko',
      onClose: function (selectedDates, dateStr, instance) {
        var startDate = '',
          endDate = new Date();
        if (selectedDates[0] != undefined) {
          startDate = moment(selectedDates[0]).format('MM/DD/YYYY');
          startDateEle.val(startDate);
        }
        if (selectedDates[1] != undefined) {
          endDate = moment(selectedDates[1]).format('MM/DD/YYYY');
          endDateEle.val(endDate);
        }
        $(rangePickr).trigger('change').trigger('keyup');
      }
    });
  }

  // Filter column wise function
  function filterColumn(i, val) {
    if (i == 4) {
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
  // Advanced Search Functions Ends


  // Advanced Search
  // --------------------------------------------------------------------

  // Advanced Filter table
  if (dt_adv_filter_table.length) {
    var dt_adv_filter = dt_adv_filter_table.DataTable({
      dom: "<'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
      ajax: assetsPath + 'json/myInfo-vacation.json',
      columns: [
        { data: '' },
        { data: 'app_no' },
        { data: 'vaci_nm' },
        { data: 'app_detail' },
        { data: 'app_strdate' },
        { data: 'days' },
        { data: 'app_state' }
      ],

      columnDefs: [
        {
          className: 'control',
          orderable: false,
          targets: 0,
          render: function (data, type, full, meta) {
            return '';
          }
        },
        {
          // User Role
          targets: 2,
          render: function (data, type, full, meta) {
            var $role = full['vaci_nm'];
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
            targets:3,
            render: function (data, type, full, meta) {
                var $appDetail = full['app_detail'];
                var $row_output =
                    '<a href="myInfo-vacation-detail.html">'+$appDetail+'</a>'
                return $row_output;
            }
        },
        {
          // User Status
          targets: 6,
          render: function (data, type, full, meta) {
            var $status = full['app_state'];

            return (
              '<span class="badge ' +
              statusObj[$status].class +
              '" text-capitalized>' +
              statusObj[$status].title +
              '</span>'
            );
          }
        }
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

  // on key up from input field
  $('input.dt-input').on('keyup', function () {
    filterColumn($(this).attr('data-column'), $(this).val());
  });

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 200);
});
