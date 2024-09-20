<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="mb-6">
			<nav class="navbar navbar-expand-lg bg-primary card ">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">기업일정 관리</a>
				</div>
			</nav>
		</div>
		<!-- Advanced Search -->
		<div class="card">
			<!--Search Form -->
			<div class="card-body">
				<form class="dt_adv_search" method="GET">
					<div class="row">
						<div class="col-12">
							<div class="row g-3">
								<div class="col-12 col-lg-2">
									<input type="text" class="form-control dt-input"
										data-column="2" placeholder="일정 검색" data-column-index="1" />
								</div>
								<div class="col-12 col-sm-6 col-lg-3">
									<div class="mb-0">
										<input type="text"
											class="form-control dt-date flatpickr-range dt-input"
											data-column="4" placeholder="시작일자 검색" data-column-index="3"
											name="dt_date" /> <input type="hidden"
											class="form-control dt-date start_date dt-input"
											data-column="4" data-column-index="3"
											name="value_from_start_date" /> <input type="hidden"
											class="form-control dt-date end_date dt-input"
											name="value_from_end_date" data-column="4"
											data-column-index="3" />
									</div>
								</div>
								<button type="button" data-bs-toggle="modal"
									data-bs-target="#modalCenter" aria-controls="modalCenter"
									class="col-12 col-sm-6 col-lg-2  btn btn-label-primary "
									id="kanban-add-board-btn">
									<i class="bx bx-plus"></i> <span class="align-middle">일정 추가</span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="card-datatable table-responsive">
				<table class="dt-advanced-search table border-top">
					<thead>
						<tr>
							<th></th>
							<th>NO</th>
							<th>일정제목</th>
							<th>시작일자</th>
							<th>종료일자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th></th>
							<th>NO</th>
							<th>일정제목</th>
							<th>시작일자</th>
							<th>종료일자</th>
							<th>작성일</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<!--/ Advanced Search -->
	</div>
</div>
</div>
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
							<label for="title" class="form-label">제목</label>
							<input	type="text" id="title" name="todoTitle" class="form-control"
								placeholder="제목을 입력해주세요." />
						</div>
					</div>
					<div class="row">
						<div class="col mb-4">
							<label for="title" class="form-label">내용</label> <input
								type="text" id="content" name="todoContent" class="form-control"
								placeholder="제목을 입력해주세요." />
						</div>
					</div>
					<div class="row">
						<div class="col mb-0">
							<label for="dday" class="form-label">일정 시작일</label> <input
								type="datetime-local" name="todoStart" id="startdday"
								class="form-control dob-picker flatpickr-input active"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="col mb-0">
							<label for="dday" class="form-label">일정 종료일</label> <input
								type="datetime-local" name="todoEnd" id="enddday"
								class="form-control dob-picker flatpickr-input active"
								placeholder="YYYY-MM-DD">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="button" class="btn btn-label-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="dataInsertBtn" class="btn btn-label-primary">자동입력</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasRightLabel">상세 일정</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<div class="offcanvas-body"></div>
</div>
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true"></div>
<script type="text/javascript">
dataInsertBtn.addEventListener('click', ()=>{
	title.value = '개발 신규인원 OT ';
	content.value = '개발 3팀 신규인원의 OT를 HDC 3동 103호에서 진행 하고자 합니다';
	startdday.value = '2024-09-20 14:00';
	enddday.value = '2024-09-20 16:00';
});
</script>
<script defer
	src="${cPath}/resources/groupwareMember/assets/js/app-kanban2.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/company-todoList.js"></script>