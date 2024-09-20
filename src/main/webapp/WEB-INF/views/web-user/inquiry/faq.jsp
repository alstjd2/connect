<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="breadcrumbs overlay">
	<div class="back-img"
		style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="breadcrumbs-content">
					<h1 class="page-title">지원</h1>
					<p>
						서비스 사용 중 발생한 이슈 <br />또는 궁금증을 지원페이지에서 확인하실 수 있습니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<ul class="breadcrumb-nav">
					<li><a href="${cPath }/w/index.do">홈</a></li>
					<li><a href="${cPath }/w/support.do">지원</a></li>
					<li>자주 묻는 질문</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<section class="section content guide-section py-5">
	<div class="row pt-5">
		<div class="col-12 pt-5">
			<div class="section-title px-0">
				<h2 class="wow fadeInUp" data-wow-delay=".2s"
					style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
					자주 묻는 질문</h2>
			</div>
		</div>
	</div>
	<nav class="container">

		<div class="tab-content pt-3" id="pills-tabContent">
			<c:if test="${not empty boardList }">
				<div class="accordion wow fadeInUp" data-wow-delay=".8s"
					style="visibility: visible;">
					<c:forEach items="${boardList }" var="board" varStatus="status">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${status.index}">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#collapse${status.index}" aria-expanded="false"
									aria-controls="collapse${status.index}">
									<span>${board.boardTitle }</span><i class="las la-angle-down"></i>
								</button>
							</h2>
							<div id="collapse${status.index}"
								class="accordion-collapse collapse"
								aria-labelledby="heading${status.index}"
								data-bs-parent="#accordionExample" style="">
								<div class="accordion-body">
									<p>${board.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
</section>
<section class="section pt-0"> 
	<nav aria-label="Page navigation">
		<!-- 기존 페이징 HTML을 이 div 안에 넣습니다 -->
		<ul class="d-flex gap-3 justify-content-center pagination mt-0">
			<div class="paging-area">${pagingHTML}</div>
		</ul>
	</nav>
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
						<!-- <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">간편한 근태, 순쉬운 인력 관리를 제공하며<br/> 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.</p> -->

						<div class="button">
							<a href="inquiry-before.html" rel="nofollow"
								class="btn wow fadeInUp" data-wow-delay=".4s">문의하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <form:form id="searchform" method="get" modelAttribute="condition">
		<form:hidden path="searchType" />
		<form:hidden path="searchWord" />
		<input type="hidden" name="page" />
	</form:form> <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <script
		type="text/javascript" src="${cPath}/resources/js/app/utils/paging.js"></script>
	<script type="text/javascript"
		src="${cPath}/resources/js/app/utils/fetchUtils.js"></script> <script
		type="text/javascript"
		src="${cPath}/resources/js/app/hjadr/addressList.js"></script>