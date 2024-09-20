<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card-datatable table-responsive">
			<nav class="navbar navbar-expand-lg bg-primary card  mb-6">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">회의실 관리</a>
					<button type="button" data-bs-toggle="modal"
						data-bs-target="#modalCenter" aria-controls="modalCenter"
						class="kanban-add-board-btn btn  text-white" id="kanban-add-board-btn">
						<i class="bx bx-plus"></i> <span class="align-middle">회의실추가</span>
					</button>
				</div>
			</nav>
			<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 card" >
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
										style="width: 144px;">회의실이름</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="내용: activate to sort column ascending"
										style="width: 437px;">장소</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="시작일자: activate to sort column ascending"
										style="width: 144px;">최대인원</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${roomList}" var="roomList">
							    <tr class="odd">
							        <td></td>
							        <td>${roomList.rnum}</td>
							        <td>
							            <button type="button" class="btn btn-link room-detail-btn"
							                data-bs-toggle="modal"
							                data-bs-target="#roomDetailModal"
							                data-roomno="${roomList.roomNo}"
							                data-roomnm="${roomList.roomNm}"
							                data-roomloc="${roomList.roomLoc}"
							                data-roomempmax="${roomList.roomEmpmax}">
							                ${roomList.roomNm}
							            </button>
							        </td>
							        <td><i class="jstree-icon jstree-themeicon bx bx-buildings m-0 jstree-themeicon-custom" role="presentation"></i> ${roomList.roomLoc}</td>
							        <td><i class="bx bxs-group"></i> ${roomList.roomEmpmax} 명</td>
							    </tr>
							</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회의실 추가 모달 -->
<div class="modal fade" id="modalCenter" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<form id='insertForm' method="post"
				action="${cPath }/gw/room/roomInsert.do">
				<div class="modal-header">
					<h5 class="modal-title" id="modalCenterTitle">회의실</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col mb-4">
							<label for="title" class="form-label">회의실이름</label> <input
								type="text" id="title" name="roomNm" class="form-control"
								placeholder="회의실을 입력해주세요." />
						</div>
					</div>
					<div class="row">
						<div class="col mb-4">
							<label for="content" class="form-label">장소</label>
							<textarea id="content" name="roomLoc" class="form-control"
								placeholder="회의실 장소를 입력해주세요."></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col mb-0">
							<label for="dday" class="form-label">최대인원</label> <input
								type="number" name="roomEmpmax" id="dday"
								class="form-control dob-picker flatpickr-input active"
								placeholder="숫자를 입력해주세요">
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

<!-- Room Detail Modal -->
<div class="modal fade" id="roomDetailModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roomDetailModalTitle">회의실 상세 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomNm" class="form-label">회의실 이름</label>
                        <input type="text" id="roomNm" class="form-control" readonly />
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomLoc" class="form-label">장소</label>
                        <input  type="text" id="roomLoc" class="form-control" readonly/>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-0">
                        <label for="roomEmpmax" class="form-label">최대 인원</label>
                        <input type="text" id="roomEmpmax" class="form-control" readonly />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <a href="#" id="roomUpdateLink" class="btn btn-primary">수정</a>
                <button type="button" id="roomDelete" class="btn btn-secondary" >삭제</button>
            </div>
        </div>
    </div>
</div>

<script defer src="${cPath}/resources/js/app/jhjUa/roomDetail.js"></script>
<script defer src="${cPath}/resources/js/app/jhjUa/roomList.js"></script>
