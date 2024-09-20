/**
 * app-ecommerce-product-list
 */

'use strict';

// Datatable (jquery)
$(function () {
	
	const contextPath = document.body.dataset.contextPath;
	var dt_insert_table = $('.dt-insert'),
    statusObj = {
        "DB06110": { title: '결재대기', class: 'bg-label-info', icon:"bx bx-pause-circle", color:'info', comment :'내가 결재해야 하는 문서'},
        "DB06120": { title: '결재예정', class: 'bg-label-success', icon:"bx bx-left-arrow-circle", color:'success', comment :'이전 결재선에서 대기중인 문서' },
        "DB06130": { title: '결재처리', class: 'bg-label-secondary', icon:"bx bx-play-circle" , color:'secondary', comment :'내가 작성하였거나 승인한 문서'},
        "DB06140": { title: '결재반려', class: 'bg-label-danger', icon:"bx bx-minus-circle", color:'danger', comment :'내가 반려 처리한 문서' },
        "DB06150": { title: '결재전결', class: 'bg-label-warning', icon:"bx bx-fast-forward-circle", color:'warning', comment :'내가 전결 처리한 문서' }
    } ;
  
  var lang = 'Korean';
  if (dt_insert_table.length) {
    var table_language = dt_insert_table.DataTable({
      ajax: {
			"url":contextPath+"/gw/document/insertList",
			"dataSrc": ""
	  },
      columns: [
        { data: 'dcmCtgNo' },
        { data: 'category.dcmCtgNm' },
        { data: 'dcmFormCode' },
        { data: 'dcmFormNm' }
      ],
      columnDefs: [
        {
          targets: 3,
          render: function (data, type, full, meta) {
            var $dcmFormNm = full['dcmFormNm'],
                $dcmFormCode = full['dcmFormCode'];
            return (
              '<a href="'+contextPath+'/gw/document/insert/'+$dcmFormCode+'.do">'+$dcmFormNm+'</a>'
            );
          }
        }
      ],
      language: {
        url: '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/' + lang + '.json',
        paginate: {
          next: '<i class="bx bx-chevron-right bx-18px"></i>',
          previous: '<i class="bx bx-chevron-left bx-18px"></i>'
        }
      },
      order: [[0, 'asc']],
      displayLength: 47,
      dom: '<"row"<"col-md-4"f><"col-md-4 d-flex align-items-center"><"col-md-4 d-flex align-items-center">>t',
	  initComplete: function() {
	      // 'col-md-6' div에 'h5' 태그 추가
	      //$('.col-md-6:eq(0)').prepend('<h5 class="mb-0">문서 서식 전체</h5>');
		  $('.dataTables_filter input').attr('placeholder', '카테고리 및 서식 검색이 가능합니다.');

		  $('.dataTables_filter label').attr('style', 'display: block; width: calc(100% - 50px);');
		  $('.dataTables_filter input').attr('style', 'width: 100%');

		this.api()
            .columns(1)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 카테고리명 선택 </option></select>'
                )
                .appendTo('.col-md-4:eq(1)')
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
            .columns(3)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 문서서식명 선택</option></select>'
                )
                .appendTo('.col-md-4:eq(2)')
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

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 300);
});
