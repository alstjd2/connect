<%@page import="kr.or.ddit.vo.MemberVOWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<div class="breadcrumbs overlay">
<%-- <c:if test="${not empty msg }"> --%>
<!-- 	결제 실패다 -->
<%-- </c:if> --%>

	<div class="back-img"
		style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="breadcrumbs-content">
					<h1 class="page-title">구매하기</h1>
					<p>
						일하는 모든 경험을 하나로 연결시켜,<br /> 완전한 팀을 만든는 새로운 변화를 만들어 갑니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<ul class="breadcrumb-nav">
					<li><a href="${cPath }/w/index.do">Home</a></li>
					<li>구매하기</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<section  class="pricing-table section">
	<div class="container" data-set-memNo="${principal.realUser.memNo}" data-set-comNo="${principal.realUser.comNo}" id="container"  >
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<span class="wow fadeInDown" data-wow-delay=".2s"
						style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">
						Group Ware </span>
					<h2 class="wow fadeInUp" data-wow-delay=".4s"
						style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
						기본형</h2>
					<h3 class="gray-bg">CONNECT</h3>
					<p class="wow fadeInUp" data-wow-delay=".6s"
						style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
						메일, 메신저, 근무관리, 전자결재 오피스 환경 구축을 한 번에 하나로 한 번에 관리 공용 게시판으로 누리는 우리
						회사의 소셜공간 지금 Connect 그룹웨어를 경험하세요.</p>

				</div>
			</div>
		</div>
		<div class="row  px-5 g-5 justify-content-center">

			<c:forEach var="prod" items="${Basic}">
				<div class="col-lg-6 col-md-6 col-12" id="Basic" data-set-prodNm="${prod.prodNm }" data-set-prodPrice="${prod.prodPrice }">
					<div class="single-table wow fadeInUp" data-wow-delay=".2s"
						style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
						<div class="table-head">
							<div class="price">
								<p class="amount">
									<fmt:formatNumber type="currency" maxFractionDigits="0"
										value="${prod.prodPrice / prod.prodUseDay }" />
									원<span class="duration">/1일 (소수점 생략)</span>
								</p>
							</div>
							<div class="title">
								<h4>
									결제금액 <br> <b><fmt:formatNumber type="currency"
											maxFractionDigits="3" value="${prod.prodPrice }" /></b>
								</h4>
								<span>/${prod.prodUseDay }일 기준 (부가세포함)</span>
							</div>
						</div>
						<ul class="table-list">
							<li><b>서비스 : </b> 메시지 <span>|</span> 메일 <span>|</span> 캘린더 <span>|</span>
								게시판 <span>|</span> 설문 <span>|</span> 화상회의 <span>|</span> 주소록 <span>|</span>
								드라이브 <span>|</span> 문서결재 <span>|</span> 인사관리 <span>|</span> 근태관리
							</li>
							<li><b>구성원수 : </b> 제한없음</li>
						</ul>
						<div class="button">
							<a id="${prod.prodNo }" class="btn buyDiv">구매</a>
							<!-- 							<a class="btn" id="buyReq" -->
							<%-- 								href="${cPath }/getReadyRequest?prod=${prod.prodNo}">구매하기</a> --%>
						</div>
					</div>
				</div>
			</c:forEach>



		</div>

		<div class="row mt-5 pt-5">
			<div class="col-12 pt-5">
				<div class="section-title">
					<span class="wow fadeInDown" data-wow-delay=".2s"
						style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">
						Group Ware </span>
					<h2 class="wow fadeInUp" data-wow-delay=".4s"
						style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
						이벤트 상품</h2>
					<h3 class="gray-bg">Event</h3>
					<p class="wow fadeInUp" data-wow-delay=".6s"
						style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
						메일, 메신저, 근무관리, 전자결재 오피스 환경 구축을 한 번에 하나로 한 번에 관리 공용 게시판으로 누리는 우리
						회사의 소셜공간 지금 Connect 그룹웨어를 경험하세요.</p>
				</div>
			</div>
		</div>
		<c:if test="${not empty Event }">
			<div class="row  px-5 g-5 justify-content-center" >

				<c:forEach var="event" items="${Event}">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="single-table wow fadeInUp" data-wow-delay=".2s"
							style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
							<div class="table-head">
								<div class="price">
									<p class="amount">
										<fmt:formatNumber type="currency" maxFractionDigits="0"
											value="${event.prodPrice / event.prodUseDay }" />
										원<span class="duration">/1일 (소수점 생략)</span>
									</p>
								</div>
								<div class="title">
									<h4>


										결제금액 <br> <b><fmt:formatNumber type="currency"
												maxFractionDigits="3" value="${event.prodPrice }" /></b>
									</h4>
									<span>/${event.prodUseDay }일 기준 (부가세포함)</span>
								</div>
							</div>
							<ul class="table-list">
								<li><b>서비스 : </b> 메시지 <span>|</span> 메일 <span>|</span> 캘린더
									<span>|</span> 게시판 <span>|</span> 설문 <span>|</span> 화상회의 <span>|</span>
									주소록 <span>|</span> 드라이브 <span>|</span> 문서결재 <span>|</span> 인사관리
									<span>|</span> 근태관리</li>
								<li><b>구성원수 : </b> 제한없음</li>
							</ul>
							<div class="button">
								<a id="${event.prodNo }" class="btn buyDiv">구매</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</section>
<div class="free-version-banner">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 offset-lg-2 col-12">
				<div class="section-title mb-60">
					<h2 class="text-white wow fadeInUp" data-wow-delay=".2s"
						style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
						더 궁금한 것이 있으시거나<br> 다른 도움이 필요하신가요?
					</h2>

					<div class="button">
						<a href="${cPath }/w/support/non.do" rel="nofollow"
							class="btn wow fadeInUp" data-wow-delay=".4s">문의하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
		const memNm = `${pageContext.request.userPrincipal.principal.realUser.memNm}`;
		const comNo = `${pageContext.request.userPrincipal.principal.realUser.company.comNo}`;

</script>

<script defer
			src="${cPath}/resources/webUser/assets/js/subscribe.js"></script>
</div>

