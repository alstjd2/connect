<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="card-datatable table-responsive">
<div class="container-xxl flex-grow-1 container-p-y">
<div class="card mb-6">
	<nav class="navbar navbar-expand-lg bg-primary">
${todoList }
		<div class="container-fluid">
			<a class="navbar-brand " href="javascript:void(0)">기업일정</a>
			<button type="button" data-bs-toggle="modal"
				data-bs-target="#modalCenter" aria-controls="modalCenter"
				class="kanban-add-board-btn btn " id="kanban-add-board-btn">
				<i class="bx bx-plus"></i> <span class="align-middle">일정추가</span>
			</button>
		</div>
	</nav>
	</div>
	<div class="card mb-6">
	<div id="DataTables_Table_0_wrapper"
		class="dataTables_wrapper dt-bootstrap5 mt-7 mb-6">
		<div class="row">
			<div class="col-sm-12">
				<table class="dt-advanced-search table border-top dataTable"
					id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
					style="width: 1392px;">
					<thead>
						<tr>
							<th class="control sorting_disabled sorting_asc" rowspan="1"
								colspan="1" aria-label="" style="width: 28px;"></th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="NO: activate to sort column ascending"
								style="width: 58px;">NO</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="연차종류: activate to sort column ascending"
								style="width: 144px;">일정제목</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="시작일자: activate to sort column ascending"
								style="width: 144px;">시작일자</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="사용연차일수: activate to sort column ascending"
								style="width: 136px;">종료일자</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="상태: activate to sort column ascending"
								style="width: 131px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${todoList}" var="todoList">
							<tr class="odd">
								<td></td>
								<td>${todoList.rnum}</td>
								<td>
									<c:url value="/gw/todoList/comTodoDetail.do"	var="empTodoDetailUrl">
										<c:param name="what" value="${todoList.todoNo }" />
									</c:url>
									<a class="offcanClass" id="offcan" data-bs-toggle="offcanvas"
										href="#offcanvasRight" role="button"
										aria-controls="offcanvasRight"
										data-detail-url="${empTodoDetailUrl }">
											${todoList.todoTitle }</a>
								</td>
								<td><i class="bx bx-up-arrow-circle bx-lg text-heading"></i> ${todoList.todoStart }</td>
								<td><i class="bx bx-down-arrow-circle bx-lg text-heading"></i> ${todoList.todoEnd }</td>
								<td><i class='bx bx-calendar'></i> ${todoList.todoDate }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th class="control" rowspan="1" colspan="1"></th>
							<th rowspan="1" colspan="1">NO</th>
							<th rowspan="1" colspan="1">일정제목</th>
							<th rowspan="1" colspan="1">시작일자</th>
							<th rowspan="1" colspan="1">종료일자</th>
							<th rowspan="1" colspan="1">작성일</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-6">
				<div class="dataTables_info" id="DataTables_Table_0_info"
					role="status" aria-live="polite"></div>
			</div>
			<div class="col-sm-12 col-md-6 dataTables_pager">
				<div class="dataTables_paginate paging_simple_numbers"
					id="DataTables_Table_0_paginate">
					<ul class="pagination">
						<li class="paginate_button page-item previous disabled"
							id="DataTables_Table_0_previous"><a
							aria-controls="DataTables_Table_0" aria-disabled="true"
							role="link" data-dt-idx="previous" tabindex="-1"
							class="page-link"><i class="bx bx-chevron-left bx-18px"></i></a></li>
						<li class="paginate_button page-item active"><a href="#"
							aria-controls="DataTables_Table_0" role="link"
							aria-current="page" data-dt-idx="0" tabindex="0"
							class="page-link">1</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="DataTables_Table_0" role="link" data-dt-idx="1"
							tabindex="0" class="page-link">2</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="DataTables_Table_0" role="link" data-dt-idx="2"
							tabindex="0" class="page-link">3</a></li>
						<li class="paginate_button page-item next"
							id="DataTables_Table_0_next"><a href="#"
							aria-controls="DataTables_Table_0" role="link" data-dt-idx="next"
							tabindex="0" class="page-link"><i
								class="bx bx-chevron-right bx-18px"></i></a></li>
					</ul>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>




<!-- 일정추가 모달 -->
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<form id='insertForm' method="post"
				action="${cPath }/gw/todoList/comTodoListInsert.do">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">일정추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col mb-4">
							<label for="title" class="form-label">제목</label> <input
								type="text" id="title" name="todoTitle" class="form-control"
								placeholder="제목을 입력해주세요." />
						</div>
					</div>
					<div class="row">
						<div class="col mb-4">
							<label for="title" class="form-label">내용</label> <input
								type="text" id="title" name="todoContent" class="form-control"
								placeholder="제목을 입력해주세요." />
						</div>
					</div>
					<div class="row">
						<div class="col mb-0">
							<label for="dday" class="form-label">일정 시작일</label> <input
								type="datetime-local" name="todoStart" id="dday"
								class="form-control dob-picker flatpickr-input active"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="col mb-0">
							<label for="dday" class="form-label">일정 종료일</label> <input
								type="datetime-local" name="todoEnd" id="dday"
								class="form-control dob-picker flatpickr-input active"
								placeholder="YYYY-MM-DD">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-label-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">저장</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 상세일정 오프캔버스 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasRightLabel">상세 일정</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<div class="offcanvas-body"></div>
</div>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/app-kanban2.js"></script>
