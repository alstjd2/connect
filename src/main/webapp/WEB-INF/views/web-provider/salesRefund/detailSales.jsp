<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-xxl flex-grow-1 container-p-y">
    <!-- Column Search -->
    <div class="card">
        <h5 class="card-header pb-0 text-md-start text-center">Column Search</h5>
        <div class="card-datatable text-nowrap">
            <table class="dt-column-search table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Post</th>
                        <th>City</th>
                        <th>Date</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Post</th>
                        <th>City</th>
                        <th>Date</th>
                        <th>Salary</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <!--/ Column Search -->

<div class="row mt-10">

		<!-- Topic and Instructors -->
		<div class="row mb-6 g-6 mt-10">
			<div class="col-12 col-xl-8">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<h5 class="card-title m-0 me-2">Topic you are interested in</h5>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="topic"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded bx-lg text-muted"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end"
								aria-labelledby="topic">
								<a class="dropdown-item" href="javascript:void(0);">Highest
									Views</a> <a class="dropdown-item" href="javascript:void(0);">See
									All</a>
							</div>
						</div>
					</div>
					<div class="card-body row g-3">
						<div class="col-md-8">
							<div id="horizontalBarChart"></div>
						</div>
						<div
							class="col-md-4 d-flex justify-content-around align-items-center">
							<div>
								<div class="d-flex align-items-baseline">
									<span class="text-primary me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">UI Design</p>
										<h5>35%</h5>
									</div>
								</div>
								<div class="d-flex align-items-baseline my-12">
									<span class="text-success me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">Music</p>
										<h5>14%</h5>
									</div>
								</div>
								<div class="d-flex align-items-baseline">
									<span class="text-danger me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">React</p>
										<h5>10%</h5>
									</div>
								</div>
							</div>

							<div>
								<div class="d-flex align-items-baseline">
									<span class="text-info me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">UX Design</p>
										<h5>20%</h5>
									</div>
								</div>
								<div class="d-flex align-items-baseline my-12">
									<span class="text-secondary me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">Animation</p>
										<h5>12%</h5>
									</div>
								</div>
								<div class="d-flex align-items-baseline">
									<span class="text-warning me-2"><i
										class="bx bxs-circle bx-12px"></i></span>
									<div>
										<p class="mb-0">SEO</p>
										<h5>9%</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-xl-4 col-md-6">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">등록상품</h5>
						</div>
						<div class="dropdown">
							<button class="btn text-muted p-0" type="button"
								id="popularInstructors" data-bs-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded bx-lg"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end"
								aria-labelledby="popularInstructors">
								<a class="dropdown-item" href="javascript:void(0);">Select
									All</a> <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
								<a class="dropdown-item" href="javascript:void(0);">Share</a>
							</div>
						</div>
					</div>
					<div class="px-5 py-4 border border-start-0 border-end-0">
						<div class="d-flex justify-content-between align-items-center">
							<p class="mb-0 text-uppercase">Instructors</p>
							<p class="mb-0 text-uppercase">courses</p>
						</div>
					</div>
					<div class="card-body">
						<div
							class="d-flex justify-content-between align-items-center mb-6">
							<div class="d-flex align-items-center">
								<div class="avatar avatar me-4">
									<img src="../../assets/img/avatars/1.png" alt="Avatar"
										class="rounded-circle" />
								</div>
								<div>
									<div>
										<h6 class="mb-0 text-truncate">Maven Analytics</h6>
										<small class="text-truncate text-body">Business
											Intelligence</small>
									</div>
								</div>
							</div>
							<div class="text-end">
								<h6 class="mb-0">33</h6>
							</div>
						</div>
						<div
							class="d-flex justify-content-between align-items-center mb-6">
							<div class="d-flex align-items-center">
								<div class="avatar avatar me-4">
									<img src="../../assets/img/avatars/2.png" alt="Avatar"
										class="rounded-circle" />
								</div>
								<div>
									<div>
										<h6 class="mb-0 text-truncate">Bentlee Emblin</h6>
										<small class="text-truncate text-body">Digital
											Marketing</small>
									</div>
								</div>
							</div>
							<div class="text-end">
								<h6 class="mb-0">52</h6>
							</div>
						</div>
						<div
							class="d-flex justify-content-between align-items-center mb-6">
							<div class="d-flex align-items-center">
								<div class="avatar avatar me-4">
									<img src="../../assets/img/avatars/3.png" alt="Avatar"
										class="rounded-circle" />
								</div>
								<div>
									<div>
										<h6 class="mb-0 text-truncate">Benedetto Rossiter</h6>
										<small class="text-truncate text-body">UI/UX Design</small>
									</div>
								</div>
							</div>
							<div class="text-end">
								<h6 class="mb-0">12</h6>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex align-items-center">
								<div class="avatar avatar me-4">
									<img src="../../assets/img/avatars/4.png" alt="Avatar"
										class="rounded-circle" />
								</div>
								<div>
									<div>
										<h6 class="mb-0 text-truncate">Beverlie Krabbe</h6>
										<small class="text-truncate text-body">React Native</small>
									</div>
								</div>
							</div>
							<div class="text-end">
								<h6 class="mb-0">8</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- /Topic and Instructors -->


			<!-- Line Chart -->
			<div class="col-12 mb-6 mt-10">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div>
							<h5 class="card-title mb-0">사용자수,등록기업수</h5>
							<p class="card-subtitle my-0">Commercial networks &
								enterprises</p>
						</div>
						<div class="d-sm-flex d-none align-items-center">
							<h5 class="mb-0 me-4">$ 100,000</h5>
							<span class="badge bg-label-secondary"> <i
								class="bx bx-down-arrow-alt bx-xs text-danger"></i> <span
								class="align-middle">20%</span>
							</span>
						</div>
					</div>
					<div class="card-body">
						<div id="lineChart"></div>
					</div>
				</div>
			</div>
			<!-- /Line Chart -->




			<!-- Shipment statistics-->
			<div class="col-xxl-6 col-lg-7">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<div class="card-title mb-0">
							<h5 class="mb-1">날짜기준-총 구매,상품별(연간건/월간건) </h5>
							<p class="card-subtitle">Total number of deliveries 23.8k</p>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-label-primary">January</button>
							<button type="button"
								class="btn btn-label-primary dropdown-toggle dropdown-toggle-split"
								data-bs-toggle="dropdown" aria-expanded="false">
								<span class="visually-hidden">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="javascript:void(0);">January</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">February</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">March</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">April</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">May</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">June</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">July</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">August</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">September</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">October</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">November</a></li>
								<li><a class="dropdown-item" href="javascript:void(0);">December</a></li>
							</ul>
						</div>
					</div>
					<div class="card-body">
						<div id="shipmentStatisticsChart"></div>
					</div>
				</div>
			</div>
			<!--/ Shipment statistics -->

		</div>






</div>
<!-- Vendors JS -->
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="${cPath}/resources/webProvider/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Flat Picker -->
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/moment/moment.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<!-- Page JS -->
<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/detailSales-horizontalBarChart.js" ></script>
<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/detailSales-lineChart.js" ></script>
<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/detailSales-shipmentStatisticsChart.js" ></script>
