<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-xxl flex-grow-1 container-p-y blog-single ">
	<form>
		<div class="py-4 mb-4 mt-10">
			<div class="demo-inline-spacing pb-5 d-flex justify-content-between">
				<a href="${cPath }/w/promotion/list.do" type="button"
					class="btn rounded-pill btn-outline-primary">
					<i class='bx bx-arrow-back pe-2'></i> 뒤로가기
				</a>
			</div>
		</div>
		<div class="card my-5 py-10 px-10">
			<div class="detail-inner ">
				<!-- post meta -->
				<div class="row col-12">
					<div class="col-10">
						<h4 class="mb-0">
							이벤트 | <b>행사세일</b>
						</h4>
						<h2 class="post-title mb-4 ">${promotion.board.boardTitle }</h2>
					</div>
					<div class="col-2">
						<div class="d-flex justify-content-between align-items-center"
							style="position: relative;"></div>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<c:if test="${today <= promotion.promoEnddate }">
							<h4>
								<span class="badge bg-label-warning">진행중</span>
							</h4>
						</c:if>
						<c:if test="${today >= promotion.promoEnddate }">
							<h4>
								<span class="badge bg-label-danger">진행마감</span>
							</h4>
						</c:if>
					</div>
					<hr>
				</div>
				<div class="board-content pb-0">
					<div class="post-thumbnils"></div>
					<p>${promotion.board.boardContent }</p>
				</div>
				<div>
					<a href="event-write.html" id="boardModify" class="btn btn-success">수정하기</a>
					<a href="#" id="boarDel" class="btn btn-label-dark">삭제하기</a>
				</div>
			</div>
		</div>
	</form>
</div>
<%-- <!-- 구매 그래프  -->
 			<div class=" row card col-8 mb-5 mt-10">
 				<h4 class="post-title mb-4 pt-3 "><b>구매 현황</b></h4>
 				<div>
	                <canvas id="barChart" class="chartjs pb-10 px-5" data-height="400"></canvas>
 				</div>
            </div> --%>

	<div class="card my-5 py-10 px-5">
		<div class="row justify-content-around">
			<div class="col-8">
				<!-- 구매 그래프  -->
				<h4 class="post-title mb-10 pt-3 ">
					<b>구매 현황</b>
				</h4>
				<div>
					<canvas id="barChart" class="chartjs pb-10 px-5" data-height="400"></canvas>
				</div>
			</div>

			<div class="col-4">
				<!-- Current Plan -->
				<h4 class="post-title mb-10 pt-3 ">
					<b>등록 상품</b>
				</h4>
				<div class="card-body justify-content-between align-items-start">
						<div class="col-12 mb-1">
							<div class="mb-10">
								<div class="">
									<span class="badge bg-label-primary ">${promotion.prod.prodNm }</span>
									<div class="">
										<h1 class="mb-0 text-primary"><fmt:formatNumber type="currency" maxFractionDigits="3"
										value="${promotion.prod.prodPrice }" /></h1>
									</div>
								</div>
							</div>

							<div class="mb-2">
								<ul class="list-unstyled g-2 my-6">
			                        <li class="mb-2 d-flex align-items-center">
			                          <i class="bx bxs-circle bx-6px text-secondary me-2"></i><span>등록일시 :${promotion.board.boardDate } </span>
			                        </li>
			                        <li class="mb-2 d-flex align-items-center">
			                          <i class="bx bxs-circle bx-6px text-secondary me-2"></i><span>시작일시 :${promotion.promoStdate } </span>
			                        </li>
			                        <li class="mb-2 d-flex align-items-center">
			                          <i class="bx bxs-circle bx-6px text-secondary me-2"></i><span>종료일시 :${promotion.promoEnddate }</span>
			                        </li>
			                        <li class="mb-2 d-flex align-items-center">
			                          <i class="bx bxs-circle bx-6px text-secondary me-2"></i><span>상세내용1 : ${promotion.prod.prodDetailContent1 }</span>
			                        </li>
			                        <li class="mb-2 d-flex align-items-center">
			                          <i class="bx bxs-circle bx-6px text-secondary me-2"></i><span>상세내용1 : ${promotion.prod.prodDetailContent2 }</span>
			                        </li>
			                      </ul>

							</div>
						</div>
					<div>
						<a href="event-write.html" id="boardModify" class="btn btn-success">수정하기</a>
						<a href="#" id="boarDel"
							class="btn btn-label-dark">삭제하기</a>
					</div>
				</div>
				<!-- /Current Plan -->
			</div>
			<!--  -->


		</div>

	</div>

	<script type="text/javascript">
		const buyList = JSON.parse(`${salePromoBuyList}`);
		let labels = [];
		let data1 = [];
		let maxAmount = 0;

		for (let i = 0; i < buyList.length; i++) {
			let amount = buyList[i];
			console.log("buyList.length :", buyList[i]);

			labels.push(amount.buyDate.substr(0, 4) + "-"
					+ amount.buyDate.substr(4));
			data1.push(Math.round(amount.buyAmount));

			if (maxAmount < Math.round(amount.buyAmount)) {
				maxAmount = Math.round(amount.buyAmount);
			}
		}
	</script>
</div>

<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/event-view-sale.js" ></script>
