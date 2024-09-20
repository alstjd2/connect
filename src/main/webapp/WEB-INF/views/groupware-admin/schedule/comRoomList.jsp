
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="card-datatable table-responsive">
	<nav class="navbar navbar-expand-lg bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">회의실예약조회</a>
		</div>
	</nav>
	<div id="DataTables_Table_0_wrapper"
		class="dataTables_wrapper dt-bootstrap5">
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
								style="width: 144px;">예약자명</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="연차종류: activate to sort column ascending"
								style="width: 144px;">부서명</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="예약시작시간: activate to sort column ascending"
								style="width: 437px;">예약시작시간</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="예약종료시간: activate to sort column ascending"
								style="width: 437px;">예약종료시간</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="회의실이름: activate to sort column ascending"
								style="width: 437px;">회의실이름</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="장소: activate to sort column ascending"
								style="width: 437px;">장소</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								aria-label="최대인원: activate to sort column ascending"
								style="width: 144px;">최대인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roomList}" var="roomList">
							<tr class="odd">
							<td></td>
								<td>${roomList.rnum}</td>
								<td>${roomList.empNm}</td>
								<td>${roomList.orgDep}</td>
								<td>${roomList.roomreserStart }</td>
								<td>${roomList.roomreserEnd }</td>
								<td>${roomList.roomNm }</td>
								<td>${roomList.roomLoc }</td>
								<td>${roomList.roomEmpmax }명</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th class="control" rowspan="1" colspan="1"></th>
							<th rowspan="1" colspan="1">NO</th>
							<th rowspan="1" colspan="1">예약자명</th>
							<th rowspan="1" colspan="1">부서명</th>
							<th rowspan="1" colspan="1">예약시작시간</th>
							<th rowspan="1" colspan="1">예약종료시간</th>
							<th rowspan="1" colspan="1">회의실이름</th>
							<th rowspan="1" colspan="1">장소</th>
							<th rowspan="1" colspan="1">최대인원</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
</div>
</div>

