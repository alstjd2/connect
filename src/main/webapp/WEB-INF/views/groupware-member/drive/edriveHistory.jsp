<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${cPath }/resources/js/app/jhjTa/css/edriveHistory.css"  >

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="app-addr card" >
		<div class="row g-0">
			<!-- Email Sidebar -->
			<div class="col app-addr-sidebar border-end flex-grow-0"
				id="app-addr-sidebar">
				<div class="btn-compost-wrapper d-grid">
					<h5 class="fw-bold mb-0 text-primary">
						<i class='bx bxs-file'></i> 최근기록
					</h5>
				</div>
				<!-- addr Filters -->
				<div class="addr-filters">
					<ul class="addr-filter-folders list-unstyled">
						<li></li>
						<li class="d-flex mb-1">
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
						
						<li class="active d-flex align-items-center">
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
			<div class="col app-emails-list tableBox" >
				<div class="card shadow-none border-0 rounded-0">
					<!-- arrd List: Items -->
					<div class="addr-list pt-0" id="content-area">
						<div class="table-responsive text-nowrap">
							<table class="table card-table tableData">
								<thead>
									<tr>
										<th class="border-top-0">경로</th>
										<th class="border-top-0">파일명</th>
										<th class="border-top-0">파일 확장자</th>
										<th class="border-top-0">크기</th>
										<th class="border-top-0">내용</th>
										<th class="border-top-0">수정한 날짜</th>
									</tr>
								</thead>
								<tbody id="list-body" class="table-border-bottom-0">
									<c:forEach items="${edrivelogList }" var="edrivelog" >
										<tr>
<%-- 											<td>
											<div class="d-flex flex-column ">
												<span class="emp_name text-truncate"> 
													${edrivelog.edrivelogFileNm }
												</span>
												<small class="emp_post text-truncate text-muted">
													${edrivelog.edrivelogFileFancysize }
												</small>
											</div>
											</td> --%>
 											<td>${edrivelog.edrivelogViewpath }</td> 
 											<td>${edrivelog.edrivelogFileNm }</td> 
											<td>${edrivelog.edrivelogFileExtsn }</td>
											<td>${edrivelog.edrivelogFileFancysize }</td>
											<td>
												${edrivelog.edrivelogStateNm }
												<c:if test="${not empty edrivelog.edrivelogCon}">(${edrivelog.edrivelogCon})</c:if>
											</td>
<%-- 											<td>${edrivelog.edrivelogCon }</td> --%>
											<td>${edrivelog.edrivelogDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
<!-- 				<div class="app-overlay"></div> -->
			</div>
			<!-- /addr List -->

		</div>
	</div>
</div>

<script src="${cPath }/resources/js/app/jhjTa/groupware/edriveHistory.js"></script>