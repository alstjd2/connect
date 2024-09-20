<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <div class="breadcrumbs overlay">
        <div class="back-img" style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">지원</h1>
                        <p>
                            서비스 사용 중 발생한 이슈 <br/>또는 궁금증을 지원페이지에서 확인하실 수 있습니다.
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${cPath }/w/index.do">홈</a></li>
                        <li>지원</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="support section" style="position: static;">
        <div class="container">
            <div class="single-head">
                <div class="row align-items-stretch g-5">
                    <div class="col-lg-6 col-md-6 col-12">
                        <a href="${cPath }/w/support/non.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">도입 전 문의하기</h4>
                            <div class="icon">
                                <i class="las la-comments"></i>
                            </div>
                            <p>도입 전 궁금한 사항이 있으시다면 도입 전 문의하기</p>
                        </a>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <a href="service-single.html" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">초기세팅 문의하기</h4>
                            <div class="icon">
                                <i class="las la-tools"></i>
                            </div>
                            <p>제품을 구매하고 초기 세팅에 어려움이 있으시다면 초기세팅 문의하기</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row mt-5 pt-5">
                <div class="col-12">
                    <div class="section-title mb-0">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            자주 묻는 질문 
                        </h2>
                    </div>
                </div>
            </div>
            <section class="container wow fadeInUp pb-5 pt-2"  data-wow-delay=".8s">
                <ul class="nav button">
                    <li class="nav-item">
                        <a href="about-message.html" class="btn active">
                            <i class="las la-comment"></i>
                        </a>
                        <p>전체</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-mail.html" class="btn">
                            <i class="las la-envelope"></i>
                        </a>
                        <p>서비스</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-calendar.html" class="btn">
                            <i class="las la-calendar"></i>
                        </a>
                        <p>회원계정</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-todo.html" class="btn">
                            <i class="las la-list-alt"></i>
                        </a>
                        <p>요금/결제</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-calendar.html" class="btn">
                            <i class="las la-calendar"></i>
                        </a>
                        <p>가입/설치</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-board.html" class="btn">
                            <i class="las la-th-list"></i>
                        </a>
                        <p>장애</p>
                    </li>
                    <li class="nav-item">
                        <a href="about-survey.html" class="btn">
                            <i class="las la-chart-pie"></i>
                        </a>
                        <p>기타</p>
                    </li>
                </ul>
        
            </section>
            <section class="row">
                <div class="accordion wow fadeInUp col-lg-6" id="accordionExample" data-wow-delay=".8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading1">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapseOne">
                                <span>Material types can you work with?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading2">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapseTwo">
                                <span>Is Smart Lock required for instant apps?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading3">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapseThree">
                                <span>Can I have multiple activities in a single feature?</span>
                                <i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                <span>Can I share resources between features?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion wow fadeInUp col-lg-6" id="accordionExample" data-wow-delay=".8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                <span>Material types can you work with?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <span>Is Smart Lock required for instant apps?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <span>Can I have multiple activities in a single feature?</span>
                                <i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                <span>Can I share resources between features?</span><i class="las la-angle-down"></i>
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                                    ultrices gravida.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>
    
