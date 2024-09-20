<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-xxl flex-grow-1 container-p-y">

	<div id="accordionCustomIcon" class="accordion card mt-3 accordion-custom-button overflow-hidden">
		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="col-md-6 ps-5">
				<a class="navbar-brand" href="javascript:void(0)">
					<i class="menu-icon bx bx-calendar-check"></i>
					개인일정
				</a>
			</div>
			<div class="app-kanban col-md-6">
				<div class="d-flex justify-content-end gap-3 align-items-center mb-0 text-white">
					<button type="button" data-bs-toggle="modal"
						aria-controls="modalCenter" data-bs-target="#smallModal"
						class="kanban-add-board-btn btn btn-link text-white"
						id="kanban-add-board-btn">
						<i class="bx bx-plus"></i> <span class="align-middle">카테고리추가</span>
					</button>
					<button type="button" data-bs-toggle="modal"
						aria-controls="modalCenter" data-bs-target="#cateModal"
						class="kanban-add-board-btn btn btn-link text-white"
						id="kanban-add-board-btn">
						<i class="bx bx-plus"></i> <span class="align-middle">내 카테고리 조회</span>
					</button>
					<button type="button" data-bs-toggle="modal"
						data-bs-target="#modalCenter" aria-controls="modalCenter"
						class="kanban-add-board-btn btn btn-link text-white"
						id="kanban-add-board-btn">
						<i class="bx bx-plus"></i> <span class="align-middle">일정추가</span>
					</button>
				</div>
			</div>
		</nav>
		<c:forEach items="${todoCateList}" var="todoCate">
			<div class="accordion-item">
				<h2 class="accordion-header text-body d-flex justify-content-between bg-body-secondary"
					id="accordionCustomIconOne">
					<button type="button" class="accordion-button collapsed"
						data-bs-toggle="collapse"
						data-bs-target="#accordionCustomIcon-${todoCate.todocateNo}"
						aria-controls="accordionCustomIcon-${todoCate.todocateNo}">
						<i class='bx bx-list-check me-2' ></i>
						<c:if test="${not empty todoCate.todocateTitle }">
                            ${todoCate.todocateTitle }
                         </c:if>
						<c:if test="${empty todoCate.todocateTitle }">
                            카테고리 없음
                         </c:if>
					</button>
				</h2>
				<c:forEach items="${todoCate.todoList}" var="todo" varStatus="statu">
					<div id="accordionCustomIcon-${todoCate.todocateNo}"
						class="accordion-collapse collapse"
						data-bs-parent="#accordionCustomIcon">
						<div class="accordion-body px-5 py-0">
							<div class="todo-item px-2 py-3 border-bottom">
								<!-- Add Checkbox -->
								<input type="checkbox" data-todo-no="${todo.todoNo}"
										       id="checkbox-${todo.todoNo}"
										       onchange="toggleTodoStatus(this)"
										       class="form-check-input me-2"
										       ${todo.todoState == 'BB03110' ? 'checked' : ''} />
								<!-- Todo Title -->
								<c:url value="/gw/todoList/empTodoDetail.do"
									var="empTodoDetailUrl">
									<c:param name="what" value="${todo.todoNo }" />
								</c:url>
								<a class="offcanClass" id="offcan-${todo.todoNo}"
									data-bs-toggle="offcanvas" href="#offcanvasRight" role="button"
									aria-controls="offcanvasRight"
									data-detail-url="${empTodoDetailUrl}"> <i class="bx bx-alarm bx-16px me-2"></i>  ${todo.todoStart.substring(11) } ~ ${todo.todoEnd.substring(11)  } <i class="bx bx-cafff bx-16px me-2"></i ><i class="bx bx-caret-right bx-16px me-2"></i>  ${todo.todoTitle} </a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</c:forEach>

		<!-- 일정쓰기 모달 -->
		<div class="modal fade" id="modalCenter" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<form id='insertForm' method="post"
						action="${cPath }/gw/todoList/empTodoListInsert.do">
						<div class="modal-header">
							<h5 class="modal-title" id="modalCenterTitle">일정추가</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-4">
									<label for="title" class="form-label">제목</label> <input
										type="text" id="todotitle" name="todoTitle" class="form-control"
										placeholder="제목을 입력해주세요." required="required" />
								</div>
							</div>
							<div class="row">
								<div class="col mb-4">
									<label for="content" class="form-label">내용</label>
									<textarea id="content" name="todoContent" class="form-control"
										placeholder="내용을 입력해주세요." required="required"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col mb-4">
									<label for="content" class="form-label">카테고리</label> <select
										class="form-select text-capitalize" name="todoCate.todocateNo">
										<option value>카테고리선택</option>
										<c:forEach items="${todoCateTitle}" var="todoCateList">
											<c:if test="${empty todoCateList.todocateTitle }">
												<option class="dropdown-item" label="카테고리 없음" value="" />
											</c:if>
											<c:if test="${not empty todoCateList.todocateTitle }">
												<option class="dropdown-item"
													label="${todoCateList.todocateTitle}"
													value="${todoCateList.todocateNo }" />
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
							<button class="btn btn-label-primary" id="dataInsertBtn" type="button">자동입력</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 카테고리 추가 모달 -->
		<div class="modal fade" id="smallModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<form id='insertForm' method="post"
						action="${cPath }/gw/todoList/empTodoCateInsert.do">
						<div class="modal-header">
							<h5 class="modal-title" id="modalCenterTitle">카테고리추가</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-4">
									<label for="title" class="form-label">카테고리명</label> <input
										type="text" id="title" name="todocateTitle"
										class="form-control" placeholder="카테고리를 입력해주세요."
										required="required" />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-label-secondary"
								data-bs-dismiss="modal">취소</button>
								<button class="btn btn-label-primary" id="datacateInsertBtn" type="button">자동입력</button>
						</div>
					</form>
				</div>
			</div>
		</div>
<!-- 		카테고리 항목 조회 -->
		<div class="modal fade" id="cateModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalCenterTitle">내 카테고리 항목</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-4">
									<table class="table">
										<c:forEach items="${todoCateTitle}" var="todoCateList">
											<tr class="">
												<c:if test="${not empty todoCateList.todocateTitle }">
												<td class="table-border-bottom-0 col-90"><i class="bx bx-check"></i> ${todoCateList.todocateTitle }</td>
												<td class="col-3 row-3">
												<c:url value="/gw/todoList/todoCateUpdate.do" var="cageUpdate">
													<c:param name="what" value="${todoCateList.todocateNo }"></c:param>
												</c:url>
													<a href="${cageUpdate }"><i class="bx bx-pen"></i> 수정</a>
												</td>
												<td class="col-3 row-3">
													<form action="${cPath}/gw/todoList/todoCateDelete.do" method="post"  class="deleteForm">
														<input type="hidden" name="todocateNo" value="${todoCateList.todocateNo }">
														<button type="button" class="btn btn-link deleteButton"><i class="bx bx-trash"></i>  삭제
														</button>
													</form>
												</td>
												</c:if>
											</tr>
										</c:forEach>
										</table>
								</div>
							</div>
						</div>
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
	</div>
</div>
<script type="text/javascript">
function applyTodoStyles(checkboxElement) {
    const todoItem = checkboxElement.closest('.todo-item');
    const todoTitle = todoItem.querySelector('a.offcanClass');

    if (checkboxElement.checked) {
      todoTitle.style.textDecoration = "line-through";
    } else {
      todoTitle.style.textDecoration = "none";
    }
  }

  function toggleTodoStatus(checkboxElement) {
    const todoNo = checkboxElement.getAttribute('data-todo-no');

    // Define the new state based on the checkbox
    const newState = checkboxElement.checked ? 'BB03110' : 'BB03120';

    // Update the styles based on the checkbox state
    applyTodoStyles(checkboxElement);

    // Ajax request to update the todo state in the backend
    $.ajax({
      type: 'POST',
      url: `${cPath}/gw/todoList/updateTodoState.do`,
      data: {
        todoNo: todoNo,
        newState: newState
      },
      success: function(response) {
        console.log("State updated successfully");
      },
      error: function(error) {
        console.log("Error updating state", error);
      }
    });
}

// Apply styles on page load based on initial checkbox state
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('input[type="checkbox"]').forEach(function (checkbox) {
    applyTodoStyles(checkbox);
  });
});
dataInsertBtn.addEventListener('click', ()=>{
	todotitle.value = '대덕에 인력지원';
	content.value = '거래처 대덕에 23일 월요일 10시부터 4시까지 인력지원을 가기로 함 ';
	startDate.value = '2024-09-23 10:00';
	todoEnd.value = '2024-09-23 16:00';
});
datacateInsertBtn.addEventListener('click', ()=>{
	title.value = '거래처 인력지원';
});

</script>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/popper/popper.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-kanban2.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/hammer/hammer.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/typeahead-js/typeahead.js"></script>