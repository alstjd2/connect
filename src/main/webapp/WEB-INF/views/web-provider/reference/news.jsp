<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">


	<div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
		<h3 class="fw-bold mb-0">공지사항·업데이트 관리</h3>
	</div>
	<!-- Line Area Charts -->
	<div class="card shadow-none my-6 border-0 p-5">
		<div class="card-body row p-0 g-6">
			<div class="col-12 col-lg-10 card-separator">
				<div class="d-flex justify-content-between flex-wrap gap-4 me-12">
					<div class="d-flex align-items-center gap-4 me-6 me-sm-0">
						<div class="avatar avatar-lg">
							<div class="avatar-initial bg-label-primary rounded">
								<div></div>
							</div>
						</div>
						<div class="content-right">
							<p class="mb-0 fw-medium">총 게시물</p>
							<h4 class="text-primary mb-0">${noticeHeader.total }개</h4>
						</div>
					</div>
					<div class="d-flex align-items-center gap-4">
						<div class="avatar avatar-lg">
							<div class="avatar-initial bg-label-info rounded">
								<div></div>
							</div>
						</div>
						<div class="content-right">
							<p class="mb-0 fw-medium">공지사항</p>
							<h4 class="text-info mb-0">${noticeHeader.notice }개</h4>
						</div>
					</div>
					<div class="d-flex align-items-center gap-4">
						<div class="avatar avatar-lg">
							<div class="avatar-initial bg-label-warning rounded">
								<div></div>
							</div>
						</div>
						<div class="content-right">
							<p class="mb-0 fw-medium">업데이트</p>
							<h4 class="text-warning mb-0">${noticeHeader.update }개</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row col-12 col-lg-2 mt-6">
				<div class="d-flex justify-content-end align-items-center" style="position: relative;">
					<a class=" btn btn-success" href="${cPath}/w/notice/writeform.do">게시글 등록</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ag-grid사용 -->
	<div class="card">
		<div class="card-header mt-2 d-flex justify-content-between">
			<h4 class="card-title">게시글 목록</h4>
		</div>

		<div id="myGrid" style="height: 700px; width: 1300px"
			class="pb-5 ag-theme-quartz m-auto"></div>
	</div>
	<!-- ag-grid사용 end -->


<script
	src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>

<script>
			const promotionJsonStr = JSON.parse(`${promotionJsonStr}`);

			console.log("데이터 확인 ", `${noticeHeader}` );

			/* ------------------------------------- */

			//샘플 ROW 데이타 정의, DB Select의 1줄 Row들의 모임 list가 될거시당
			const rowData = promotionJsonStr;



			// var i = 1;
			// 통합 설정 객체, 아주 많은 속성들이 제공됨(일단 몇개만)
			const gridOptions = {
				autoSizeStrategy: {
				       type: 'autoSizeStrategy'
				},
				rowData : rowData,
// 				filter: true,
				columnDefs : [ // 컬럼 정의
				{
// 					headerName : "게시물 번호",
					field:'순번',
					valueGetter: 'node.rowIndex+1',
					maxWidth:100,
					minWidth:80
				}, {
					field : "commoncodeDetail.conmcdCode",
					headerName : "종류",
					cellStyle: {textAlign: "center"},
					minWidth:200
				}, {
					field : "boardTitle",
					headerName : "제목",
					cellStyle: {textAlign: "center"},
					minWidth:500
				}, {
					field : "boardDate",
					headerName : "등록날짜",
					cellStyle: {textAlign: "center"}
				}, {
					field : "boardDelyn",
					headerName : "노출여부",
					valueFormatter: function (params) {
						if( params == "Y" || params =="y"){
	                        return "미노출";
						}else{
	                        return "노출";
						}
                    },
					  cellStyle: {textAlign: "center"}
				} ],
				autoSizeStrategy : { // 자동사이즈정책
					type : 'fitGridWidth', // 그리드넓이기준으로
					defaultMinWidth : 60
				// 컬럼 최소사이즈
				},
				rowHeight : 50,
				defaultColDef: {
// 				    flex: 1,
				    filter: true
// 				    floatingFilter: true,
				  },
				  autoGroupColumnDef: {
				    field: "common.conmcdCode",
				  },
				  groupDefaultExpanded: -1,
			// row 높이지정

			//localeText 설정
			localeText:{
				//필터 관련 텍스트
				fileterOoo: '검색단어..',
				equals: '검색',
				notEqueal: '제외 대상',
				lessThan: '설정값보다 작은 값',
				greaterThan: '설정값보다 큰 값',
				lessThanOrEqual: '보다 적거나 같음',
				greaterThanOrEqual: '보다 크거나 같음',
				inRange: '범위 내',
				contains: '검색',
				notContains: '포함하지 않음',
				startsWith: '시작 값',
				endsWith: '끝 값',
				notBlank: '값 존재',
				blank: '값 미존재',
				doesnotequal :'검색 안함',
				notequal :'검색 안함',
				equal :'검색 안함',
				after: '끝 값',
				before: '시작 값'

			},

			// 페이지 설정
            pagination: true,
            //paginationAutoPageSize:true,  // 요게 열려있으면 아래껀 무시당함!
            paginationPageSizeSelector: [5, 10, 15, 20, 30],  // 원하는 페이지 수 나열
            paginationPageSize: 10,    // 위에 꺼 중 하나를 선택

            onCellClicked: params => {
//                 console.log('cell was clicked', params.data);
                // alert("클릭하신 값은: " + params.value); //요게 있음 뭔가? 방해됨
				// const boardNo = `${params.data}`;
				const boardNo=params.data.boardNo;
				location.href=`${cPath}/w/notice/detailPage.do?board=`+boardNo;
            	}

			};

			// selectionChanged 이벤트 핸들러
			function onSelectionChanged(event) {
			  var selectedRows = event.api.getSelectedRows(); // 선택된 row의 데이터 배열
			  var selectedNodes = event.api.getSelectedNodes(); // 선택된 row의 Node 객체 배열

			  selectedRows.forEach(function(selectedRow, index) {
			    console.log("Selected row " + index + " data: ", selectedRow); // 선택된 row의 데이터 출력
			    console.log("Selected row " + index + " index: ", selectedNodes[index].rowIndex); // 선택된 row의 인덱스 출력
			  });
			}

			const gridDiv = document.querySelector('#myGrid');
			//  new agGrid.Grid(gridDiv, gridOptions);  // deprecated
			const gridApi = agGrid.createGrid(gridDiv, gridOptions);

			/* ------------------------------------- */
		</script>




</div>