<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
<script type="text/javascript">
	const currentEmpNo = '${principal.realUser.empNo}';
	const currentEmpNm = '${principal.realUser.empNm}';
</script>


<div class="container-xxl flex-grow-1 container-p-y">
	<div class="app-kanban">
		<div class="card overflow-hidden">
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container-fluid">
					<a class="navbar-brand" href="javascript:void(0)">
						<i class="menu-icon tf-icons bx bx bx-camera-home"></i>
						화상회의
					</a>
				</div>
			</nav>
			<p class="card-header" style="text-align: right; color: lightgrey;">conference</p>
			<div class="card-body">
				<div class="row">
					<div class=" text-center mb-4">
						<div class="card-header">
							<div class="nav-align-top">
								<ul class="nav nav-pills justify-content-center" role="tablist">
									<li class="nav-item col col-md-4" role="presentation">
										<div class="col-md mb-md-0 mb-5 active" role="tab"
											data-bs-toggle="tab"
											data-bs-target="#navs-pills-within-card-active"
											aria-controls="navs-pills-within-card-active"
											aria-selected="true">
											<div
												class="form-check custom-option custom-option-icon checked">
												<label class="form-check-label custom-option-content"
													for="customRadioIcon2"> <span
													class="custom-option-body"> <i
														class='bx bx-video-plus'></i> <span
														class="custom-option-title"> 회의생성 </span> <small>
															HOST </small>
												</span> <input name="customOptionRadioIcon"
													class="form-check-input" checked="" type="radio" value=""
													id="customRadioIcon2">
												</label>
											</div>
										</div>
									</li>
									<li class="nav-item col col-md-4" role="presentation">
										<div class="col-md" role="tab" data-bs-toggle="tab"
											data-bs-target="#navs-pills-within-card-link"
											aria-controls="navs-pills-within-card-link"
											aria-selected="false" tabindex="-1">
											<div class="form-check custom-option custom-option-icon">
												<label class="form-check-label custom-option-content"
													for="customRadioIcon3"> <span
													class="custom-option-body"> <i
														class='bx bx-log-in-circle'></i> <span
														class="custom-option-title"> 회의입장 </span> <small>CLIENT</small>
												</span> <input name="customOptionRadioIcon"
													class="form-check-input" type="radio" value=""
													id="customRadioIcon3">
												</label>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<div class="tab-content py-10">
								<div class="tab-pane fade show py-10 active"
									id="navs-pills-within-card-active" role="tabpanel">
									<div class="d-flex align-items-center justify-content-center ">
										<form id="createRoomForm"
											class="w-px-400 border rounded p-3 p-md-5"
											action="${pageContext.request.contextPath}/gw/conference/createRoom"
											method="post">
											<h3 class="mb-6">회의생성</h3>
											<div class="mb-6 text-start">
												<label class="form-label" for="roomTitle">회의 제목</label> <input
													type="text" id="roomTitle" name="roomTitle"
													class="form-control" placeholder="회의 제목을 입력하세요" required>
											</div>
											<div class="mb-6 text-start">
												<label class="form-label" for="roomUrlId">회의ID</label> <input
													type="text" id="roomUrlId" name="roomUrlId" maxlength="20"
													class="form-control" placeholder="회의 URL ID를 입력하세요" required>
											</div>

											<div class="mb-6 text-start form-password-toggle">
												<label class="form-label" for="passwd">회의Password</label>
												<div class="input-group input-group-merge">
													<input type="password" id="passwd" class="form-control" maxlength="20"
														name="passwd" placeholder="············"
														aria-describedby="form-alignment-password2" required> <span
														class="input-group-text cursor-pointer"
														id="form-alignment-password2"><i class="bx bx-hide"></i></span>
												</div>
											</div>
											<div class="mb-6 text-start">
												<label class="form-label" for="startDate">회의 시작 시간</label> <input
													type="datetime-local" id="startDate" name="startDate"
													class="form-control custom-datetime" required>
											</div>
											
											<input type="hidden" id="callType" name="callType"
												value="P2P"> <input type="hidden" id="liveMode"
												name="liveMode" value="false"> <input type="hidden"
												id="maxJoinCount" name="maxJoinCount" value="10"> <input
												type="hidden" id="liveMaxJoinCount" name="liveMaxJoinCount"
												value="5"> <input type="hidden" id="sfuIncludeRole"
												name="sfuIncludeRole" value="false">


											<div class="d-grid gap-2">
												<button type="button"class="btn btn-label-primary" id="dataBtn">자동입력</button>
												<button type="submit" class="btn btn-primary">생성</button>
											
											</div>
										</form>
									</div>
								</div>


								<div class="tab-pane fade py-2" id="navs-pills-within-card-link"
									role="tabpanel">

									<div class="table-responsive w-80" style="margin: auto;">

										<table class="table card-table table-hover">
											<thead class="table-secondary">
												<tr>
													<th class="border-top-0" style="width: 13%;">번호</th>
													<th class="border-top-0" style="width: 23%;">회의 제목</th>
													<th class="border-top-0" style="width: 23%;">회의 날짜</th>
													<th class="border-top-0" style="width: 20%;">시작 시간</th>
													<th class="border-top-0" style="width: 14%;"></th>
												</tr>
											</thead>
											<tbody id="conferenceList">
												<c:choose>
													<c:when test="${not empty conferenceList}">
														<c:forEach items="${conferenceList}" var="conference">
															<tr>
																<td>${conference.rnum}</td>
																<td>${conference.roomTitle}</td>
																<td>${conference.roomUrlId}</td>
																<td>${conference.startDate}</td>
																<td>입장</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="5">등록된 화상회의가 없습니다.</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<nav aria-label="Page navigation text-center">
											<ul id="pagination"
												class="pagination pagination-rounded justify-content-center pt-7">
												<!-- 페이지 번호 추가 -->
											</ul>
										</nav>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 페이지 로드 시 성공적으로 수정되었다면 알림을 표시
const urlParams = new URLSearchParams(window.location.search);
if (urlParams.has('success') && urlParams.get('success') === 'true') {
    Swal.fire({
        icon: 'success',
        title: '수정이 완료되었습니다.',
        showConfirmButton: false,
        timer: 1500
    }).then(() => {
        // 알림이 표시된 후 URL 파라미터에서 success 제거
        urlParams.delete('success');
        window.history.replaceState({}, '', `${window.location.pathname}?${urlParams.toString()}`);
    });
}

document.addEventListener('DOMContentLoaded', function() {
    // 현재 날짜와 시간을 ISO 형식으로 가져오기
    const now = new Date();
    const offset = now.getTimezoneOffset();
    now.setMinutes(now.getMinutes() - offset);
    const isoString = now.toISOString().slice(0, 16); // 'YYYY-MM-DDTHH:MM' 형식

    // input 요소에 min 값 설정
    const startDate = document.getElementById('startDate');
    startDate.setAttribute('min', isoString);
  });
  
document.getElementById('roomTitle').addEventListener('input', function() {
    const maxLength = 20;
    const currentLength = this.value.length;

    if (currentLength > maxLength) {
        Swal.fire({
            icon: 'warning',
            title: '주의',
            text: '회의 제목은 최대 20자까지 입력 가능합니다.',
            showConfirmButton: false,
            timer: 1500
        });
        this.value = this.value.slice(0, maxLength);
    }
});
</script>

<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/conferenceInsert.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/conferenceList.js"></script>