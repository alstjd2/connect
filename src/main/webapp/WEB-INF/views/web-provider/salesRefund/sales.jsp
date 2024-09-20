<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
	<!-- Line Area Charts -->

	<div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
		<h3 class="fw-bold mb-0">매출·환불 관리</h3>
	</div>

	<div class="row g-6 mb-5">
		<!--  -->
		<div class="col-lg-3 col-sm-6 fir">
			<div class="card card-border-shadow-primary h-100">
				<div class="card-header d-flex justify-content-between">
					<h5 class="card-title mb-0 ">회원수</h5>
					<span class="text-muted">전체 합산</span>
				</div>
				<div class="card-body">
					<div class="d-flex align-items-center mb-2">
						<div class="avatar me-4">
							<span class="avatar-initial rounded bg-label-primary"><i
								class="bx bxs-truck bx-lg"></i></span>
						</div>
						<h4 class="mb-0">${memTotal }명</h4>
					</div>
				</div>
			</div>
		</div>
		<!--  -->

		<!--  -->
		<div class="col-lg-3 col-sm-6 fir">
			<div class="card card-border-shadow-info h-100">
				<div class="card-header d-flex justify-content-between">
					<h5 class="card-title mb-0 ">등록기업수</h5>
					<span class="text-muted">전체 합산</span>
				</div>
				<div class="card-body">
					<div class="d-flex align-items-center mb-2">
						<div class="avatar me-4">
							<span class="avatar-initial rounded bg-label-info"><i
								class="bx bx-time-five bx-lg"></i></span>
						</div>
						<h4 class="mb-0">${comTotal.cntCom }개</h4>
					</div>
				</div>
			</div>
		</div>
		<!--  -->

		<!--  -->
		<div class="col-lg-3 col-sm-6 sec">
			<div class="card card-border-shadow-warning h-100">
				<div class="card-header d-flex justify-content-between">
					<h5 class="card-title mb-0 ">매출건</h5>
					<span class="text-muted">전체 합산</span>
				</div>
				<div class="card-body">
					<div class="d-flex align-items-center mb-2">
						<div class="avatar me-4">
							<span class="avatar-initial rounded bg-label-warning"><i
								class="bx bx-error bx-lg"></i></span>
						</div>
						<h4 class="mb-0">${buyTotal }건</h4>
					</div>
				</div>
			</div>
		</div>
		<!--  -->


		<!--  -->
		<div class="col-lg-3 col-sm-6 sec" >

			<div class="card card-border-shadow-danger h-100">
				<div class="card-header d-flex justify-content-between">
					<h5 class="card-title mb-0 ">환불건</h5>
					<span class="text-muted">전체 합산</span>
				</div>
				<div class="card-body">
					<div class="d-flex align-items-center mb-2">
						<div class="avatar me-4">
							<span class="avatar-initial rounded bg-label-danger"><i
								class="bx bx-git-repo-forked bx-lg"></i></span>
						</div>
						<h4 class="mb-0">${refn }건</h4>
					</div>
				</div>
			</div>
		</div>
		<!--  -->


		<!-- Line Charts -->
                <div class="card mb-6">
                  <div class="">
				<div class="card-header header-elements">
					<div>
						<h4 class="card-title">결제&환불 그래프</h4>
						<p class="card-subtitle my-0">매출과 환불을 볼 수 있는 그래프입니다.</p>

					</div>
					<div class="card-header-elements ms-auto py-0">
						<h5 class="mb-0 me-4"></h5>

						<span class="badge bg-label-danger">
							<h5 class="card-title mb-0 ">매출금액</h5>
							<h4 class="mb-0 " id="buy"></h4>
						</span> <span class="badge  bg-label-primary ">
							<h5 class="card-title mb-0 ">환불금액</h5>
							<h4 class="mb-0 " id="refn"></h4>
						</span>
					</div>
				</div>
				<div class="card-body pt-2">
                      <canvas id="lineChart" class="chartjs" data-height="500"></canvas>
                    </div>
                  </div>
                </div>
              <!-- /Line Charts -->

		<div class="row g-2 mb-5 mx-0 px-0">
  			<!-- Polar Area Chart 환불 리스트 -->
                <div class="col-xl-6 col-12 mb-6">
                  <div class="card">
                    <div class="card-header header-elements">
					<div>
						<h4 class="card-title">환불 사유</h4>
						<p class="card-subtitle my-0">환불 사유별 비중 그래프입니다.</p>
					</div>
					<div class="card-header-elements ms-auto py-0">
						<span class="badge bg-label-warning">
							<h5 class="mb-0 " id="pChartKey"></h5>
							<h4 class="mb-0 " id="pChart"></h4>
						</span>
					</div>
				</div>
                    <div class="card-body">
                      <canvas id="polarChart" class="chartjs"></canvas>
                    </div>
                  </div>
                </div>
                <!-- /Polar Area Chart -->

  			<!-- Donut Chart 상품별 구매 리스트 -->
				<div class="col-xl-6 col-12 mb-6">
					<div class="card">
						<div class="card-header header-elements row">
							<h4 class="card-title">상품별 구매</h4><br>
							<p class="card-subtitle my-0">월/년/이벤트 상품 구매그래프입니다.</p>
						</div>
						<div class="card-body">
							<div id="donutChart"></div>
						</div>
					</div>
				</div>
			<!-- /Donut Chart -->

</div>


	<!-- /Line Area Charts -->
		<div class="card">
            <div class="card-header header-elements row">
				<div class="mt-2 d-flex justify-content-between">
					<h4 class="card-title">결제&환불 목록</h4>
					<button onclick="onBtExport()" name="download" class=" btn badge bg-label-info" >
						엑셀 다운로드</button>
				</div>
                <p class="card-subtitle my-0">매출과 환불을 볼 수 있는 리스트입니다.</p>
			</div>
			<div id="myGrid" style="height: 700px; width: 1300px"
				class="pb-5 ag-theme-quartz m-auto"></div>
				<!-- 엑셀 내보내기 버튼 -->
		</div>
	</div>


	</div>




<script src="https://cdn.jsdelivr.net/npm/ag-grid-enterprise/dist/ag-grid-enterprise.min.js"></script>
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script> -->
<script>


	let buy = document.querySelector('#buy');
	let refn = document.querySelector('#refn');
	let count = 0;

	// polar Chart json 데이터
	const polar = JSON.parse(`${refnTypeCnt }`);

	let polarData =[];
	let polarLabels =[];

	polarLabels = Object.keys(polar);
	polarData = Object.values(polar);


	/* ------------------------------------- */
		let pChart = document.querySelector("#pChart");
		let pChartKey = document.querySelector("#pChartKey");
		pChart.innerHTML=polarData[0]+"건";
		pChartKey.innerHTML=polarLabels[0];
		let pChartCnt =polarData.length;
		console.log(pChartCnt);

		setTimeout(greeting,2000);

		let pChartSeq=1;

		function greeting(){
			pChartKey.innerHTML=polarLabels[pChartSeq];
			pChart.innerHTML=polarData[pChartSeq]+"건";
			pChartSeq++;
			setTimeout(greeting,1000);
			if(pChartSeq >=pChartCnt) pChartSeq=0;
		}


	/* ------------------------------------- */

	const mProd =`${prod.mProd}`;
	const yProd =`${prod.yProd}`;
	const eProd =`${prod.eProd}`;

	function onBtExport() {
	  gridApi.exportDataAsExcel();
	}

	const hwStr = JSON.parse(`${hwStr}`);	// 구매
	const refnList = JSON.parse(`${refnList}`);	//환불

	let labels = [];
	let data1 = [];
	let data2 = [];
	let data3 = [];	//구매 유지

	let buyAmount=0;
	let refnAmount=0;

	for (let i = 0; i < hwStr.length; i++) {
		let vRevenue = hwStr[i];

		labels.push(vRevenue.dateGroup.substr(0, 4) + "/"
				+ vRevenue.dateGroup.substr(4));
		data1.push(Math.round(vRevenue.revenue));
		buyAmount+=Math.round(vRevenue.revenue);
	}

	for (let i = 0; i < refnList.length; i++) {
		let vRevenue = refnList[i];

		data2.push(Math.round(vRevenue.revenue));
		refnAmount+=Math.round(vRevenue.revenue);
	}

	for (let i = 0; i < data1.length; i++) {
		data3.push(Math.round(data1[i]-data2[i]));
	}

	const buyJsonStr = JSON.parse(`${buyJsonStr}`);

	console.log("데이터 확인 ", buyJsonStr);


	/* ------------------------------------- */

	let counting1 = setInterval(function (){
		 if(count >= buyAmount){
			 count = buyAmount;
			 clearInterval(counting1);
		 }else{
			 count+= 123456;
		 }
		 buy.innerHTML = new Intl.NumberFormat().format(count);
	}, 60 );

	let counting2 = setInterval(function (){
		 if(count >= refnAmount){
			 count = refnAmount;
			 clearInterval(counting2);
		 }else{
			 count+= 1;
		 }
		 refn.innerHTML = new Intl.NumberFormat().format(count);
	}, 60 );

	/* ------------------------------------- */

	//샘플 ROW 데이타 정의, DB Select의 1줄 Row들의 모임 list가 될거시당
	const rowData = buyJsonStr;
	// var i = 1;
	// 통합 설정 객체, 아주 많은 속성들이 제공됨(일단 몇개만)
	const gridOptions = {
		rowData : rowData,
		columnDefs : [ // 컬럼 정의
		{
			field:'순번',
			valueGetter: 'node.rowIndex+1',
			maxWidth:100,
			minWidth:80,
			cellStyle: {textAlign: "center"}
		}, {
			field : "company.comNm",
			headerName : "회사명",
			cellStyle: {textAlign: "center"}
		}, {
			field : "prod.prodNm",
			headerName : "상품명",
			cellStyle: {textAlign: "center"}
		}, {
			field : "prod.prodPrice",
			headerName : "상품가격",
			cellClass: 'cell-right',
			valueFormatter: (params) => {
				return Number(params.value).toLocaleString()
				}
		}, {
			field : "buyUseStartDate",
			headerName : "사용 시작날짜",
			cellStyle: {textAlign: "center"},
			valueFormatter: function (p) {
                   const year = p.value.substring(0, 4);
                   const month =p.value.substring(4, 6);
                   const day =p.value.substring(6, 8);
				return year+"-"+month+"-"+day;
                       }
		}, {
			field : "buyUseEndDate",
			headerName : "사용 만료날짜",
			cellStyle: {textAlign: "center"},
			valueFormatter: function (p) {
                   const year = p.value.substring(0, 4);
                   const month =p.value.substring(4, 6);
                   const day =p.value.substring(6, 8);
				return year+"-"+month+"-"+day;
                       }
		},{
			field : "buyRefn",
			headerName : "환불여부",
			 valueFormatter: function (params) {
				if( params.value == "Y"){
                       return "환불";
				}else{
                       return "구매";
				}
              } ,
			  cellStyle: {textAlign: "center"}
		} ],
		autoSizeStrategy : { // 자동사이즈정책
			type : 'fitGridWidth', // 그리드넓이기준으로
			defaultMinWidth : 60
		// 컬럼 최소사이즈
		},
		rowHeight : 45,
	// row 높이지정
	 // 페이지 설정
          pagination: true,
          paginationAutoPageSize:true,  // 요게 열려있으면 아래껀 무시당함!
//           paginationPageSizeSelector: [20, 30, 40, 50,60],  // 원하는 페이지 수 나열
//           paginationPageSize: 20,    // 위에 꺼 중 하나를 선택
	};

	const gridDiv = document.querySelector('#myGrid');
	//  new agGrid.Grid(gridDiv, gridOptions);  // deprecated
	const gridApi = agGrid.createGrid(gridDiv, gridOptions);

	/* ------------------------------------- */
</script>



<!-- Vendors JS -->
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/chartjs/chartjs.js"></script>
<script src="${cPath}/resources/webProvider/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Flat Picker -->
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/moment/moment.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<!-- Page JS -->
<script defer src="${cPath}/resources/webProvider/assets/js/sales-datatables-advanced.js"></script>
<%-- <script defer src="${cPath}/resources/webProvider/assets/js/sales-charts.js"></script> --%>
<script defer src="${cPath}/resources/webProvider/assets/js/sales-charts-line.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/js/sales-charts-donut.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/js/charts-chartjs-polarChart.js"></script>