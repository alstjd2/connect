<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 현재의 css -->
<link rel="mystyleshtee" href="${cPath }/resources/js/app/jhjTa/css/calendar.css" />
<!-- flatpickr의 css -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="card app-calendar-wrapper overflow-hidden">
		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="javascript:void(0)">
					<i class="menu-icon bx bx-calendar"></i>
					캘린더
				</a>
			</div>
		</nav>
		<div class="row g-0">
			<!-- Calendar Sidebar -->
			<div class="col app-calendar-sidebar border-end"
				id="app-calendar-sidebar">
				<div class="border-bottom p-6 my-sm-0 mb-4">
					<button class="btn btn-info btn-toggle-sidebar w-100"
						data-bs-toggle="modal" data-bs-target="#modalCenter"
						aria-controls="modalCenter">
						<i class="bx bx-plus bx-16px me-2"></i> <span class="align-middle">일정추가</span>
					</button>
				</div>
				<div class="border-bottom p-6 my-sm-0 mb-4">
					<button class="btn btn-success btn-toggle-sidebar w-100"
						data-bs-toggle="modal" data-bs-target="#largeModal"
						aria-controls="modalCenter">
						<i class="bx bx-plus bx-16px me-2"></i> <span class="align-middle">부서
							일정추가</span>
					</button>
				</div>
				<div class="px-6 pt-6">
					<!-- Filter -->
					<div>
						<h5>일정 분류</h5>
					</div>

					<div class="form-check form-check-secondary mb-5 ms-2">
						<input class="form-check-input select-all" type="checkbox"
							id="selectAll" data-value="all" checked /> <label
							class="form-check-label" for="selectAll">모두 보기</label>
					</div>
					<div class="app-calendar-events-filter text-heading">
						<!-- <div class="form-check form-check-danger mb-5 ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-personal" data-value="personal" checked /> <label
								class="form-check-label" for="select-personal">Personal</label>
						</div>
						<div class="form-check mb-5 ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-business" data-value="business" checked /> <label
								class="form-check-label" for="select-business">Business</label>
						</div>
						<div class="form-check form-check-warning mb-5 ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-family" data-value="family" checked /> <label
								class="form-check-label" for="select-family">Family</label>
						</div> -->
						<div class="form-check form-check-warning mb-5 ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-company" data-value="company" checked /> <label
								class="form-check-label" for="select-company">회사 일정</label>
						</div>
						<div class="form-check form-check-success mb-5 ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-dep" data-value="dep" checked /> <label
								class="form-check-label" for="select-dep">부서 일정</label>
						</div>
						<div class="form-check form-check-info ms-2">
							<input class="form-check-input input-filter" type="checkbox"
								id="select-employee" data-value="employee" checked /> <label
								class="form-check-label" for="select-employee">내 일정</label>
						</div>
					</div>
				</div>
			</div>
			<!-- /Calendar Sidebar -->

			<!-- Calendar & Modal -->
			<div class="col app-calendar-content">
				<div class="card shadow-none border-0">
					<div class="card-body pb-0">

						<!-- 실제 화면을 담을 영역 시작 -->
					    <div id="Wrapper">
					        <div id='calendar'></div>
					    </div>
					    <!-- /실제 화면을 담을 영역 끝 -->

					</div>
				</div>
				<div class="app-overlay"></div>

				<!-- FullCalendar Offcanvas -->
<div class="offcanvas offcanvas-end event-sidebar" tabindex="-1" id="addEventSidebar" aria-labelledby="addEventSidebarLabel">

    <div class="offcanvas-header border-bottom">
        <h5 class="offcanvas-title" id="addEventSidebarLabel">일정 확인</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <form class="event-form pt-0" id="eventForm" onsubmit="return false">
        <div class="mb-6">
                <label class="form-label" for="todoCode">일정 분류</label>
                <span class="form-control" id="todoCode"></span>
            </div>
            <div class="mb-6">
                <label class="form-label" for="eventTitle">제목</label>
                <span class="form-control" id="eventTitle"></span>
            </div>
            <div class="mb-6">
                <label class="form-label" for="eventContent">내용</label>
                <span class="form-control" id="eventContent"></span>
            </div>

            <div class="mb-6">
                <label class="form-label" for="eventStartDate">시작일시</label>
                <span class="form-control" id="eventStartDate"></span>
            </div>
            <div class="">
                <label class="form-label" for="eventEndDate">종료일시</label>
                <span class="form-control" id="eventEndDate"></span>
            </div>

        </form>
        <div class="card-header d-flex justify-content-end gap-3" id="empBtn">
            <button class="btn btn-primary">일정수정</button>
                <button class="btn btn-danger" type="button">일정삭제</button>
        </div>
        <div class="card-header d-flex justify-content-end gap-3" id="depBtn">
            <button class="btn btn-primary">일정수정</button>
            <button class="btn btn-danger" type="button">일정삭제</button>
        </div>
    </div>
</div>



				<!-- Modal -->
				<!-- 개인일정 추가 모달 -->
	<div class="modal fade" id="modalCenter" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id='insertForm' method="post"
					action="${cPath }/gw/todoList/calempTodoListInsert.do">
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
									placeholder="제목을 입력해주세요."  required="required"/>
							</div>
						</div>
						<div class="row">
							<div class="col mb-4">
								<label for="content" class="form-label">내용</label>
								<textarea id="content" name="todoContent" class="form-control"
									placeholder="내용을 입력해주세요."  required="required"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col mb-4">
								<label for="content" class="form-label">카테고리</label>
								<select class="form-select text-capitalize" name="todoCate.todocateNo" >
									<option value>카테고리선택</option>
									<c:forEach items="${todoCateTitle}" var="todoCateList">
										<c:if test="${empty todoCateList.todocateTitle }">
											<option class="dropdown-item"
												label="카테고리 없음" value="" />
										</c:if>
										<c:if test="${not empty todoCateList.todocateTitle }">
											<option class="dropdown-item"
												label="${todoCateList.todocateTitle}" value="${todoCateList.todocateNo }" />
										</c:if>

									</c:forEach>
								</select>

							</div>
						</div>
						<div class="row">
								<div class="col mb-0">
									<label for="dday" class="form-label">일정 시작일</label> <input
										type="datetime-local" name="todoStart" id="startDate"
										class="form-control dob-picker flatpickr-input active"
										placeholder="YYYY-MM-DD">
								</div>
								<div class="col mb-0">
									<label for="dday" class="form-label">일정 종료일</label> <input
										type="datetime-local" name="todoEnd" id="todoEnd"
										class="form-control dob-picker flatpickr-input active"
										placeholder="YYYY-MM-DD">
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-label-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>

				<!-- 부서일정 추가 -->
				<div class="modal fade" id="largeModal" tabindex="-1"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form id='insertForm' method="post"
								action="${cPath }/gw/todoList/depTodoListInsert.do">
								<div class="modal-header">
									<h5 class="modal-title" id="modalCenterTitle">부서일정추가</h5>
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
											<label for="content" class="form-label">내용</label>
											<textarea id="content" name="todoContent"
												class="form-control" placeholder="내용을 입력해주세요."></textarea>
										</div>
									</div>
									<div class="row">
								<div class="col mb-0">
									<label for="dday" class="form-label">일정 시작일</label> <input
										type="datetime-local" name="todoStart" id="todoStart"
										class="form-control dob-picker flatpickr-input active"
										placeholder="YYYY-MM-DD">
								</div>
								<div class="col mb-0">
									<label for="dday" class="form-label">일정 종료일</label> <input
										type="datetime-local" name="todoEnd" id="todoDepEnd"
										class="form-control dob-picker flatpickr-input active"
										placeholder="YYYY-MM-DD">
								</div>
							</div>
								</div>
								<div class="modal-footer">
									<span>주의) 부서일정은 부서원에게 공유됩니다</span>
									<button type="submit" class="btn btn-primary">저장</button>
									<button type="button" class="btn btn-label-secondary"
										data-bs-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /Calendar & Modal -->
			</div>
		</div>
	</div>
</div>
<!-- e7e 풀캘린더 스크립트 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<!-- 풀캘린더 실행을 위한 스크립트 -->
<script src='${cPath }/resources/js/app/jhjTa/groupware/calendar.js'></script>
<script src='${cPath }/resources/js/app/jhjUa/calendar.js'></script>
<!-- flatpickr 사용을 위한 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>




