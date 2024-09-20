<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="col-xl">
		<div class="card mb-10">
			<!-- 		연차기준리스트 -->
			<h5 class="card-header d-flex justify-content-between">
				연차 기준
				<c:url value="/gw/vacation/categoryUpdate.do"
					var="categoryUpdateUrl">
				</c:url>
				<a href="${categoryUpdateUrl }" class="btn btn-primary"> <i
					class='bx bx-edit-alt me-2'></i> 연차수정
				</a>
			</h5>
			<div class="card-body">
				<ul class="mb-4 row p-0">
					<c:forEach items="${vacationList }" var="vacationList"
						varStatus="statusSp">
						<c:if test="${vacationList.vaciType eq 'BB02110' }">

							<c:choose>
								<c:when test="${vacationList.empYear eq 24 }">
									<li class="col-sm-2 d-block"><label for="input-year1"
										class="col-form-label">${vacationList.empYear } 년이상</label>
										<div>
											<input class="form-control" type="number"
												value="${vacationList.vaciDay }" id="input-year1" readonly>
										</div></li>
								</c:when>
								<c:otherwise>
									<li class="col-sm-2 d-block"><label for="input-year1"
										class="col-form-label">${vacationList.empYear } 년</label>
										<div>
											<input class="form-control" type="number"
												value="${vacationList.vaciDay }" id="input-year1" readonly>
										</div></li>
								</c:otherwise>
							</c:choose>



						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div class="row">

		<div class="col-xl">
			<div class="card mb-10">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<div class="d-flex gap-2 align-items-center">
						<h5 class="mb-0">경조 항목</h5>
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#modalCenter" aria-controls="modalCenter"
							class="kanban-add-board-btn btn btn-label-secondary ms-3"
							id="kanban-add-board-btn">
							<i class="bx bx-plus"></i> <span class="align-middle">추가</span>
						</button>
					</div>
					<small class="text-muted float-end">경조 기준은 변경 및 추가 할 수 있습니다.</small>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>경조사명</th>
								<th>휴가일수</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach items="${vacationAllList }" var="vacationList"
								varStatus="status">
								<c:if test="${vacationList.vaciType eq 'BB02120' }">
									<tr>
										<td>${vacationList.vaciNm }</td>
										<td>${vacationList.vaciDay }일</td>
										<td class="col-2 row-3">
											<c:url value="/gw/vacation/vacationDetail.do" var="vacationDetail">
												<c:param name="what" value="${vacationList.vaciNo }"></c:param>
											</c:url>
											<a href="${vacationDetail }" class="btn btn-label-info"><i class="bx bx-pen"></i> 수정</a>
										</td>
										<td class="col-2 row-3">
											<form action="${cPath}/gw/vacation/vacationDelete.do" method="post" class="deleteForm">
												<input type="hidden" name="vaciNo" value="${vacationList.vaciNo }">
												<button type="button" class="btn btn-label-danger deleteButton">
													<i class="bx bx-trash"></i> 삭제
												</button>
											</form>
										</td>
									</tr>

								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-xl">
			<div class="card mb-10">
				<div class="card-header d-flex justify-content-between align-items-center">
					<div class="d-flex gap-2 align-items align-items-center">
						<h5 class="mb-0">특별휴가 항목</h5>
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#easdf" aria-controls="modalCenter"
							class="kanban-add-board-btn btn btn-label-secondary ms-3"
							id="kanban-add-board-btn">
							<i class="bx bx-plus"></i> <span class="align-middle">
								추가</span>
						</button>
					</div>
					<small class="text-muted float-end">특별휴가 기준은 변경 및 추가 할 수
						있습니다.</small>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>특별휴가명</th>
								<th>휴가일수</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach items="${vacationAllList }" var="vacationList"
								varStatus="statusSp">
								<c:if test="${vacationList.vaciType eq 'BB02130' }">
									<tr>
										<td>${vacationList.vaciNm }</td>
										<td>${vacationList.vaciDay }일</td>
										<td class="col-2 row-3">
												<c:url value="/gw/vacation/vacationDetail.do" var="vacationDetail">
													<c:param name="what" value="${vacationList.vaciNo }"></c:param>
												</c:url>
													<a href="${vacationDetail }" class="btn btn-label-info"><i class="bx bx-pen"></i> 수정</a>
												</td>
										<td class="col-2 row-3">
											<form action="${cPath}/gw/vacation/vacationDelete.do"
												method="post" class="deleteForm">
												<input type="hidden" name="vaciNo"
													value="${vacationList.vaciNo }">
												<button type="button" class="btn btn-label-danger deleteButton">
													<i class="bx bx-trash"></i> 삭제
												</button>
											</form>
										</td>
									</tr>

								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</div>
</div>



<!-- 특별휴가항목 수정 모달 -->
<div class="modal fade" id="easdf" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form class="form-special" method="post"
				action="${cPath }/gw/vacation/specialInsert.do">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">특별휴가항목 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div data-repeater-list="group-a">
						<div data-repeater-list="group-a">
							<div data-repeater-item>
								<div class="row">
									<div class="mb-6 col-md-4 col-12 mb-0">
										<label class="form-label" for="form-special-1-1">특별휴가명</label>
										<input type="text" id="form-special-1-1" class="form-control"
											name="vaciNm" required="required" placeholder="특별휴가명을 입력하세요." />
									</div>
									<div class="mb-6 col-md-4 col-12 mb-0">
										<label class="form-label" for="form-special-1-2">휴가일수</label>
										<input type="number" id="form-special-1-2" name="vaciDay"
											class="form-control" required="required"
											placeholder="휴가일수를 입력하세요." />
									</div>
									<div class="mb-6 col-md-4 col-12 mb-0 d-flex align-items-end">
										<button class="btn btn-label-danger w-100"
											data-repeater-delete>
											<i class="bx bx-x me-1"></i> <span class="align-middle">Delete</span>
										</button>
									</div>
								</div>
								<hr class="mt-0" />
							</div>
						</div>
					</div>
					<div class="mb-0">
						<button type="button" class="btn btn-primary" data-repeater-create>
							<i class="bx bx-plus me-1"></i> <span class="align-middle">Add</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="submit" id="specialBtn" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-label-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</form>
		</div>

	</div>
</div>

<!-- 경조항목 추가 -->
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form class="form-repeater" method="post" id="special"
				action="${cPath }/gw/vacation/repInsert.do">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">경조항목 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div data-repeater-list="group-a">
						<div data-repeater-list="group-a">
							<div data-repeater-item>
								<div class="row">
									<div class="mb-6 col-md-4 col-12 mb-0">
										<label class="form-label" for="form-repeater-1-1">경조사명</label>
										<input type="text" id="form-repeater-1-1" class="form-control"
											required="required" placeholder="경조사명을 입력하세요." />
									</div>
									<div class="mb-6 col-md-4 col-12 mb-0">
										<label class="form-label" for="form-repeater-1-2">휴가일수</label>
										<input type="number" id="form-repeater-1-2"
											required="required" class="form-control"
											placeholder="휴가일수를 입력하세요." />
									</div>
									<div class="mb-6 col-md-4 col-12 mb-0 d-flex align-items-end">
										<button class="btn btn-label-danger w-100"
											data-repeater-delete>
											<i class="bx bx-x me-1"></i> <span class="align-middle">Delete</span>
										</button>
									</div>
								</div>
								<hr class="mt-0" />
							</div>
						</div>
					</div>
					<div class="mb-0">
						<button type="button" class="btn btn-primary" data-repeater-create>
							<i class="bx bx-plus me-1"></i> <span class="align-middle">Add</span>
						</button>
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
<script defer src="${cPath}/resources/js/app/jhjUa/attendance.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/vacation-categoryList.js"></script>
