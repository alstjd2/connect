<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrumbs overlay">
	<div class="back-img"
		style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="breadcrumbs-content">
					<h1 class="page-title">참고자료</h1>
					<p>
						커넥트에서 제공하는 참고자료로<br/> 읽어보시면 커넥트 사용시 도움이 됩니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<ul class="breadcrumb-nav">
					<li><a href="${cPath }/w/index.do">Home</a></li>
					<li><a href="#">참고자료</a></li>
					<li><a href="#">공지사항</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<section class="py-5 container">
	<ul class="nav txt-button">
		<li class="nav-item"><a href="${cPath}/w/notice/list.do"
			class="txt-btn <c:if test="${empty tabs}">active</c:if>"> 전체 </a></li>
		<li class="nav-item"><a href="${cPath}/w/notice/detailList.do?notice=notice"
			class="txt-btn <c:if test="${tabs eq 'notice'}">active</c:if>"> 공지사항 </a></li>
		<li class="nav-item"><a href="${cPath}/w/notice/detailList.do?notice=update"
			class="txt-btn <c:if test="${tabs eq 'update'}">active</c:if>"> 업데이트 </a></li>
	</ul>
</section>
<div class="section pt-5 container event">

	<ul>
		<c:if test="${not empty boardList  }">
			<c:forEach items="${boardList }" var="board">
				<li class="notice-list"><a href="${cPath }/w/notice/detailPage.do?board=${board.boardNo}" class="row g-3">
						<p class="col-lg-1">${board.commoncodeDetail.conmcdCode }</p>
						<div class="col-lg-9">
							<h5>${board.boardTitle }</h5>
						</div> <span class="col-lg-2 text-end">${board.boardDate }</span>
				</a></li>
			</c:forEach>

		</c:if>
		<c:if test="${empty boardList  }">
			진행하는 행사가 없습니다.
		</c:if>

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
						<a href="${cPath }/w/subscribeView.do" rel="nofollow" class="btn wow fadeInUp"
							data-wow-delay=".6s">구독하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
