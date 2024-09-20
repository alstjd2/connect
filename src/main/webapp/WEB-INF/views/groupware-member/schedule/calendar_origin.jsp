<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="card app-calendar-wrapper">
                        <div class="row g-0">
                            <!-- Calendar Sidebar -->
                            <div class="col app-calendar-sidebar border-end" id="app-calendar-sidebar">
                                <div class="border-bottom p-6 my-sm-0 mb-4">
                                    <button class="btn btn-warning btn-toggle-sidebar w-100" data-bs-toggle="modal"
                                        data-bs-target="#modalCenter" aria-controls="modalCenter">
                                        <i class="bx bx-plus bx-16px me-2"></i>
                                        <span class="align-middle">일정추가</span>
                                    </button>
                                </div>
                                <div class="border-bottom p-6 my-sm-0 mb-4">
                                    <button class="btn btn-primary btn-toggle-sidebar w-100" data-bs-toggle="modal"
                                        data-bs-target="#largeModal" aria-controls="modalCenter">
                                        <i class="bx bx-plus bx-16px me-2"></i>
                                        <span class="align-middle">부서 일정추가</span>
                                    </button>
                                </div>
                                <div class="px-6 pt-6">
                                    <!-- Filter -->
                                    <div>
                                        <h5>Event Filters</h5>
                                    </div>

                                    <div class="form-check form-check-secondary mb-5 ms-2">
                                        <input class="form-check-input select-all" type="checkbox" id="selectAll"
                                            data-value="all" checked />
                                        <label class="form-check-label" for="selectAll">View All</label>
                                    </div>

                                    <div class="app-calendar-events-filter text-heading">
                                        <div class="form-check form-check-danger mb-5 ms-2">
                                            <input class="form-check-input input-filter" type="checkbox"
                                                id="select-personal" data-value="personal" checked />
                                            <label class="form-check-label" for="select-personal">Personal</label>
                                        </div>
                                        <div class="form-check mb-5 ms-2">
                                            <input class="form-check-input input-filter" type="checkbox"
                                                id="select-business" data-value="business" checked />
                                            <label class="form-check-label" for="select-business">Business</label>
                                        </div>
                                        <div class="form-check form-check-warning mb-5 ms-2">
                                            <input class="form-check-input input-filter" type="checkbox"
                                                id="select-family" data-value="family" checked />
                                            <label class="form-check-label" for="select-family">Family</label>
                                        </div>
                                        <div class="form-check form-check-success mb-5 ms-2">
                                            <input class="form-check-input input-filter" type="checkbox"
                                                id="select-holiday" data-value="holiday" checked />
                                            <label class="form-check-label" for="select-holiday">Holiday</label>
                                        </div>
                                        <div class="form-check form-check-info ms-2">
                                            <input class="form-check-input input-filter" type="checkbox" id="select-etc"
                                                data-value="etc" checked />
                                            <label class="form-check-label" for="select-etc">ETC</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Calendar Sidebar -->

                            <!-- Calendar & Modal -->
                            <div class="col app-calendar-content">
                                <div class="card shadow-none border-0">
                                    <div class="card-body pb-0">
                                        <!-- FullCalendar -->
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                                <div class="app-overlay"></div>
                                <!-- FullCalendar Offcanvas -->
                                <div class="offcanvas offcanvas-end event-sidebar" tabindex="-1" id="addEventSidebar"
                                    aria-labelledby="addEventSidebarLabel">
                                    <div class="offcanvas-header border-bottom">
                                        <h5 class="offcanvas-title" id="addEventSidebarLabel">Add Event</h5>
                                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="offcanvas-body">
                                        <form class="event-form pt-0" id="eventForm" onsubmit="return false">
                                            <div class="mb-6">
                                                <label class="form-label" for="eventTitle">Title</label>
                                                <input type="text" class="form-control" id="eventTitle"
                                                    name="eventTitle" placeholder="Event Title" />
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventLabel">Label</label>
                                                <select class="select2 select-event-label form-select" id="eventLabel"
                                                    name="eventLabel">
                                                    <option data-label="primary" value="Business" selected>Business
                                                    </option>
                                                    <option data-label="danger" value="Personal">Personal</option>
                                                    <option data-label="warning" value="Family">Family</option>
                                                    <option data-label="success" value="Holiday">Holiday</option>
                                                    <option data-label="info" value="ETC">ETC</option>
                                                </select>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventStartDate">Start Date</label>
                                                <input type="text" class="form-control" id="eventStartDate"
                                                    name="eventStartDate" placeholder="Start Date" />
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventEndDate">End Date</label>
                                                <input type="text" class="form-control" id="eventEndDate"
                                                    name="eventEndDate" placeholder="End Date" />
                                            </div>
                                            <div class="mb-6">
                                                <div class="form-check form-switch">
                                                    <input type="checkbox" class="form-check-input allDay-switch"
                                                        id="allDaySwitch" />
                                                    <label class="form-check-label" for="allDaySwitch">All Day</label>
                                                </div>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventURL">Event URL</label>
                                                <input type="url" class="form-control" id="eventURL" name="eventURL"
                                                    placeholder="https://www.google.com" />
                                            </div>
                                            <div class="mb-4 select2-primary">
                                                <label class="form-label" for="eventGuests">Add Guests</label>
                                                <select class="select2 select-event-guests form-select" id="eventGuests"
                                                    name="eventGuests" multiple>
                                                    <option data-avatar="1.png" value="Jane Foster">Jane Foster</option>
                                                    <option data-avatar="3.png" value="Donna Frank">Donna Frank</option>
                                                    <option data-avatar="5.png" value="Gabrielle Robertson">Gabrielle
                                                        Robertson</option>
                                                    <option data-avatar="7.png" value="Lori Spears">Lori Spears</option>
                                                    <option data-avatar="9.png" value="Sandy Vega">Sandy Vega</option>
                                                    <option data-avatar="11.png" value="Cheryl May">Cheryl May</option>
                                                </select>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventLocation">Location</label>
                                                <input type="text" class="form-control" id="eventLocation"
                                                    name="eventLocation" placeholder="Enter Location" />
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="eventDescription">Description</label>
                                                <textarea class="form-control" name="eventDescription"
                                                    id="eventDescription"></textarea>
                                            </div>
                                            <div
                                                class="d-flex justify-content-sm-between justify-content-start mt-6 gap-2">
                                                <div class="d-flex">
                                                    <button type="submit" id="addEventBtn"
                                                        class="btn btn-primary btn-add-event me-4">
                                                        Add
                                                    </button>
                                                    <button type="reset"
                                                        class="btn btn-label-secondary btn-cancel me-sm-0 me-1"
                                                        data-bs-dismiss="offcanvas">
                                                        Cancel
                                                    </button>
                                                </div>
                                                <button
                                                    class="btn btn-label-danger btn-delete-event d-none">Delete</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!-- Modal -->

<!-- 개인일정 추가 모달 -->
<div class="modal fade" id="modalCenter" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id='insertForm' method="post"
					action="${cPath }/gw/todoList/empTodoListInsert.do">
					<div class="modal-header">
						<h5 class="modal-title" id="modalCenterTitle">개인일정추가</h5>
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
								<textarea id="content" name="todoContent" class="form-control"
									placeholder="내용을 입력해주세요."></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col mb-10">
								<label for="content" class="form-label">카테고리</label>
								<select class="dropdown-menu show" name="todoCate.todocateNo" >
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
								<textarea id="content" name="todoContent" class="form-control"
									placeholder="내용을 입력해주세요."></textarea>
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
						<div class="row">
							<div class="col mb-4">
								<label for="title" class="form-label">화상회의</label> <input
									type="text" id="title" name="todoConno" class="form-control"
									placeholder="화상회의링크를 입력해주세요." />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<span>주의) 부서일정은 부서원에게 공유됩니다</span>
						<button type="button" class="btn btn-label-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>


                            <!-- /Calendar & Modal -->
                        </div>
                    </div>
                </div>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-calendar-events.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-calendar.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/form-layouts.js"></script>