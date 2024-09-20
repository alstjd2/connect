<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<security:authorize access="isAuthenticated()">
   <security:authentication property="principal" var="principal" />
   <security:authentication property="authorities" var="authorities" />
</security:authorize>

	<div class="breadcrumbs overlay">
		<div class="back-img"
			style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">참고자료</h1>
						<p>
							커넥트에서 제공하는 참고자료로<br /> 읽어보시면 커넥트 사용시 도움이 됩니다.
						</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="${cPath }/w/index.do">Home</a></li>
						<li><a href="#">참고자료</a></li>
						<li><a href="#">이벤트</a></li>
						<li>오프라인</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="blog-single py-0">
		<div class="container">
			<div class="single-inner py-5">
				<div class="post-details">
					<div class="detail-inner ">
						<!-- post meta -->
						<h2 class="post-title mb-4">${promotion.board.boardTitle}</h2>

						<ul class="custom-flex post-meta">
							<li><i class="las la-calendar-check">등록날짜: </i>
								${promotion.board.boardDate }</li>
							<li><i class="las la-clock">행사기간: </i>
								${promotion.promoStdate } - ${promotion.promoEnddate }</li>
							<c:if test="${promotion.promoNum > 0}">
								<li><i class="las la-user ">수용인원: </i> ${promotion.promoNum }
								</li>
								<li><i class="las la-user ">신청인원: </i> ${peopleCnt }</li>
							</c:if>
						</ul>
						<hr />

						<div class="modal-footer pt-0 button">
							<div class="board-content">
								<p>${promotion.board.boardContent}</p>
<%-- 								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> --%>
<%-- 									<c:set var="today" value="<%=new java.util.Date()%>" /> --%>
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<c:set var="nowDate">
								<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
							</c:set>
								<c:if test="${nowDate <= promotion.promoEnddate }">
									<c:if test="${promotion.board.boardType eq 'EB06120'}">
										<a href="javascript:;" data-bs-toggle="modal"
											data-bs-target="#exampleModal" class="btn btn-primary modal-dialog-centered">
											참가 신청하기</a>
									</c:if>
								</c:if>

								<!-- 모달 -->
								<div class="modal fade comment-form" id="exampleModal"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered ">
										<div class="modal-content p-5">
											<div class="modal-header pb-0">

											</div>
											<div class="modal-body">
												<h3>${promotion.board.boardTitle}</h3>
												<ul class="custom-flex post-meta">
													<li><i class="las la-calendar-check">등록날짜: </i>
														${promotion.board.boardDate }</li>
													<li><i class="las la-clock">행사기간: </i>
														${promotion.promoStdate } - ${promotion.promoEnddate }</li>
													<c:if test="${promotion.promoNum > 0}">
														<li><i class="las la-user ">수용인원: </i> ${promotion.promoNum }</li>
														<li><i class="las la-user ">신청인원: </i> ${peopleCnt }</li>
													</c:if>
												</ul>
											<form:form method="post" modelAttribute="offEduForm" path="inputForm">
												<div class="mb-3 form-floating">
													<form:input type="text" cssClass="form-control" path="memNm"
														placeholder="홍길동" required="required" /> <label
														for="floatingInput">신청자</label>
												</div>
												<div class="mb-3 form-floating">
													<form:input type="text" value="${principal.realUser.company.comNm }"
														cssClass="form-control" path="offeduComnm" placeholder="커넥트"
														readonly="true" /><label for="floatingInput">기업명</label>
												</div>
												<div class="form-floating">
													<form:input type="number" cssClass="form-control"
														path="offeduOfferNum" placeholder="3" required="required" />
													<label for="floatingInput">참가자 수</label>
												</div>
													<form:input type="hidden" cssClass="form-control"
														path="promoNo" placeholder="3" required="required" value="${promotion.promoNo }"/>
												<div class="col-12 text-center mt-5 mb-1">
													<c:if test="${empty principal.realUser.company.comNm}">
														<p>로그인 후 신청이 가능합니다.</p>
													</c:if>
													<c:if test="${not empty principal.realUser.company.comNm}">
														<p>신청 후 철회가 불가능하오니 신중한 선택부탁드립니다.</p>
														<button type="button" onclick="btnChk()" class="btn btn-primary me-3">신청</button>
														<button type="submit" style="display:none" id="submitBtn"></button>
													</c:if>
													<button type="reset" id="closeBtn" class="btn btn-label-secondary"
														data-bs-dismiss="modal" aria-label="Close">취소</button>
												</div>
											</form:form>
										</div>

										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="post-tags-media">
								<a href="${cPath}/w/promotion/list.do"> <i class="las la-arrow-left"></i> 목록으로
								</a>
						 	</div>
					</div>
				</div>
			</div>
		</div>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
		const msg = `${massage}`;
		const boardNo = `${promotion.board.boardNo}`;
		const possible = `${promotion.promoNum - peopleCnt}`;
		const inputNum = document.querySelector("#offeduOfferNum");
		const subBtn = document.querySelector("#submitBtn");
		const inputForm = document.querySelector("#inputForm");

		function btnChk() {
			const res = inputNum.value <= Number(possible);

			if (﻿res) {
				subBtn.click();
				}
			else{
					swal({
						title : "오프라인 교육이 신청 실패되었습니다",
						icon  : "error",
						closeOnClickOutside : false
						}).then(function(){
						location.href="${cPath}/w/promotion/detailPage.do?promotion="+boardNo;
					});
				}
			}


		if(msg){
				swal({
					title : "오프라인 교육이 신청 완료되었습니다",
					icon  : "success",
					closeOnClickOutside : false
					}).then(function(){
					location.href="${cPath}/w/promotion/detailPage.do?promotion="+boardNo;
				});



		}
  	</script>
	</section>