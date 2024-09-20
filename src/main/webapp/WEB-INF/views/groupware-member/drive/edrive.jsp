<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="app-addr card" >
		<div class="row g-0">
			<!-- Email Sidebar -->
			<div class="col app-addr-sidebar border-end flex-grow-0"
				id="app-addr-sidebar">
				<div class="btn-compost-wrapper d-grid">
					<h5 class="fw-bold mb-0 text-primary">
						<i class='bx bxs-hdd'></i> 드라이브
					</h5>
				</div>
				<!-- addr Filters -->
				<div class="addr-filters">
					<ul class="addr-filter-folders list-unstyled">
						<li></li>
						<li class="active d-flex mb-1">
							<a href="${cPath }/gw/edrive/edrivePage.do" class="d-flex flex-wrap align-items-center"> 
								<i class='bx bxs-user-pin'></i>
								<span class="align-middle ms-2">내드라이브</span>
							</a>
						</li>
						
						<!-- <li class="d-flex justify-content-between mb-1">
							<a href="" class="d-flex flex-wrap align-items-center">
								<i class='bx bxs-group'></i>
								<span class="align-middle ms-2">공용드라이브</span>
							</a>
						</li> -->
						
						<!-- <li class="d-flex justify-content-between align-items-center mb-1">
							<a href="" class="d-flex flex-wrap align-items-center">
								<i class="bx bx-star"></i>
								<span class="align-middle ms-2">즐겨찾기</span>
							</a>
						</li> -->
						
						<li class="d-flex align-items-center">
							<a href="${cPath }/gw/edrive/historyPage.do" class="d-flex flex-wrap align-items-center">
								<i class='bx bx-time-five'></i>
								<span class="align-middle ms-2">내최근기록</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--/ addr Sidebar -->

			<!-- addr List -->
			<div class="col app-emails-list">
				<div class="card shadow-none border-0 rounded-0">
					<div class="card-body emails-list-header p-3 py-2">
						<!-- Email List: Search -->
						<div
							class="d-flex justify-content-between align-items-center px-3 mt-2">
							<div class="d-flex align-items-center w-100">
								<i
									class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4 "
									data-bs-toggle="sidebar" data-target="#app-addr-sidebar"
									data-overlay></i>
								<!-- 파일명 검색기능 시작 -->
								<form action="">
									<div class="w-100">
										<div class="input-group input-group-merge shadow-none">
											<span class="input-group-text border-0 p-0 pe-4"
												id="addr-search">
												<button class="bx bx-search bx-md text-body" id="searchBtn"
													style="border: 0; background-color: transparent;"></button>
											</span>
											<form:input
												class="form-control addr-search-input border-0 py-0"
												path="condition.searchWord" placeholder=""
												aria-label="" />
										</div>
									</div>
								</form>
								<form:form id="searchform" method="get"
									modelAttribute="condition"
									action="${cPath }/gw/edrive/edrivePage.do">
									<form:input type="hidden" path="searchWord" />
									<input type="hidden" name="sfPath"
										value="${sfPath == null ? '' : sfPath }" />
									<input type="hidden" name="page" />
								</form:form>
								<!-- /파일명 검색기능 끝 -->
							</div>
						</div>
						<hr class="mx-n3 emails-list-header-hr mb-2" />
						<!-- arrd List: Actions -->
						<div
							class="d-flex justify-content-between align-items-center ps-1">
							<div class="d-flex align-items-center">
								<div class="dropdown">
									<button class="btn p-0" type="button" id="emailsActions"
										data-bs-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class='bx bx-folder-plus pe-2'></i> 새로만들기
									</button>
									<div class="dropdown-menu dropdown-menu-start"
										aria-labelledby="emailsActions">
										<a class="dropdown-item" href="${cPath }/gw/edrive/newFolderInsert.do?sfPath=${sfPath}">새폴더 만들기</a>
										<!-- 파일 업로드 시작 -->
										<form id="uploadForm"
											action="${cPath }/gw/edrive/fileUpload.do" method="post"
											enctype="multipart/form-data">
											<label for="uploadFile" class="dropdown-item"> 파일 올리기
												<input type="file" id="uploadFile" name="uploadFile"
												style="display: none" />
											</label> <input type="hidden" id="sfPath" name="sfPath"
												value="${sfPath == null ? '' : sfPath }" />
										</form>
										<!-- /파일 업로드 끝 -->
										<!-- <a class="dropdown-item" href="javascript:void(0)">스프레드시트
											파일 만들기</a> -->
									</div>
								</div>
							</div>
							<div>
								드라이브 경로: ${drivePath }
							</div>
							<!-- <div class="d-flex align-items-center">
								<span class="btn btn-icon me-1"> <i
									class="bx bx-refresh bx-md scaleX-n1-rtl cursor-pointer addr-refresh"></i>
								</span>
								<div class="dropdown">
									<button class="btn btn-icon p-0" type="button"
										id="emailsActions" data-bs-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<i class="bx bx-dots-vertical-rounded bx-md"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-end"
										aria-labelledby="emailsActions">
										<a class="dropdown-item" href="javascript:void(0)">Mark as
											read</a> <a class="dropdown-item" href="javascript:void(0)">Mark
											as unread</a> <a class="dropdown-item" href="javascript:void(0)">Delete</a>
										<a class="dropdown-item" href="javascript:void(0)">Archive</a>
									</div>
								</div>
							</div> -->
						</div>
					</div>
					<hr class="container-m-nx m-0" />
					<!-- arrd List: Items -->
					<div class="addr-list pt-0" id="content-area">
						<div class="table-responsive text-nowrap ">
							<table class="table card-table">
								<thead>
									<tr>
										<th class="border-top-0">종류 이름</th>
										<th class="border-top-0">크기</th>
										<th class="border-top-0">수정한 날짜</th>
										<th ><a  href="${cPath }/gw/edrive/edrivePage.do?backSfPath=${sfPath}">상위폴더로 이동</a></th>
									</tr>
								</thead>
								<tbody id="list-body" class="table-border-bottom-0">

									<!-- 동기방식 -> 비동기로 바꿈  -->

								</tbody>
							</table>
							<!-- <nav aria-label="Page navigation text-center">
                                                <ul class="pagination pagination-rounded justify-content-center pt-7">
                                                    <li class="page-item first">
                                                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left bx-sm"></i></a>
                                                    </li>
                                                    <li class="page-item prev">
                                                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left bx-sm"></i></a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0);">1</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0);">2</a>
                                                    </li>
                                                    <li class="page-item active">
                                                        <a class="page-link" href="javascript:void(0);">3</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0);">4</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0);">5</a>
                                                    </li>
                                                    <li class="page-item next">
                                                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right bx-sm"></i></a>
                                                    </li>
                                                    <li class="page-item last">
                                                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right bx-sm"></i></a>
                                                    </li>
                                                </ul>
                                            </nav> -->
						</div>
					</div>
				</div>
				<!-- Sidebar Right -->
				<div class="col app-addr-sidebar-right app-sidebar "
					id="app-addr-sidebar-right">
					<div class="nav-align-top nav-tabs-shadow mb-6">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link active" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-home" aria-selected="true">
									상세정보</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-profile"
									aria-controls="navs-top-profile" aria-selected="false"
									tabindex="-1">활동</button>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="navs-top-home"
								role="tabpanel">
								<h6>상세정보</h6>
								<dl class="row mb-0 text-heading">
									<dt class="col-6 fw-normal">Bag Total</dt>
									<dd class="col-6 text-end">$1198.00</dd>
									<dt class="col-6 fw-normal">Coupon Discount</dt>
									<dd class="col-6 text-primary text-end">Apply Coupon</dd>
									<dt class="col-6 fw-normal">Order Total</dt>
									<dd class="col-6 text-end">$1198.00</dd>
									<dt class="col-6 fw-normal">Delivery Charges</dt>
									<dd class="col-6 text-end">
										<s class="text-muted">$5.00</s> <span
											class="badge bg-label-success ms-1">Free</span>
									</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
								<ul class="timeline timeline-outline mb-0">
									<li
										class="timeline-item timeline-item-transparent border-left-dashed">
										<span class="timeline-point timeline-point-primary"></span>
										<div class="timeline-event">
											<div class="timeline-header mb-3">
												<h6 class="mb-0">12 Invoices have been paid</h6>
												<small class="text-muted">12 min ago</small>
											</div>
											<p class="mb-2">Invoices have been paid to the company</p>
											<div class="d-flex align-items-center mb-2">
												<div
													class="badge bg-lighter rounded d-flex align-items-center">
													<img src="assets/img/icons/misc/pdf.png" alt="img"
														width="15" class="me-2"> <span
														class="h6 mb-0 text-body">invoices.pdf</span>
												</div>
											</div>
										</div>
									</li>
									<li
										class="timeline-item timeline-item-transparent border-left-dashed">
										<span class="timeline-point timeline-point-success"></span>
										<div class="timeline-event">
											<div class="timeline-header mb-3">
												<h6 class="mb-0">Client Meeting</h6>
												<small class="text-muted">45 min ago</small>
											</div>
											<p class="mb-2">Project meeting with john @10:15am</p>
											<div
												class="d-flex justify-content-between flex-wrap gap-2 mb-2">
												<div class="d-flex flex-wrap align-items-center mb-50">
													<div class="avatar avatar-sm me-2">
														<img src="assets/img/avatars/1.png" alt="Avatar"
															class="rounded-circle">
													</div>
													<div>
														<p class="mb-0 small fw-medium">Lester McCarthy
															(Client)</p>
														<small>CEO of ThemeSelection</small>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li
										class="timeline-item timeline-item-transparent border-left-dashed">
										<span class="timeline-point timeline-point-info"></span>
										<div class="timeline-event">
											<div class="timeline-header mb-3">
												<h6 class="mb-0">Create a new project for client</h6>
												<small class="text-muted">2 Day Ago</small>
											</div>
											<p class="mb-2">6 team members in a project</p>
											<ul class="list-group list-group-flush">
												<li
													class="list-group-item d-flex justify-content-between align-items-center flex-wrap border-top-0 p-0">
													<div class="d-flex flex-wrap align-items-center">
														<ul
															class="list-unstyled users-list d-flex align-items-center avatar-group m-0 me-2">
															<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
																data-bs-placement="top" class="avatar pull-up"
																aria-label="Vinnie Mostowy"
																data-bs-original-title="Vinnie Mostowy"><img
																class="rounded-circle" src="assets/img/avatars/5.png"
																alt="Avatar"></li>
															<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
																data-bs-placement="top" class="avatar pull-up"
																aria-label="Allen Rieske"
																data-bs-original-title="Allen Rieske"><img
																class="rounded-circle" src="assets/img/avatars/12.png"
																alt="Avatar"></li>
															<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
																data-bs-placement="top" class="avatar pull-up"
																aria-label="Julee Rossignol"
																data-bs-original-title="Julee Rossignol"><img
																class="rounded-circle" src="assets/img/avatars/6.png"
																alt="Avatar"></li>
															<li class="avatar"><span
																class="avatar-initial rounded-circle pull-up"
																data-bs-toggle="tooltip" data-bs-placement="bottom"
																data-bs-original-title="3 more">+3</span></li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="my-6">
							<div class="text-center">
								<button type="button" class="btn btn-danger"
									data-bs-toggle="modal" data-bs-target="#delModal">
									<i class="bx bxs-trash"></i> 삭제
								</button>
								<!-- Modal -->
								<div class="modal fade" id="delModal" tabindex="-1"
									style="display: none;" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="delModalTitle">정말로
													삭제하시겠습니까?</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-label-secondary"
													data-bs-dismiss="modal">취소</button>
												<button type="button" class="btn btn-danger">삭제하기</button>
											</div>
										</div>
									</div>
								</div>
								<button type="button" class="btn btn-secondary"
									data-bs-toggle="modal" data-bs-target="#modalCenter">
									<i class="bx bxs-edit-alt"></i> 수정
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Sidebar Right -->
				<div class="app-overlay"></div>
			</div>
			<!-- /addr List -->

		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="folderRenameModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">폴더명 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="folderRenameForm" action="${cPath }/gw/edrive/folderRename.do" method="post">
      <div class="modal-body w-50 p-3">
      		<input type="text" class="form-control" id="folderRename" name="folderRename" placeholder="폴더명 수정"/>
      		<input type="hidden" class="form-control" name="sfPath"/>
      		<input type="hidden" class="form-control" name="folderDefaultname" id ="folderDefaultname"/>
      </div>
      <div class="modal-footer">
        <button id="modalBtn" type="submit" class="btn btn-primary">변경</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>


<script src="${cPath }/resources/js/app/jhjTa/groupware/edrive.js"></script>