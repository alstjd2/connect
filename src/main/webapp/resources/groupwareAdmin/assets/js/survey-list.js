'use strict';

$(document).ready(function() {
	
	const contextPath = document.body.dataset.contextPath;
	
	
	const svyAllObj ={
		"Y": {title: '모두응답 선택'},
		"N": {title: '모두응답 미선택'} 
	}	
	const svyImpObj ={
		"Y": {title: '중요설문 선택'},
		"N": {title: '증요설문 미선택'} 
	}	
	const svyAnyObj ={
		"Y": {title: '익명투표 선택'},
		"N": {title: '익명투표 미선택'} 
	}
	
	var table = $('#example').DataTable({
		dom: "<'row py-5 align-items-center'<'col-sm-3 titel' and'><'col-sm-9 d-flex gap-3 justify-content-end'<''f><'newBtn' and '>>><'row pb-5'<'col-sm-3'<'#svyAll' and '>'><'col-sm-3'<'#svyImp' and '>'><'col-sm-3'<'#svyAny' and '>'><'col-sm-3'<'#status' and '>'>'><'#survey' and '><'row pt-5'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6 dataTables_pager'p>>",
        ajax: {
			"url":contextPath+"/gw/survey/myList",
			"dataSrc": ""
	  	},
        columns: [
            { data: 'svyAllYn' },
            { data: 'svyImpYn' },
            { data: 'svyAnyYn' },
            { data: 'svyNm' },
            { data: 'svyStatus' },
            { data: 'employee.empNm' },
            { data: 'svyStrDate' },
            { data: 'svyEndDate' },
            { data: 'actualRespondents' }
        ],
		order: [[8, "asc"],[7, "asc"],[2, "asc"]], 
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
	    initComplete: function() {
	        this.api()
            .columns(0)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 모두응답선택 </option></select>'
                )
                .appendTo('#svyAll')
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
						'<option value="' + d +'" class="text-capitalize">' + svyAllObj[d].title +'</option>'
					);
                });
	        });
	        this.api()
            .columns(1)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 중요설문선택 </option></select>'
                )
                .appendTo('#svyImp')
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
						'<option value="' + d +'" class="text-capitalize">' + svyImpObj[d].title +'</option>'
					);
                });
	        });
	        this.api()
            .columns(2)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 익명투표선택 </option></select>'
                )
                .appendTo('#svyAny')
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
						'<option value="' + d +'" class="text-capitalize">' + svyAnyObj[d].title +'</option>'
					);
                });
	        });
			this.api()
            .columns(4)
            .every(function () {
                let column = this;
                let select = $(
                '<select id="formName" class="form-select text-capitalize"><option value=""> 진행여부선택 </option></select>'
                )
                .appendTo('#status')
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

			$('.newBtn').html(`<a href="${contextPath}/gw/survey/create.do" class="btn btn-primary"><span class="tf-icons bx bx-plus bx-18px me-2"></span>설문생성</a>`);
			$('.titel').html(`<h5 class="fw-bold fs-4 mb-0">전체 설문</h5>`);
        });
		
	    }
        // 테이블 표시 숨기기
        //"bPaginate": false,
        //"bInfo": false,
        //"bFilter": false
	});
	// 데이터 로드 후 그리드 생성
    table.on('draw', function() {
        loadGrid(table);
    });

	
	function loadGrid(table) {
	    // 데이터 가져오기
	     var data = table.rows({ filter: 'applied' }).data();
	
	    // 그리드를 렌더링할 컨테이너
	    var survey = $('#survey');
		survey.addClass('row');
		survey.addClass('g-5');
	    survey.empty(); // 기존 그리드 초기화
        
	
	    // 각 데이터 행에 대해 그리드 항목 생성
	    data.each(function(rowData, index) {
		
	        var item = $('<div class="col-xl-4 col-lg-6 col-md-6"></div>');
	        
	        // 이미지 URL과 직원 이름 가져오기
			console.log();  
	        
			let imgUrl ="";
			if(rowData.employee.atchFile){				
				imgUrl = rowData.employee.atchFile.fileDetails[0].streFileNm;
			}
	        let empNm = rowData.employee.empNm;
			var colorClasses = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
			
			let firstLetter = empNm.charAt(0);
                
			var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
	        
	        // 프로필 이미지 또는 기본 아바타 설정
	        let profile = '';
	        if (imgUrl) {
	            profile = `<img src="/connect/files/${imgUrl}" alt="${empNm}" class="rounded-circle" />`;
	        } else {
	            profile = `<span class="avatar-initial rounded-circle bg-label-${randomColorClass}">${firstLetter}</span>`;
	        }



	        let svyNm = rowData.svyNm;
	
	        // 설문 상태 배지 설정
	        let status = '';
	        if (rowData.svyStatus === "진행중") {
	            status = `<span class="badge bg-success h-100 d-flex align-items-center">진행중</span>`;
	        } else if (rowData.svyStatus === "대기") {
	            status = `<span class="badge bg-secondary h-100 d-flex align-items-center">대기</span>`;
	        } else if (rowData.svyStatus === "종료") {
	            status = `<span class="badge bg-dark h-100 d-flex align-items-center">종료</span>`;
	        }
	        
	        let strDate = rowData.svyStrDate;
	        let endDate = rowData.svyEndDate;
	
	        // 설문 옵션 배지 설정
	        let svyImp = ''; // 중요설문
	        let svyAny = ''; // 익명투표
	        let svyAll = ''; // 모두응답
			let impBorder = '';
	        if (rowData.svyImpYn === "Y"){
				impBorder ='border border-danger';	
				svyImp = `<span class="badge bg-label-danger">중요설문</span>`;
			} 
	        if (rowData.svyAnyYn === "Y") svyAny = `<span class="badge bg-label-secondary">익명투표</span>`;
	        if (rowData.svyAllYn === "Y") {
	            svyAll = `<span class="badge bg-label-info">모두투표</span>`;
	            endDate = '모두 응답 시 종료';
	        }
	        
	        // 답변자 수 및 응답자 수 계산
	        let totalAns = rowData.totalAnswerees; // 답변자 수
	        let actialAns = rowData.actualRespondents; // 응답자 수
	        let percentage = 0;
	        if (totalAns !== 0) {
	            percentage = (actialAns / totalAns) * 100;
	        }
	        
	        // 내부 콘텐츠 생성
	        var content = `
	            <div class="card ${impBorder} h-100">
	              <div class="card-header d-block pb-4">
					  <div class="d-flex gap-3 pb-3">
						${svyImp} ${svyAny} ${svyAll}
					  </div>
	                <div class="d-flex justify-content-between">
	                  <div class="d-flex align-items-center">
	                    <div class="avatar me-4">
	                      ${profile}
	                    </div>
	                    <div class="me-2">
	                      <h5 class="mb-0">
	                        <a href="${contextPath}/gw/survey/detail.do?what=${rowData.svyNo}" class="stretched-link text-heading">${svyNm}</a>
	                      </h5>
	                      <p class="client-info text-body">${empNm}</p>
	                    </div>
	                  </div>
	                  <div>
	                      ${status}
	                  </div>
	                </div>
	              </div>
	              <div class="card-body">
	                <div>
	                  <div class="text-start mb-0">
	                    <p class="mb-1"><span class="text-heading fw-medium">시작일시: </span>${strDate}</p>
	                    <p class="mb-1"><span class="text-heading fw-medium">종료일시: </span>${endDate}</p>
	                  </div>
	                </div>
	              </div>
	              <div class="card-body border-top text-center">
					<div class="d-flex justify-content-between align-items-center mb-2">
	                  <p class="mb-0"><i class='bx bxs-user'></i><span class="text-heading fw-medium">${totalAns}</span>명 중 <span class="text-heading fw-medium">${actialAns}</span>명 응답</p>
	                  <small class="text-body">응답률 <span class="text-heading fw-medium">${percentage.toFixed(2)}%</span></small>
	                </div>
	                <div class="progress mb-4 rounded" style="height: 8px">
	                  <div
	                    class="progress-bar rounded"
	                    role="progressbar"
	                    style="width: ${percentage}%"
	                    aria-valuenow="${percentage}"
	                    aria-valuemin="0"
	                    aria-valuemax="100"></div>
	                </div>
	              </div>
	            </div>
	        `;
			
	        // 콘텐츠 추가
	        item.html(content);
	        // 그리드에 항목 추가
	        survey.append(item);
	    });
		//console.log(data.length);
		if(data.length==0) survey.html('데이터가 없습니다.');
	}
	
});