<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<div class="container-xxl flex-grow-1 container-p-y blog-single ">
	<div class="py-4 mb-4 mt-10">
		<div class="demo-inline-spacing pb-5 d-flex justify-content-between">
			<a href="${cPath }/w/promotion/list.do" type="button"
				class="btn rounded-pill btn-outline-primary">
				<i class='bx bx-arrow-back pe-2'></i> 뒤로가기
			</a>
		</div>
	</div>
	<div class="card my-5 py-10 px-10">
		<div class="detail-inner ">
			<!-- post meta -->
			<div class="row col-12">
				<div class="col-10">
					<h4 class="mb-0">
						이벤트 | <b>오프라인</b>
					</h4>
					<h2 class="post-title mb-4 ">${promotion.board.boardTitle }</h2>
				</div>
				<div class="col-2">
					<div class="d-flex justify-content-between align-items-center"
						style="position: relative;"></div>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

					<c:if test="${today <= promotion.promoEnddate }">
						<h4><span class="badge bg-label-warning">진행중</span></h4>
					</c:if>
					<c:if test="${today > promotion.promoEnddate }">
						<h4><span class="badge bg-label-danger">진행마감</span></h4>
					</c:if>
				</div>
				<hr>
			</div>
			<div class="board-content pb-0">
				<div class="post-thumbnils"></div>
				<p>${promotion.board.boardContent }</p>
			</div>

		</div>
		<div>
<!-- 			<a href="javascript:;" data-bs-toggle="modal" -->
<!--                data-bs-target="#boardModal" class="btn btn-success modal-dialog-centered"> -->
<!--                                  수정하기</a> -->
<button class="btn btn-label-info"  data-bs-toggle="modal" data-bs-target="#boardModal">수정하기</button>
			<a href="#" id="boarDel" class="btn btn-label-dark">삭제하기</a>
		</div>
	</div>

	<div class="row">
		<!-- Doughnut Chart -->
		<div class="col-4 mb-6">
			<div class="card">
					<div class="card-header  row">
						<h4 class="col-7" >기업별 신청 현황</h4>

						<h4 class="col-5 text-warning pe-0" style="display: flex; justify-content: flex-end;">
							 ${peopleCnt }명 <small class="text-secondary"> / ${promotion.promoNum }명</small>
						</h4>
					</div>
				<div class="card-body">
					<canvas id="doughnutChart" class="chartjs mb-6" data-height="350">
                      </canvas>
						<h4>신청 진행률</h4>
					<div class="d-flex align-items-center">
						<div class="progress w-100 me-2" style="height: 8px">
							<div class="progress-bar bg-info shadow-none"
								style="width: ${peopleCnt/promotion.promoNum*100 }%"
								role="progressbar"
								aria-valuenow="${peopleCnt/promotion.promoNum*100 }"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<fmt:formatNumber type="number" maxFractionDigits="0"
						value="${peopleCnt/promotion.promoNum*100 }" />%
<%-- 						<small>${peopleCnt/promotion.promoNum*100 }%</small> --%>
					</div>
				</div>

			</div>
		</div>
		<!-- /Doughnut Chart -->
		<div class="col-8 mb-6">
			<div class="card">
				<div class="row card-header  pt-5 px-3">
					<h4 class="col-4">신청 현황</h4>
					<div class="col-8 " style="display: flex; justify-content: flex-end;">
					<!-- 엑셀 내보내기 버튼 -->
						<button onclick="onBtExport()" name="download"
							class="ms-3 btn rounded-pill btn-label-warning" >엑셀 다운로드</button>
					</div>

				</div>
				<div class="card-body me-0">
					<div id="myGrid" style="height: 500px; max-width: 800px"
						class="pb-5 ag-theme-quartz m-auto"></div>
				</div>
			</div>
		</div>
	</div>


<!-- 모달 -->
<div class="modal modal-xl" id="boardModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">

		<form class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="backDropModalTitle">게시글 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col mb-6">
						<input
							type="hidden" id="nameBackdrop" class="form-control"
							value="${promotion.board.boardNo }" >
						<label for="nameBackdrop" class="form-label">제목</label>
						<input
							type="text" id="nameBackdrop" class="form-control"
							value="${promotion.board.boardTitle }">
					</div>
				</div>
				<div class="row g-6">
					<div class="col mb-0">
						<label for="emailBackdrop" class="form-label">내용</label>
						<textarea name="boardContent" class="form-control pt-10 pb-10"
							style="height:50vh;" >${promotion.board.boardContent }
							</textarea>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</form>

	</div>
</div>

	<!-- chart.js -->
	<script type="text/javascript">
		const list = JSON.parse(`${salePromoBuyList}`);
		let labels = [];
		let data1 = [];
		let maxAmount = 0;

		for (let i = 0; i < list.length; i++) {
			let cnt = list[i];
			console.log("buyList.length :", list[i]);

			labels.push(cnt.memNm);
			data1.push(cnt.offeduOfferNum);
		}
		console.log("list 출력");
		console.log(list);
	</script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- ag-gird 엑셀 내보내기 기능포함-->
	<script
		src="https://cdn.jsdelivr.net/npm/ag-grid-enterprise/dist/ag-grid-enterprise.min.js"></script>
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script> -->

	<script>
	function onBtExport() {
		  gridApi.exportDataAsExcel();
		}
/*
	 const editor = new toastui.Editor({
         el: document.querySelector('#bContent'), // 에디터를 적용할 요소 (컨테이너)
         height: '60vh',                        // 에디터 영역의 높이 값 (OOOpx || auto)
         initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
         initialValue: '${promotion.board.boardContent}',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
         previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)

     });
	  */
			/* ------------------------------------- */

			//샘플 ROW 데이타 정의, DB Select의 1줄 Row들의 모임 list가 될거시당
			// 통합 설정 객체, 아주 많은 속성들이 제공됨(일단 몇개만)
			const gridOptions = {
				autoSizeStrategy: {
				       type: 'autoSizeStrategy'
				},
				rowData : list,
// 				filter: true,
				columnDefs : [ // 컬럼 정의
				/* {
					checkboxSelection: true,
					field: "선택",
					minWidth: 60,
					maxWidth: 60,
					filter: false
				},  */
				{
					field:'순번',
					valueGetter: 'node.rowIndex+1',
					maxWidth:100,
					minWidth:80
				},{
					field : "memNm",
					headerName : "기업명",
					cellStyle: {textAlign: "center"},
					minWidth: 220
				}, {
					field : "offeduComnm",
					headerName : "신청자",
					cellStyle: {textAlign: "center"}
				}, {
					field : "offeduOfferNum",
					headerName : "신청인원",
					cellStyle: {textAlign: "right"}
				}],
				autoSizeStrategy : { // 자동사이즈정책
					type : 'fitGridWidth', // 그리드넓이기준으로
					defaultMinWidth : 60
				// 컬럼 최소사이즈
				},
				rowHeight : 45,
				defaultColDef: {
// 				    flex: 1,
				    filter: true,
// 				    floatingFilter: true,
				  },
				  autoGroupColumnDef: {
				    field: "athlete",
				  },
				  groupDefaultExpanded: -1,
				  export: true,
			// row 높이지정
			 // 페이지 설정
            pagination: true,
            //paginationAutoPageSize:true,  // 요게 열려있으면 아래껀 무시당함!
            paginationPageSizeSelector: [5, 10, 15, 20, 30],  // 원하는 페이지 수 나열
            paginationPageSize: 10,    // 위에 꺼 중 하나를 선택
             onCellClicked: params => {
//                 console.log('cell was clicked', params.data);
                // alert("클릭하신 값은: " + params.value); //요게 있음 뭔가? 방해됨
				// const boardNo = `${params.data}`;
				const boardNo=params.data.memNm;
				location.href=`${cPath}/w/company/detail.do?company=`+memNm;
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
<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/event-view-off.js" ></script>