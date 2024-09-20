<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="button">
	<c:if test="${role eq 'PROVIDER' }">
		<a class="btn" href="${cPath}/promotion/eventForm.do">글 등록</a>
	</c:if>
</div>

<section class="py-5 container">
	<ul class="nav txt-button">

		<li class="nav-item" id="promo"><a
			href="${cPath}/promotion/eventList.do"
			class="txt-btn <c:if test="${tabs eq 'all'}">active</c:if>"> 전체
		</a></li>
		<li class="nav-item" id="promo"><a
			href="${cPath}/promotion/eventDetailList.do?promotion=off"
			class="txt-btn <c:if test="${tabs eq 'off'}">active</c:if>"> 오프라인
		</a></li>
		<li class="nav-item" id="promo"><a
			href="${cPath}/promotion/eventDetailList.do?promotion=on"
			class="txt-btn <c:if test="${tabs eq 'on'}">active</c:if>"> 온라인 </a></li>
		<li class="nav-item" id="promo">
		<a href="${cPath}/promotion/eventDetailList.do?promotion=sale"
			class="txt-btn <c:if test="${tabs eq 'sale'}">active</c:if>' }">할인행사 </a></li>
	</ul>
</section>

<div class="section pt-5 container event">
	<ul>
		<c:if test="${not empty promotion  }">
			<c:forEach items="${promotion }" var="pro">
				<li class="event-list"><a
					href="${cPath }/promotion/detailPage.do?promotion=${pro.promoNo}"
					class="row g-3">
						<p class="col-lg-1">${pro.common.conmcdCode }</p>
						<div class="col-lg-10">
							<h4 class="mb-3">${pro.board.boardTitle }</h4>
							<strong class="fs-5"> <i class="las la-calendar-check"></i>
								${pro.board.boardDate } <span>|</span> ${pro.promoStdate } ~
								${pro.promoEnddate }
							</strong>
							<%-- 							${fn:replace(pro.promoEnddate, '-', '')} --%>

							<c:set var="endDate">
								<fmt:parseDate value="${fn:replace(pro.promoEnddate, '-', '')}"
									pattern="yyyyMMdd" />
							</c:set>

							<c:set var="today" value="<%=new java.util.Date()%>" />
							<c:set var="nowDate">
								<fmt:formatDate value="${today}" pattern="yyyyMMdd" />
							</c:set>
						</div> <c:if test="${fn:replace(pro.promoEnddate, '-', '') <= nowDate }">
							<p class="col-lg-1">마감</p>
						</c:if> <c:if test="${fn:replace(pro.promoEnddate, '-', '') > nowDate }">
							<p class="col-lg-1 text-danger">모집중</p>
						</c:if> <!-- 					<button type="button" class="btn btn-dark col-lg-1">응모</button> -->
				</a></li>

			</c:forEach>
		</c:if>
		<c:if test="${empty promotion  }">
			진행하는 행사가 없습니다.
		</c:if>

	</ul>

	<ul class="d-flex gap-3 justify-content-center pagination">
		<li>
			<!-- <a href="#">Previous</a> --> <span><i
				class="las la-angle-left"></i></span>
		</li>
		<li><span class="act">1</span></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#"><i class="las la-angle-right"></i></a></li>
	</ul>
</div>

<div class="free-version-banner">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 offset-lg-2 col-12">
				<div class="section-title mb-60">
					<span class="text-white wow fadeInDown" data-wow-delay=".2s"
						style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">
						팀을 하나로 만드는 그룹웨어</span>
					<h2 class="text-white wow fadeInUp" data-wow-delay=".4s"
						style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">지금
						커넥트로 연결해보세요.</h2>
					<!-- <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">간편한 근태, 순쉬운 인력 관리를 제공하며<br/> 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.</p> -->
					<div class="button">
						<a href="#" rel="nofollow" class="btn wow fadeInUp"
							data-wow-delay=".6s">구독하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





