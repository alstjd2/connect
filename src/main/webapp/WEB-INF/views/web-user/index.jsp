<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Start Hero Area -->
    <section class="hero-area">
        <div class="verticle-lines">
            <div class="vlines one"></div>
            <div class="vlines two"></div>
            <div class="vlines three"></div>
            <div class="vlines four"></div>
        </div>
        <!-- Single Slider -->
        <div class="hero-inner">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider">
                            <div class="hero-text">
                                <h5 class="wow fadeInUp" data-wow-delay=".3s">팀을 하나로 만드는 그룹웨어 </h5>
                                <h1 class="wow fadeInUp" data-wow-delay=".5s">
                                    사람<span class="fw-light">과</span> 사람<span class="fw-light">을</span> <br>
                                    커넥트<span class="fw-light">하다.</span>
                                </h1>
                                <p class="wow fadeInUp" data-wow-delay=".7s">
                                    간편한 근태, 순쉬운 인력 관리를 제공하며 <br>
                                    소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.
                                </p>
                                <div class="button wow fadeInUp" data-wow-delay=".9s">
                                    <a href="${cPath }/w/about/us.do" class="btn">About US</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="hero-image">
                            <img class="shape3" src="${cPath}/resources/webUser/assets/images/hero/shape3.png" alt="#">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->
    <section id="core-features" class="core-features universal-demo section style3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <span class="wow fadeInDown" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">
                            Services
                        </span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s"
                            style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            이 모든 서비스를 한번에 커넥트에서
                        </h2>
                        <!-- <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.
                        </p> -->
                        <h3 class="overlay-text">Services</h3>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/message.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-comment"></i>
                                </div>
                                <h3>메시지</h3>
                            </div>
                            <p>가장 강력한 커뮤니케이션 그 시작은 커넥트 메시지로 부터</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/mail.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-envelope"></i>
                                </div>
                                <h3>메일</h3>
                            </div>
                            <p>기업 전용 도메인으로 안심하고 일할 수 있는 업무용 메일</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/calendar.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-calendar"></i>
                                </div>
                                <h3>캘린더</h3>
                            </div>
                            <p>모든 일정일 한곳에서 한눈에 업무일정과 자원관리가 가능한 캘린더 </p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/todo.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-list-alt"></i>
                                </div>
                                <h3>할일</h3>
                            </div>
                            <p>손으로 기록하는 업무 대신 효과적인 온라인 업무관리 할 일</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/board.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-th-list"></i>
                                </div>
                                <h3>게시판</h3>
                            </div>
                            <p>사내 소식을 전사 곳곳에 빠르게 전하고 소통을 이끌어 갈 수 있는 사내 게시판</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/survey.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-chart-pie"></i>
                                </div>
                                <h3>설문</h3>
                            </div>
                            <p>전략적 의사결정에 인사이트를 더할 수 있는 설문지</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/conference.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-video"></i>
                                </div>
                                <h3>화상회의</h3>
                            </div>
                            <p>쉽고 간편하지만 강력한 음성 및 영상 미팅 기능 화상회의</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/address.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-address-book"></i>
                                </div>
                                <h3>주소록</h3>
                            </div>
                            <p>업무에 필요한 연락처와 정보가 한곳에 모여 있는 주소록</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/drive.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-cloud"></i>
                                </div>
                                <h3>드라이브</h3>
                            </div>
                            <p>회사의 디지털 자산을 축적하는 공간 클라우드 드라이브</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/approval.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-file-alt"></i>
                                </div>
                                <h3>결재관리</h3>
                            </div>
                            <p>언제 어디서나 빠르고 정확한 의사결정을 위한 결재문서</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/personnel.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-users-cog"></i>
                                </div>
                                <h3>인사관리</h3>
                            </div>
                            <p>흩어져있는 정보를 한곳에서 관리 기업의 성장에 필요한 인사관리 </p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/attendance.do" class="single-feature wow fadeInUp" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="d-flex align-items-center gap-3">
                                <div class="icon">
                                    <i class="las la-history"></i>
                                </div>
                                <h3>근태관리</h3>
                            </div>
                            <p>클릭 한번으로 원클릭 출퇴근 기록 체크 투명하고 스마트한 근로문화의 시작 </p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="faq section">
        <img class="round-shape wow zoomInLeft" data-wow-delay="0.3s" src="${cPath}/resources/webUser/assets/images/about/round-shape.svg" alt="#"
            style="visibility: visible; animation-delay: 0.3s; animation-name: zoomInLeft;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <span class="wow fadeInDown" data-wow-delay=".2s">FAQ</span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">

                            <a href="${cPath }/w/faq.do" class="wow fadeInUp" data-wow-delay=".6s">자주 묻는 질문 <i class="las la-level-up-alt"></i></a>
                        </h2>
                        <h3 class="overlay-text">FAQ</h3>
                    </div>
                </div>
            </div>
   <div class="tab-content pt-3" id="pills-tabContent">
    <c:if test="${not empty boardList }">
        <div class="accordion wow fadeInUp" id="accordionExample" data-wow-delay=".8s" style="visibility: visible;">
            <c:forEach items="${boardList }" var="board" varStatus="status" begin="0" end="3">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading${status.index}">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapse${status.index}" aria-expanded="false"
                            aria-controls="collapse${status.index}">
                            <span>${board.boardTitle}</span><i class="las la-angle-down"></i>
                        </button>
                    </h2>
                    <div id="collapse${status.index}" class="accordion-collapse collapse"
                        aria-labelledby="heading${status.index}" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <p>${board.boardContent}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>
        </div>
    </section>
    <section class="features section">
        <div class="container">
            <div class="single-head">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-12">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <span class="serial">01</span>
                            <h5>참고자료 > 이벤트 > 오프라인교육</h5>
                            <h3><a href="${cPath }/w/promotion/detailPage.do?promotion=${offEdu.boardNo}">${offEdu.boardTitle }</a></h3>
                            <span>${offEdu.boardDate }</span>
                            <p><c:out value='${offEdu.boardContent.replaceAll("\\\<.*?\\\>","")}' /> ...</p>
                        </div>

                    </div>
				<div class="col-lg-4 col-md-4 col-12">
					<!-- Start Single Feature -->
					<div class="single-feature">
						<span class="serial">02</span>
						<h5>참고자료 > 공지사항 > 업데이트</h5>
						<h3><a href="${cPath }/w/notice/detailPage.do?board=${update.boardNo}">${update.boardTitle }</a></h3>
                            <span>${update.boardDate }</span>
                            <p id="update">
                            <c:out value='${update.boardContent.replaceAll("\\\<.*?\\\>","")}' />
                             ...</p>
					</div>
					<!-- End Single Feature -->
				</div>
				<div class="col-lg-4 col-md-4 col-12">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <span class="serial">03</span>
                            <h5>참고자료 > 이벤트 > 할인행사</h5>
                            <h3><a href="${cPath }/w/promotion/detailPage.do?promotion=${sale.boardNo}">${sale.boardTitle }</a></h3>
                            <span>${sale.boardDate }</span>
                            <p><c:out value='${sale.boardContent.replaceAll("\\\<.*?\\\>","")}' /> ...</p>
                        </div>
                        <!-- End Single Feature -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="support section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <span class="wow fadeInDown" data-wow-delay=".2s">Support</span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">어떤 어려움이 있으신가요? </h2>
                        <!-- <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p> -->
                        <h3 class="overlay-text">Support</h3>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row align-items-stretch g-5">
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/support/non.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">도입 전 문의하기</h4>
                            <div class="icon">
                                <i class="las la-comments"></i>
                            </div>
                            <p>도입 전 궁금한 사항이 있으시다면 도입 전 문의하기</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/about/startGuide.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">시작가이드</h4>
                            <div class="icon">
                                <i class="las la-list-ol"></i>
                            </div>
                            <p>기초부터 가입과정까지 단계별로 보고싶다면 쉽게 시작가이드</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/support/early.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">초기세팅 문의하기</h4>
                            <div class="icon">
                                <i class="las la-tools"></i>
                            </div>
                            <p>제품을 구매하고 초기 세팅에 어려움이 있으시다면 초기세팅 문의하기</p>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="${cPath }/w/support/guide-service.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">사용자 가이드</h4>
                            <div class="icon">
                                <i class="las la-book-open"></i>
                            </div>
                            <p>그룹웨어 서비스 및 관리자 기능 사용 방법을 알고 싶다면 사용자 가이드</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="free-version-banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="section-title mb-60">
                        <span class="text-white wow fadeInDown" data-wow-delay=".2s"
                            style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">팀을 하나로 만드는
                            그룹웨어</span>
                        <h2 class="text-white wow fadeInUp" data-wow-delay=".4s"
                            style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">지금 커넥트로
                            연결해보세요.</h2>
                        <div class="button">
                            <a href="${cPath }/w/subscribeView.do" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".6s">구독하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <script src="${pageContext.request.contextPath}/resources/webUser/assets/js/index.js" defer></script>
