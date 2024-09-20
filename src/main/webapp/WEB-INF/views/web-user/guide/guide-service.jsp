<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <div class="breadcrumbs overlay">
        <div class="back-img" style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
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
                        <li><a href="index">홈</a></li>
                        <li><a href="support.html">지원</a></li>
                        <li>사용자 가이드</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="section content guide-section pt-5">
        <div class="row pt-5">
            <div class="col-12 pt-5">
                <div class="section-title px-0">
                    <h2 class="wow fadeInUp" data-wow-delay=".2s"
                        style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                        사용자 가이드
                    </h2>
                </div>
            </div>
        </div>
        <nav class="container">
    <ul class="nav nav-pills mb-3 guide-btn-wrapper gap-4" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-message-tab" data-bs-toggle="pill" data-bs-target="#pills-message"
                type="button" role="tab" aria-controls="pills-message" aria-selected="true">메시지</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-calendar-tab" data-bs-toggle="pill"
                data-bs-target="#pills-calendar" type="button" role="tab" aria-controls="pills-calendar"
                aria-selected="false">캘린더</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-board-tab" data-bs-toggle="pill" data-bs-target="#pills-board"
                type="button" role="tab" aria-controls="pills-board" aria-selected="false">게시판</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-survey-tab" data-bs-toggle="pill" data-bs-target="#pills-survey"
                type="button" role="tab" aria-controls="pills-survey" aria-selected="false">설문</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-video-tab" data-bs-toggle="pill" data-bs-target="#pills-video"
                type="button" role="tab" aria-controls="pills-video" aria-selected="false">화상회의</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-address-tab" data-bs-toggle="pill" data-bs-target="#pills-address"
                type="button" role="tab" aria-controls="pills-address" aria-selected="false">주소록</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-drive-tab" data-bs-toggle="pill" data-bs-target="#pills-drive"
                type="button" role="tab" aria-controls="pills-drive" aria-selected="false">드라이브</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-hr-tab" data-bs-toggle="pill" data-bs-target="#pills-hr"
                type="button" role="tab" aria-controls="pills-hr" aria-selected="false">인사관리</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-attendance-tab" data-bs-toggle="pill" data-bs-target="#pills-attendance"
                type="button" role="tab" aria-controls="pills-attendance" aria-selected="false">근태관리</button>
        </li>
    </ul>
    <div class="tab-content pt-3" id="pills-tabContent">
    <!-- 메시지 사용자 가이드 -->
    <div class="accordion tab-pane fade show active" id="pills-message" role="tabpanel" aria-labelledby="pills-message-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02131'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 캘린더 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-calendar" role="tabpanel" aria-labelledby="pills-calendar-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02133'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 게시판 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-board" role="tabpanel" aria-labelledby="pills-board-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02134'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 설문 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-survey" role="tabpanel" aria-labelledby="pills-survey-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02135'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 화상회의 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02136'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 주소록 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-address" role="tabpanel" aria-labelledby="pills-address-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02137'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 드라이브 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-drive" role="tabpanel" aria-labelledby="pills-drive-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02138'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 문서결재 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-docs" role="tabpanel" aria-labelledby="pills-docs-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02139'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 인사관리 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-hr" role="tabpanel" aria-labelledby="pills-hr-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02140'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>

    <!-- 근태관리 사용자 가이드 -->
    <div class="tab-pane fade" id="pills-attendance" role="tabpanel" aria-labelledby="pills-attendance-tab" tabindex="0">
        <c:forEach items="${guideList}" var="guide">
            <c:if test="${guide.boardGuideType eq 'DA02141'}">
                <h3>${guide.boardTitle}</h3>
                <p>${guide.boardContent}</p>
            </c:if>
        </c:forEach>
    </div>
</div>
        </nav>
    </section>
    <div class="free-version-banner">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="section-title mb-60">
                        <h2 class="text-white wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            더 궁금한 것이 있으시거나<br>
                            다른 도움이 필요하신가요?
                        </h2>
                        <!-- <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">간편한 근태, 순쉬운 인력 관리를 제공하며<br/> 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.</p> -->

                        <div class="button">
                            <a href="${Cpath }/w/support/early.do" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".4s">문의하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
