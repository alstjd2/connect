<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<section class="team-details section">
	<div class="container">
		<div class="row">
			<c:if test="${not empty member.company.comNm }">
				<div class="col-lg-6 col-12 skill-main mt-0 py-4">
					<div class="content ps-0">
						<span class="position">기업(단체)정보</span>
						<h3 class="name">
							<strong>
									${member.company.comNm }
							</strong>
						</h3>
						<ul class="personal-info">
<!-- 							<li><span>그룹웨어 도메인 : </span> <a -->
<!-- 								href="http://ddit.ncpworkplace.com">ddit.connect.com </a></li> -->
							<!-- null데이터는 없음으로 표기하거나 노출하지 않음 -->
							<li><span>기업 명 : </span> ${member.company.comNm }</li>
							<li><span>사업자 등록번호 : </span> ${member.company.comBsno }</li>
							<li><span>사업자 주소 : </span> ${member.company.comAdr }</li>
							<li><span>사업자 연락처 : </span> ${member.company.comTel }</li>
							<li><span>매출규모 : </span> <fmt:formatNumber value="${member.company.comSapr }" pattern="#,###"/>원</li>
							<li><hr /></li>
						</ul>
						<c:choose>
							<c:when test="${ not empty member.endDate and member.endDate gt 0 }">
								<div class="pt-3 mb-4">
									<div class="skill-title pt-2">
										<h4>그룹웨어 만료기간</h4>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="70"
											aria-valuemin="0" aria-valuemax="100"
											style="width: calc(1% * ( 24 * 100/ 31));">
											<span>${member.endDate }</span>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="pt-3 mb-4">
									<div class="skill-title pt-2">
										<h4>그룹웨어 만료기간</h4>
										<ul>
											<li><br></li>
										</ul>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="70"
											aria-valuemin="0" aria-valuemax="100"
											style="width: calc(1% * ( 0 * 100/ 31));">
											<span>0</span>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<!-- <div>
                            <div class="chart" data-percent="73"><span>73</span>%</div>
                            <input type="button" class="updatePieCharts" value="updatePieCharts"></input>
                        </div> -->
						<div class="pay d-grid gap-3 d-md-block">
							<a href="#" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">환불하기</a>
							<a href="${cPath }/w/subscribeView.do" class="btn btn-outline-info ">구독하기</a>
							<a href="${cPath }/w/mypage/mypageError.do" class="btn btn-outline-danger ">오류접수</a>
							<c:if test="${ not empty member.endDate and member.endDate gt 0 }">
								<a class="btn btn-outline-success" id="groupwareBtn">그룹웨어 계정</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${empty member.company.comNm }">
				<div class="col-lg-6 col-12 skill-main mt-0 py-4">
					<div class="content ps-0">
						<span class="position">기업(단체)정보</span>
						<ul class="personal-info">
							<li><br></li>
							<li><br></li>
							<li>입력된 기업정보가 없습니다.<br></li>
							<li><br></li>
							<li><br></li>
							<li><hr /></li>
						</ul>
						<div class="pt-3 mb-4">
							<div class="skill-title pt-2">
								<h4>그룹웨어 만료기간</h4>
								<ul>
									<li><br></li>
								</ul>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70"
									aria-valuemin="0" aria-valuemax="100"
									style="width: calc(1% * ( 0 * 100/ 31));">
									<span>0</span>
								</div>
							</div>
						</div>
						<div class="pay d-grid gap-3 d-md-block">
							<a href="${cPath }/w/member/companyJoinForm.do" class="btn btn-outline-warning ">기업등록</a> <a
								href="${cPath }/w/mypage/mypageError.do" class="btn btn-outline-danger ">오류접수</a>
						</div>
					</div>
				</div>
			</c:if>

			<div class="col-lg-6 col-12 skill-main mt-0 py-4">
				<div class="content ps-0">
					<span class="position">회원 정보</span>
					<h3 class="name">
						<strong>
							${member.memNm }
						</strong>
					</h3>
					<ul class="personal-info">
						<li><span>회원 아이디 : </span> ${member.memId }</li>
						<li><span>회원 이름 : </span> ${member.memNm }</li>
						<li><span>회원 생년월일 : </span> ${member.memBir }</li>
						<li><span>회원 이메일 : </span> ${member.memEmail }</li>
						<li><span>회원 전화번호 : </span> ${member.memPhone }</li>
						<li><hr /></li>
					</ul>
					<div class="pay d-grid gap-3 d-md-block">
						<a href="${cPath }/w/mypage/updateForm.do" class="btn btn-outline-warning ">회원 수정</a>
						<a href="drop-out.html" class="btn btn-outline-dark ">회원탈퇴</a>
					</div>
				</div>
			</div>

		</div>
		<hr class="my-5" />
		<div class="row">
			<div class="col-12">
				<div class="details-info text-center">
					<div
						class="heading d-flex align-items-center flex-wrap justify-content-between gap-3 my-0">
						<h3>
							결제 내역 <strong class="fs-5 ps-2 text-secondary"> 총 ${buyCnt }개(최근순)</strong>
						</h3>
						<form class="search" action="#">
							<input type="text" placeholder="검색어를 입력하세요.">
							<button type="submit">
								<i class="las la-search"></i>
							</button>
						</form>
					</div>
					<ul class="overflow-hidden">
						<li class="row py-3 head">
							<h6 class="col-md-2 px-2">순번</h6>
							<h6 class="col-md-2 px-2">상품</h6>
							<h6 class="col-md-2 px-2">구매날짜</h6>
							<h6 class="col-md-2 px-2">사용시작날짜</h6>
							<h6 class="col-md-2 px-2">만료날짜</h6>
							<h6 class="col-md-2 px-2">환불여부</h6>
<!-- 							<h6 class="col-md-2 px-2">거래명세표</h6> -->
						</li>
						<c:if test="${not empty buyList }">
							<c:forEach items="${buyList }" var="buy">
								<div id="listDiv"></div>

								<li class="row py-3 list ">

									<p class="col-md-2 px-2 m-0">
										<b>결제번호</b> ${buy.cnt }
									</p>
									<p class="col-md-2 px-2 m-0">
										<b>상품명</b> <span
											class="badge
											<c:choose>
												<c:when test="${buy.prodNo == 1 }">
													month
												</c:when>
												<c:when test="${buy.prodNo == 2 }">
													year
												</c:when>
												<c:otherwise>
													event
												</c:otherwise>
											</c:choose>
										">
											${buy.prod.prodNm } </span>
									</p>
									<p class="col-md-2 px-2 m-0">
										<b>구매날짜</b> ${buy.buyDate }
									</p>
									<p class="col-md-2 px-2 m-0">
										<b>사용시작날짜</b>
										<fmt:parseDate var="date1" value="${buy.buyUseStartDate }"
											pattern="yyyyMMdd" />
										<fmt:formatDate value="${date1 }" pattern="yyyy-MM-dd" />
									</p>
									<p class="col-md-2 px-2 m-0">
										<b>만료날짜</b>
										<fmt:parseDate var="date2" value="${buy.buyUseEndDate  }"
											pattern="yyyyMMdd" />
										<fmt:formatDate value="${date2 }" pattern="yyyy-MM-dd" />
									</p>
									<p class="col-md-2 px-2 m-0">
										<b>환불여부</b>
										<c:if test="${buy.buyRefn eq 'N' }">구매</c:if>
										<c:if test="${buy.buyRefn ne 'N' }">환불</c:if>
									</p>
									<%-- <p class="col-md-2 px-2 m-0">
										<c:if test="${buy.buyUseStartDate }"></c:if>
										<b>거래명세표</b> <a href="#" download> <i
											class="las la-download"></i>
										</a>
									</p> --%>
								</li>

							</c:forEach>
						</c:if>
						<c:if test="${empty buyList }">
							<li class="py-3 list ">
							결제 정보가 없습니다
							</li>
						</c:if>
					</ul>

				</div>
				<!-- <ul class="d-flex gap-3 justify-content-center pagination">
					<li>
						<a href="#">Previous</a> <span><i
							class="las la-angle-left"></i></span>
					</li>
					<li><span class="act">1</span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#"><i class="las la-angle-right"></i></a></li>
				</ul> -->
			</div>
		</div>
	</div>
</section>

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header pb-0">
				<h1 class="modal-title fs-5" id="exampleModalLabel">환불 신청</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="border border-light p-3">
					<h5 class="pb-2">월간권</h5>
					<p>
						사용 등록날짜 <b>이후 7일 이내 환불 가능</b>
					</p>
					<p>
						사용 등록날짜 <b>이후 7일 이후 환불 불가능</b>
					</p>
				</div>
				<div class="border border-light p-3">
					<h5 class="pb-2">연간권</h5>
					<p>
						사용 등록날짜 <b>이후 7일 이내 환불가능</b>
					</p>
					<p>(구매 시작 월 계산 후 신청 해당월 미포함될 수 있습니다.)</p>
				</div>
			</div>
			<div class="modal-footer pt-0">
				<button type="button" class="btn btn-ok refnBtn" data-bs-toggle="modal" data-bs-target="#refnModal" >
					<i class="las la-paper-plane"></i> 신청가능 목록보기
				</button>
				<button type="button" class="btn btn-no" data-bs-dismiss="modal">
					<i class="las la-times"></i> 취소
				</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="refnModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header pb-0">
				<h1 class="modal-title fs-5" id="exampleModalLabel">환불 진행</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="border border-light p-3">
				<!-- 환불 가능한 내역 추출 -->
					<p>
						환불 가능한 내역만 출력됩니다.
					</p>
					<table class="table">
						<thead class="table-light">
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>구매날짜</th>
								<th>사용시작날짜</th>
								<th>사용만료날짜</th>
							</tr>
						</thead>

						<tbody class="table-border-bottom-0" id="refnTBody">
							<tr>
								<td><i class="fab fa-angular fa-xl text-danger me-4"></i>
								<span>1</span></td>
								<td>Aㄴㄹ</td>
								<td>
									<ul
										class="list-unstyled m-0 avatar-group d-flex align-items-center">
										<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
											data-bs-placement="top" class="avatar avatar-xs pull-up"
											aria-label="Lilian Fuller"
											data-bs-original-title="Lilian Fuller"></li>
										<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
											data-bs-placement="top" class="avatar avatar-xs pull-up"
											aria-label="Sophia Wilkerson"
											data-bs-original-title="Sophia Wilkerson"></li>
										<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
											data-bs-placement="top" class="avatar avatar-xs pull-up"
											aria-label="Christina Parker"
											data-bs-original-title="Christina Parker"></li>
									</ul>
								</td>
								<td><span class="badge bg-label-primary me-1">Active</span></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<div class="modal-footer pt-0">
				<button type="button" class="btn btn-ok okBtn" >
					<i class="las la-paper-plane"></i> 신청
				</button>
				<button type="button" class="btn btn-no" data-bs-dismiss="modal">
					<i class="las la-times"></i> 취소
				</button>
			</div>
		</div>
	</div>
</div>


<script src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script src="${cPath}/resources/webUser/assets/js/mypage.js"></script>

<div class="modal fade" id="groupwareModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header pb-0">
				<h1 class="modal-title fs-5" id="exampleModalLabel">그룹웨어 계정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="modal-list-body">

			</div>
			<div class="modal-footer pt-0" id="modal-list-btn">

			</div>
		</div>
	</div>
</div>

<script src="${cPath}/resources/js/app/jhjTa/web/memberMypage.js"></script>


