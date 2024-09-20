<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Bootstrap CSS -->
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	
			<nav class="navbar navbar-expand-lg bg-primary card  mb-6">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">게시판 관리</a>
				</div>
			</nav>
		<div class="card">
			<!-- 상단 버튼 영역 -->
			<div class="button-group d-flex justify-content-between align-items-center p-3 px-5">
				<div class="d-flex justify-content-between align-items-center">
					<i class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4 mb-4"
						data-bs-toggle="sidebar" data-target="#app-email-sidebar"
						data-overlay=""></i>
					<div class="w-100">
						<div class="input-group input-group-merge shadow-none">
							<span class="input-group-text border-0 p-0 pe-4"
								id="board-search"> <i
								class="bx bx-search bx-md text-body"></i>
							</span>
							<!-- Search Form -->
							<div id="searchUI">
								<!-- Search Type Dropdown -->
								<select id="searchType" name="searchType"
									class="form-select border-0 py-0" aria-label="검색 유형 선택"
									hidden="true">
									<option value="title">게시판명</option>
								</select>

								<!-- Search Input -->
								<input id="searchWord" name="searchWord"
									placeholder="게시판명을 검색하세요." type="text"
									class="form-control addr-search-input border-0 py-0"
									aria-label="게시판명을 검색하세요." value="">
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary ms-auto" data-toggle="modal" data-target="#addGubunModal">
					<i class="bx bx-plus me-2"></i>
					게시판 추가
				</button>
			</div>
	
			<!-- 게시판 목록 테이블 -->
			<table class="table table-borderless table-sm dt-appointment-table">
				<thead>
					<tr class="border-bottom border-top">
						<th class="ps-6">게시판명</th>
						<th class="ps-6">게시글 수</th>
						<th class="ps-6">생성일</th>
						<th class="ps-6">삭제</th>
						<!-- 삭제 열 추가 -->
					</tr>
				</thead>
				<tbody>
					<!-- 게시판 목록 반복 출력 -->
					<c:forEach var="board" items="${grbGubunList}">
						<tr>
							<td>${board.grbGubunTitle}</td>
							<td>${board.grbCount}</td>
							<td>${board.gubunDate.substring(0, 16)}</td>
							<td>
							    <li class="list-inline-item email-delete btn btn-icon">
							        <form>
							            <label for="trash-${board.grbGubunNo}" class="list-inline-item email-delete btn btn-icon">
							                <input type="hidden" name="trash" class="trash-checkbox" data-gubun-no="${board.grbGubunNo}" />
							                <i class="bx bx-trash bx-md"  onclick="toggleGubunYN(this)"></i>
							            </label>
							        </form>
							    </li>
							</td>
							<!-- 삭제 열 추가 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<!-- 페이징 UI 추가 -->
			<nav aria-label="Page navigation text-center">
				<ul class="pagination pagination-rounded justify-content-center pt-7">
					<div class="paging-area">${pagingHTML}</div>
				</ul>
			</nav>
	
		</div>
	</div>
</div>
	<!-- 모달 -->
	<div class="modal fade" id="addGubunModal" tabindex="-1" role="dialog"
		aria-labelledby="addGubunModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addGubunModalLabel">게시판 추가</h5>

				</div>
				<div class="modal-body">
					<form id="addGubunForm"
						action="${pageContext.request.contextPath}/gw/board/insertGubunmark.do"
						method="post">
						<div class="form-group">
							<label for="gubunTitle" class="col-form-label">게시판명 <span
								class="text-danger">*</span></label> <input type="text"
								class="form-control" id="gubunTitle" name="grbGubunTitle"
								maxlength="60" placeholder="게시판명을 입력해 주세요." required> <small
								class="form-text text-muted">0/60</small>
						</div>
						<div class="form-group">
							<label for="gubunDesc" class="col-form-label">게시판 설명</label>
							<textarea class="form-control" id="gubunDesc" name="grbGubunDesc"
								rows="4" maxlength="300" placeholder="설명을 입력해 주세요."></textarea>
							<small class="form-text text-muted">0/300</small>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="autoinsertBtn">자동입력</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" form="addGubunForm">추가</button>
				</div>
			</div>
		</div>
	</div>

	<form:form id="searchform" method="get" modelAttribute="condition">
		<form:hidden path="searchType" />
		<form:hidden path="searchWord" />
		<input type="hidden" name="page" />
	</form:form>

	<!-- jQuery, Popper.js, Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script defer="defer" src="${cPath}/resources/js/app/utils/paging.js"></script>
	<script defer="defer" src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
	<script defer="defer" src="${cPath}/resources/webProvider/assets/js/custom/jms_aa.js"></script>

