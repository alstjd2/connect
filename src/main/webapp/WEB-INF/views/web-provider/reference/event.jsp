<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
	<!-- Line Area Charts -->
	
	<div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
		<h3 class="fw-bold mb-0">이벤트<span class="fw-light">(오프라인·온라인·할인행사)</span> 관리</h3> 
	</div> 
	<div class="card mb-6 ">
		<div class="card-widget-separator-wrapper">
			<div class="card-body card-widget-separator">
				<div class="row gy-4 gy-sm-1">
					<div class="col-sm-6 col-lg-3">
						<div
							class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-4 pb-sm-0">
							<div>
								<p class="mb-1 ">등록 이벤트<small class="text-light fw-medium">(노출)</small></p>
								<h4 class="mb-1 text-primary">${cntA.total }개<small class="text-light fw-medium">/ 총 ${cnt.total }개</small></h4>
								<p class="mb-0"></p>
							</div>
							<button type="button" class=" px-1 me-2 btn btn-label-primary">
                              통계
                            </button>
						</div>
						<hr class="d-none d-sm-block d-lg-none me-6">
					</div>
					<div class="col-sm-6 col-lg-3">
						<div
							class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
							<div>
								<p class="mb-1">할인행사<small class="text-light fw-medium">(노출)</small></p>
								<h4 class="mb-1 text-info">${cntA.sale }개 <small class="text-light fw-medium">/ 총 ${cnt.sale }개</small></h4>
								<p class="mb-0"></p>
							</div>
							<button type="button" class=" px-1 me-2 btn btn-label-info">
                              미등록
                              <span class="badge bg-white text-info ms-1">${notInsertPromotion }</span>
                            </button>
						</div>
						<hr class="d-none d-sm-block d-lg-none">
					</div>
					<div class="col-sm-6 col-lg-3">
						<div
							class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
							<div>
								<p class="mb-1">오프라인 교육<small class="text-light fw-medium">(노출)</small></p>
								<h4 class="mb-1 text-warning ">${cntA.offe }개<small class="text-light fw-medium">/ 총 ${cnt.offe }개</small></h4>

							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="d-flex justify-content-between align-items-start">
							<div>
								<p class="mb-1">온라인 교육<small class="text-light fw-medium">(노출)</small></p>
								<h4 class="mb-1 text-warning">${cntA.one }개<small class="text-light fw-medium">/ 총 ${cnt.one }개</small></h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ag-grid사용 -->
	<div class="card">
		<div class="card-header mt-2 d-flex justify-content-between">
			<h4 class="card-title">이벤트 게시글 목록</h4>
			<div class="dropdown">
						<a class=" btn btn-success" href="${cPath}/w/eventWrite/saleForm.do" >게시글 등록 </a>
			</div>
		</div>
		<div id="myGrid" style="height: 700px; width: 95%"
			class="pb-5 ag-theme-quartz m-auto"></div>
	<!-- ag-grid사용 end -->
	</div>
</div>

	<script
	src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>

	<script>

	//ag-grid
			const promotionJsonStr = JSON.parse(`${promotionJsonStr}`);

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
					field:'순번',
					valueGetter: 'node.rowIndex+1',
					maxWidth:100,
					minWidth:80
				}, {
					field : "common.conmcdCode",
					headerName : "종류",
					cellStyle: {textAlign: "center"},
                    maxWidth:300,
				}, {
					field : "board.boardTitle",
					headerName : "제목",
					cellStyle: {textAlign: "center"},
				}, {
					field : "board.boardDate",
					headerName : "등록날짜",
					cellStyle: {textAlign: "center"},
                    maxWidth:300,
				}, {
					field : "board.boardDelyn",
					headerName : "삭제여부",
					valueFormatter: function (params) {
						if( params == "Y" || params =="y"){
	                        return "삭제";
						}else{
	                        return "미삭제";
						}
                    },
                    maxWidth:200,
					minWidth:150,
					  cellStyle: {textAlign: "center"}
				}   ],
				autoSizeStrategy : { // 자동사이즈정책
					type : 'fitGridWidth', // 그리드넓이기준으로
					defaultMinWidth : 60
				// 컬럼 최소사이즈
				},
				rowHeight : 50,
				defaultColDef: {
// 				    flex: 1,
				    filter: true,
// 				    floatingFilter: true,
				  },
				  autoGroupColumnDef: {
				    field: "athlete",
				  },
				  groupDefaultExpanded: -1,

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

			// row 높이지정
			 // 페이지 설정
            pagination: true,
            //paginationAutoPageSize:true,  // 요게 열려있으면 아래껀 무시당함!
            paginationPageSizeSelector: [5, 10, 15, 20, 30],  // 원하는 페이지 수 나열
            paginationPageSize: 10,    // 위에 꺼 중 하나를 선택
            onCellClicked: params => {
				const boardNo=params.data.boardNo;
				location.href=`${cPath}/w/promotion/detailPage.do?promotion=`+boardNo;
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