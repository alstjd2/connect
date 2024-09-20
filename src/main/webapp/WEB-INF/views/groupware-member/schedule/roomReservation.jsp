<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
/* Basic styles for table cells */
.reserv-table td {
    transition: background-color 0.3s ease, transform 0.3s ease;
    cursor: pointer; /* Change cursor to pointer to indicate it's clickable */
}

/* Hover effect for table cells */
.reserv-table td:hover {
    background-color: #e4e6e8; /* Light blue background on hover */
    transform: scale(1.02); /* Slightly zoom in on hover */
}

.reserv-table th {
    text-align: center;
}

/* Optional: Center align text in time data cells if needed */
.reserv-table td {
    text-align: center;
}

/* Optional: Increase font size for table headers */
.reserv-table th {
    font-size: 1.0rem; /* Adjust size as needed */
}

/* Increase font size for table cells */
.reserv-table td {
    font-size: 1rem; /* Adjust size as needed */
}

</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row col-md-11 m-auto mb-7">
		<div class="col-md mb-md-0 mb-5">
			<div
				class="card  p-5 h-100 ">

				<label class="form-check-label custom-option-content"
					for="customRadioIconAll">
					<span
					class="d-flex align-items-center mb-2">
					<div	class="avatar me-4">
							<div class="avatar-initial rounded bg-label-warning">
                                <i class="bx bx-star bx-lg"></i>
                              </div>
						</div>
						</span>
						<span class="custom-option-title text-start d-block fs-3 py-2 fw-bold">당일 예약</span>
					<p><i class="tf-icons bx bx-been-here"></i> 회의실은 당일예약만 가능</p>
					</label>
			</div>
		</div>
		<div class="col-md mb-md-0 mb-5">
			<div
				class="dcm form-check custom-option card  p-5 h-100"
				style="border-color: var(- -bs-success) !important;">
				<label class="form-check-label custom-option-content"
					for="customRadioIconDB06120"><span
					class="d-flex align-items-center mb-2">

					<div class="avatar">
                            <div class="avatar-initial rounded bg-label-success"><i class="bx bx-cart bx-lg"></i></div>
                          </div>
						</span>
						<span
					class="custom-option-title text-start d-block fs-3 py-2 fw-bold">비품</span>

						<i class="bx bx-laptop tf-icons"></i> 컴퓨터
						<i class="bx bx-chalkboard  ttf-icons"></i> 스크린
						<i class="bx bx-slideshow text-heading"></i> 화이트보드<br>
						<i class="bx bx-wifi  text-heading"></i> 와이파이
						<i class="bx bx-cctv text-heading"></i> CCTV
						<i class="bx bx-video text-heading"></i> 프로젝터
						<p>    </p>
					</label>
			</div>
		</div>
		<div class="col-md mb-md-0 mb-5">
			<div	class="card  p-5 h-100"
				style="border-color: var(- -bs-danger) !important;">
				<label class="form-check-label custom-option-content"
					for="customRadioIconDB06140"><span
					class="d-flex align-items-center mb-2">
					<div	class="avatar me-4">
							<span class="avatar-initial rounded bg-label-danger"><i
								class="bx bx-minus-circle"></i></span>
						</div>
						</span>
						<span 	class="custom-option-title text-start d-block fs-3 py-2 fw-bold">음식물</span>
					<p><i class="bx bx-bowl-rice text-heading"></i> 음식물 반입금지</p>
					<input name="customOptionRadioIcon" class="form-check-input d-none"
					type="radio" value="DB06140" id="customRadioIconDB06140"></label>
			</div>
		</div>
	</div>
	<div class="card col-md-11 m-auto">
		<div	class="card-header d-flex justify-content-between align-items-center">
			<h5 class="mb-0">회의실 예약</h5>
			<small class="text-body float-end">RoomReservation</small>
		</div>
		<fmt:setLocale value="ko_KR" />
<fmt:formatDate var="todayDate" value="${now}" pattern="yyyy-MM-dd" />
		<div class="card-body">
			<div class="row no-gutters justify-content-center mb-3 bg-light">
				<div class="col-auto d-flex align-items-center">
					<i class="tf-icons bx bx-calendar-check"></i>
					<h4 class="fc-toolbar-title mb-0 ms-2" id="current-date"
						aria-label="Date-Time"></h4>
				</div>
			</div>
			<div class="table-responsive text-nowrap">
				<div class="col">

					<table class="table table-sm table-bordered reserv-table">
						<thead>
							<tr>
								<th class="col-1">시간 \ 회의실</th>
								<c:forEach items="${roomList }" var="room">
									<th class="col-2"> <i class="bx bx-building-house bx-lg text-heading"></i>  ${room.roomLoc }
<%-- 										<p><i class="bx bxs-group"></i> ${room.roomEmpmax } 명</p> --%>
									</th>
									<span></span>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="height: 50px">09 시</th>
								<c:forEach items="${roomList }" var="room">
									<td height="2" rowspan="1" class="21" id="room_${room.roomNo}_9"
										data-drr_num="${room.roomLoc} "  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drr-max ="${room.roomEmpmax }"
										data-drt_time="9" data-drr_idx="1" data-drt_idx="1">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));">
											<button type="button" class="btn btn-link room-detail-btn"
							                data-bs-toggle="modal"
							                data-bs-target="#roomDetailModal"
							                data-roomno="${room.roomNo}"
							                data-roomnm="${room.roomNm}"
							                data-roomloc="${room.roomLoc}"
							                >
							            </button>
											<a href="javascript:void(0);"></a>
										</div>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">10 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_10"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drr-max ="${room.roomEmpmax }"
										data-drt_time="10" data-drr_idx="1" data-drt_idx="2">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">11 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_11"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="11" data-drr_idx="1" data-drt_idx="3">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">12 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_12"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="12" data-drr_idx="1" data-drt_idx="4">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">13 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_13"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="13" data-drr_idx="1" data-drt_idx="5">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">14 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_14"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="14" data-drr_idx="1" data-drt_idx="6"
										onclick="modal_setval($(this));" data-toggle="modal"
										data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">15 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_15"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="15" data-drr_idx="1" data-drt_idx="7"
										onclick="modal_setval($(this));" data-toggle="modal"
										data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">16 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_16"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="16" data-drr_idx="1" data-drt_idx="8"
										onclick="modal_setval($(this));" data-toggle="modal"
										data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px">17 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_17"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}"  data-drr-no="${room.roomNo }"  data-drr_type="01"
										data-drt_time="17" data-drr_idx="1" data-drt_idx="9"
										onclick="modal_setval($(this));" data-toggle="modal"
										data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="height: 50px"> 18 시</th>
								<c:forEach items="${roomList }" var="room">
									<td rowspan="1" class=" 21" id="room_${room.roomNo}_18"
									data-drr-max ="${room.roomEmpmax }"
										data-drr_num="${room.roomLoc}" data-drr-no="${room.roomNo }" data-drr_type="01"
										data-drt_time="18" data-drr_idx="1" data-drt_idx="10">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</c:forEach>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="reservation_form_modal" tabindex="-1"
		aria-labelledby="reservation_form_label" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			<form id='insertForm' method="post"
						action="${cPath }/gw/room/roomReservation.do">
				<div class="modal-header">
					<h5 class="modal-title" id="reservation_form_label">회의실 예약</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="roomreserStart" id="drr_idx" readonly="readonly">
					<input type="hidden" name="roomNo" id="drr_no" readonly="readonly">
					<div class="input-group mb-3">
						    <span class="input-group-text col-4 bg-secondary-subtle">예약 호실</span>
						    <input type="text" class="form-control" id="drr_num" readonly="readonly">
						</div>
						<div class="input-group mb-3">
						    <span class="input-group-text col-4 bg-secondary-subtle">예약 시간</span>
						    <input type="text" class="form-control" id="drr_start_time"  readonly="readonly">
						</div>

					<div class="input-group mb-3">
						<span class="input-group-text col-4 bg-secondary-subtle">부서(조직)/사원명</span>
						<c:forEach items="${empDepList }" var="empDep">
							<c:if test="${empDep.empNo == empDetail.empNo }">
								<input type="text" class="form-control" id="drr_dept"
							readonly="readonly" value="${empDep.company.organizationList[0].orgDep} / ${empDep.empNm}">
							</c:if>
						</c:forEach>

					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-4 bg-secondary-subtle">
									예약	인원</span>
							<input type="number" name="roomPeople" class="form-control" id="drr_people">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-4 bg-secondary-subtle">취소용
							비밀번호</span>
							<input type="password" class="form-control" id="drr_password"
							name="roomPass"	placeholder="숫자만 입력해주세요" required="required">
					</div>
					<span class="danger">회의실 예약은 취소 시 비밀번호가 필요합니다.</span>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">예약</button>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
				</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="reservationModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <input type="hidden" name="roomreserNo" id="roomreserNo">
                <h5 class="modal-title" id="roomDetailModalTitle">회의실 예약 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomNm" class="form-label">회의실</label>
                        <input type="text" id="roomNm" class="form-control" readonly />
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomLoc" class="form-label">예약자</label>
                        <input  type="text" id="empNm" class="form-control" readonly/>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomTime" class="form-label">예약시간</label>
                        <input  type="text" id="roomTime" class="form-control"  data-drr-max="${roomEmpmaxValue}" readonly/>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomEmpmax" class="form-label">예약 인원</label>
                        <input type="text" id="roomEmpmax" class="form-control" readonly />
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-4">
                        <label for="roomEmpmax" class="form-label">취소용비밀번호</label>
                        <input type="hidden" id="hiddenRoomPassword">
                        <input type="password" id="roomPassword" class="form-control"  required="required"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="roomDelete" class="btn btn-primary" >예약취소</button>
                <button type="button" id="" data-bs-dismiss="modal" class="btn btn-secondary" >닫기</button>
            </div>
        </div>
    </div>
</div>
<%-- <script src="${cPath }/resources/js/app/jhjUa/memberRoomList.js"></script> --%>
<script>
$(document).ready(function() {
    const reservationData = [
        <c:forEach items="${reservationList}" var="reservation">
            {
                empNo: '${reservation.empNo}',
                empNm:'${reservation.employee.empNm}',
                roomreserNo: '${reservation.roomreserNo}',
                orgDep:'${reservation.employee.orgDep}',
                roomNo: '${reservation.roomNo}',
                roomPass:'${reservation.roomPass}',
                roomPeople:'${reservation.roomPeople}',
                startTime: '${reservation.roomreserStart}',
                roomDate: '${reservation.roomDate}',
            },
        </c:forEach>
    ];
    $('#insertForm').on('submit', function(e) {
        e.preventDefault(); // 폼 제출 기본 동작 방지


        // 콘솔 로그 추가
        console.log('Room Max Element:', $('#roomEmpmax'));
        console.log('Room Max Data:', $('#roomEmpmax').data('drr-max'));

        const roomMax = parseInt($('#roomEmpmax').data('drr-max')); // 최대 인원
        const roomPeople = parseInt($('#drr_people').val()); // 예약 인원

        console.log('Room Max:', roomMax);
        console.log('Room People:', roomPeople);



        if (roomPeople > roomMax) {
            Swal.fire({
                title: '예약 인원 초과',
                text: `예약 인원이 최대 인원(${roomMax}명)을 초과했습니다.`,
                icon: 'error',
                confirmButtonText: '확인'
            });
        } else {
            Swal.fire({
                title: '예약하시겠습니까?',
                text: '예약을 진행하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 확인을 클릭했을 때, 폼 제출
                    this.submit();
                }
        });
        }
    });

    // Iterate through each cell in the reservation table
    $('.reserv-table tbody td').each(function() {
        const cell = $(this);
        const roomNo = cell.data('drr-no');      // Extract room number from the cell's data attribute
        const startTime = cell.data('drt_time'); // Extract start time from the cell's data attribute

        // Iterate through the reservation data
        reservationData.forEach(function(reservation) {
            // If the room number and start time match the reservation
            if (reservation.roomNo == roomNo && reservation.startTime == startTime) {
                // Disable the cell
                cell.css({
                    'background-color': 'rgb(210, 225, 247)',  // Change background color to show it's reserved
                    'pointer-events': 'auto'        // Allow clicks
                });
                // Display the reservation details
                cell.html(reservation.orgDep + ' / ' + reservation.empNm);

                cell.data({
                    'roomreser-no': reservation.roomNo,
                    'roomreser-nono':reservation.roomreserNo,
                    'emp-nm': reservation.empNm,
                    'room-loc': reservation.orgDep,
                    'room-empmax': reservation.roomPeople,
                    'room-pass':reservation.roomPass,
                    'room-start':reservation.startTime,
                    'isReserved': true
                });
            }
        });
    });

    // 예약 데이터 로드 및 셀 스타일 설정
    $.ajax({
        url: `${cPath}/gw/room/roomReservationData`,
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            const reservationData = data;  // 서버에서 가져온 예약 데이터

            $('.reserv-table tbody td').each(function() {
                const cell = $(this);
                const roomNo = cell.data('drr-no');
                const startTime = cell.data('drt_time');

                reservationData.forEach(function(reservation) {
                    if (reservation.roomNo === roomNo && reservation.startTime === startTime) {
                        // 예약된 셀 스타일 설정
                        cell.css({
                            'background-color': '#f5f5f5',
                            'pointer-events': 'none',
                            'color': '#ccc'
                        });
                        cell.html('Reserved by ' + reservation.empNm);
                        cell.data({
                            'roomreser-no': reservation.roomNo,
                            'roomreser-nono':reservation.roomreserNo,
                            'emp-nm': reservation.empNm,
                            'room-loc': reservation.orgDep,
                            'room-empmax': reservation.roomPeople,
                            'room-pass':reservation.roomPass,
                            'room-start':reservation.startTime,
                            'isReserved': true
                        });
                    }
                });
            });
        },
        error: function(xhr, status, error) {
            console.error('Error fetching reservation data:', status, error);
        }
    });

    // 셀 클릭 이벤트 핸들러
    $('.reserv-table tbody td').on('click', function() {
        const cell = $(this);
        const isReserved = cell.data('isReserved');

        if (isReserved) {
            // 예약된 경우, 예약 정보 모달 열기
            modal_setval(cell, true);
            $('#reservationModal').modal('show');
        } else {
            // 예약되지 않은 경우, 예약 폼 모달 열기
            modal_setval(cell, false);
            $('#reservation_form_modal').modal('show');
        }
    });

    // 모달에 데이터 설정
 function modal_setval(tdElement, isReserved) {
        if (isReserved) {
            // 예약된 경우roomreser-no
            $('#roomreserNo').val(tdElement.data('roomreser-nono'));
            $('#roomNm').val(tdElement.data('drr_num'));
            $('#empNm').val(tdElement.data('emp-nm')+' ('+tdElement.data('room-loc')+')');
            $('#roomLoc').val(tdElement.data('room-loc'));
            $('#roomPassword').val(''); // 비밀번호는 표시하지 않음
            $('#hiddenRoomPassword').val(tdElement.data('room-pass')); // 숨겨진 필드에 비밀번호 저장
            $('#roomEmpmax').val(tdElement.data('room-empmax')+' 명');
            $('#roomTime').val(tdElement.data('drt_time') + ':00 ~ ' + (parseInt(tdElement.data('drt_time')) + 1) + ':00');
            $('#roomUpdateLink').attr('href', `/updateReservation/${tdElement.data('roomreser-no')}`);
        } else {
            // 예약되지 않은 경우
            const startTime = tdElement.data('drt_time');
            $('#drr_idx').val(startTime);
            $('#drr_no').val(tdElement.data('drr-no'));
            $('#drr_num').val(tdElement.data('drr_num'));
            $('#drr_start_time').val(startTime + ':00 ~ ' + (parseInt(startTime) + 1) + ':00');
        }
        $('#reservation_form_modal').data('drr-max', tdElement.data('drr-max'));
    }

 $('#roomDelete').on('click', function() {
     Swal.fire({
         title: '예약 취소하시겠습니까?',
         text: '예약을 취소하시겠습니까?',
         icon: 'warning',
         showCancelButton: true,
         confirmButtonText: '확인',
         cancelButtonText: '취소'
     }).then((result) => {
         if (result.isConfirmed) {
             const enteredPassword = $('#roomPassword').val();
             const correctPassword = $('#hiddenRoomPassword').val(); // Get the correct password from hidden field

             if (enteredPassword === correctPassword) {
                 // 비밀번호가 일치하면 AJAX 요청 보내기
                 $.ajax({
                     url: `${cPath}/gw/room/roomReservationDelete.do`,
                     method: 'POST',
                     data: {
                         roomreserNo: $('#roomreserNo').val()  // 예약 번호
                     },
                     success: function(response) {
                         Swal.fire({
                             icon: 'success',
                             title: '예약 취소 성공',
                             text: '예약이 성공적으로 취소되었습니다.',
                             confirmButtonText: '확인'
                         }).then(() => {
                             location.reload();
                         });
                     },
                     error: function(xhr, status, error) {
                         Swal.fire({
                             icon: 'error',
                             title: '삭제 오류',
                             text: '예약 취소 중 오류가 발생했습니다.',
                             confirmButtonText: '확인'
                         });
                     }
                 });
             } else {
                 // 비밀번호가 일치하지 않으면 SweetAlert 표시
                 Swal.fire({
                     icon: 'error',
                     title: '비밀번호 오류',
                     text: '비밀번호가 일치하지 않습니다.',
                     confirmButtonText: '확인'
                 });
             }
         }
	});

});
});
    function modal_setval(tdElement) {
        var startTime = tdElement.data('drt_time');
        var endTime = parseInt(startTime) + 1;
        var roomNo = tdElement.data('drr-no');
        var roomLoc = tdElement.data('drr_num');

        // Set values in the modal
        $('#drr_idx').val(startTime);
        $('#drr_no').val(roomNo);
        $('#drr_num').val(roomLoc);
        $('#drr_start_time').val(startTime + ':00 ~ ' + endTime + ':00');

        // Open the modal
        openModal();
    }




$(document).ready(function() {
    const today = '<c:out value="${todayDate}" />';

    $('.reserv-table tbody td').each(function() {
        const cell = $(this);
        const roomNo = cell.data('drr-no');
        const startTime = cell.data('drt_time');

        // Iterate over the reservation data
        reservationData.forEach(function(reservation) {
            if (reservation.roomNo === roomNo && reservation.startTime === startTime && reservation.roomDate === cellDate) {
                // Disable the cell
                cell.css({
                    'background-color': '#f5f5f5',
                    'pointer-events': 'none',
                    'color': '#ccc'
                });

                // Show the EMP_NO
                cell.html('Reserved by ' + reservation.empNo);
                console.log('Cell ID:', cell.attr('id'));
            }
        });
    });
});



		function move_date(div, value) {
			if (div == 'Y')
				cur_date_01
						.setFullYear(cur_date_01.getFullYear() + (value * 1));
			if (div == 'M')
				cur_date_01.setMonth(cur_date_01.getMonth() + (value * 1));
			if (div == 'D')
				cur_date.setDate(cur_date.getDate() + (value * 1));
			location.href = '/room?Y=' + cur_date_01.getFullYear() + '&M='
					+ (cur_date_01.getMonth() + 1) + '&D='
					+ (cur_date.getDate());
		}

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// Create a new Date object to get the current date
							var today = new Date();

							// Define options for date formatting
							var options = {
								year : 'numeric',
								month : 'long',
								day : 'numeric'
							};

							// Format the date as a string
							var formattedDate = today.toLocaleDateString(
									'ko-KR', options);

							// Set the content of the <h2> element to the formatted date
							document.getElementById('current-date').textContent = formattedDate;
						});

		$(document).ready(function() {
	        // 현재 시간 가져오기
	        var now = new Date();
	        var currentHour = now.getHours(); // 현재 시간 (0~23)

	        // 예약 테이블의 모든 td 셀을 반복하면서 처리
	        $('.reserv-table tbody td').each(function() {
	            // 셀의 데이터 속성에서 시간을 가져옴
	            var roomTime = parseInt($(this).data('drt_time')); // 셀에 설정된 시간 (9, 10, 11 등)

	            // 현재 시간이 셀의 시간보다 크면 disable 처리
	            if (roomTime <= currentHour) {
	                // 클릭 이벤트 제거
	                $(this).off('click');
	                // 셀을 비활성화 스타일로 변경
	                $(this).css({
	                    'background-color': '#f5f5f5',
	                    'pointer-events': 'none',
	                    'color': '#ccc'
	                });
	            }
	        });

	        $('.reserv-table tbody td').on('click', function() {
	            var cell = $(this);
	            console.log('Cell ID:', cell.attr('id'));
	            $('#drr_no').val(cell.data().drrNo);
	            console.log('Data attributes:', cell.data().drrNo); // Log all data attributes
	            console.log('Data attributes:', cell.data());
	            modal_setval(cell);
	        });
	    });
</script>