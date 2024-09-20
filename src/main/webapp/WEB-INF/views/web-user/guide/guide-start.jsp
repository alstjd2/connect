<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="breadcrumbs overlay">
        <div class="back-img" style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
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
                        <li><a href="${cPath}/w/index.do">Home</a></li>
                        <li><a href="#">참고자료</a></li>
                        <li>시작가이드</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="section container">
        <div class="section-title">
            <span class="wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">guide</span>
            <h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">시작 가이드</h2>
            <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                커넥트의 기초부터 가입 과정까지 쉽게 알려드립니다.<br> 커넥트는 회사나 단체에서 가입하여 사용하는 그룹웨어 서비스입니다.
            </p>
            <h3 class="overlay-text gray-bg">guide</h3>
        </div>

        <div class="align-items-start p-5 rounded-3 guide-start" style="background-color: var(--back-transparency100-color);">
            <div class="nav nav-pills gap-3 pb-5" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <button class="nav-link col wow fadeInUp active" data-wow-delay=".8s" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">
                        <span class="number">1</span>
                        <div class="content">
                            <h3>관리자 정하기</h3>
                            <p>회사/단체에서 커넥트를 관리할 사람을 결정합니다.</p>
                        </div>
                </button>
                <button class="nav-link col wow fadeInUp" data-wow-delay=".8s" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                    <span class="number">2</span>
                    <div class="content">
                        <h3>회사/단체에서 가입</h3>
                        <p>관리자가 회사/단체 정보 등을 커넥트에 등록합니다.</p>
                    </div>
                </button>
                <button class="nav-link col wow fadeInUp" data-wow-delay=".8s" id="v-pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#v-pills-disabled" type="button" role="tab" aria-controls="v-pills-disabled" aria-selected="false">
                    <span class="number">3</span>
                    <div class="content">
                        <h3>구성원 가입</h3>
                        <p>관리자가 함께 사용할 구성원을 등록하고, 로그인하도록 합니다.</p>
                    </div>
                </button>
            </div>
            <div class="tab-content col-12" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
                    <div class="section-title p-5 m-0">
                        <span class="wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">
                            STEP 01
                        </span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            커넥트 관리자 정하기
                        </h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            회사 또는 팀에서 커넥트 그룹웨어를 관리하는 사람을 <b>‘관리자’</b>라고 합니다.
                        </p>
                        <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            관리자는 [STEP 02] 이후의 절차 및 기타 설정 등을 담당합니다.
                        </p>
                        <p class="wow fadeInUp" data-wow-delay=".8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">
                            커넥트는 <b>기업/단체당 하나씩</b> 가입해서 사용하는 서비스입니다.
                        </p>
                        <p class="wow fadeInUp" data-wow-delay=".8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInUp;">
                            관리자는 커넥트에 <b>회원가입</b>을 진행합니다.
                        </p>
                        <div class="author wow fadeInUp py-5" data-wow-delay="1s" style="visibility: visible; animation-delay: 1s; animation-name: fadeInUp;">
                            <img src="${cPath}/resources/webUser/assets/images/start/guide-start1.png" alt="시작가이드 1">
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
                    <div class="section-title p-5 m-0">
                        <span >
                            STEP 02
                        </span>
                        <h2 >
                            기업/단체에서 사용할 커넥트 그룹웨어 준비
                        </h2>
                        <p >
                            <b>'마이페이지'</b>에서 <b>'기업등록'</b> 후 그룹웨어를 <b>'구독하기(결제)'</b> 진행해주세요.
                        </p>
                        <p >
                            결제가 완료된 계정은 <b>'그룹웨어 계정'</b>을 통해 계정 생성 후 그룹웨어 사용이 가능합니다! 
                        </p>
                        <div class="author wow fadeInUp py-5" data-wow-delay="1s" style="visibility: visible; animation-delay: 1s; animation-name: fadeInUp;">
                            <img src="${cPath}/resources/webUser/assets/images/start/guide-start2.png" alt="시작가이드 2">
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-disabled" role="tabpanel" aria-labelledby="v-pills-disabled-tab" tabindex="0">
                    <div class="section-title p-5 m-0">
                        <span >
                            STEP 03
                        </span>
                        <h2 >
                            함께 일할 사용자 추가하기
                        </h2>
                        <p >
                            관리자는 신규 <b>사용자(직원)을 추가</b>해서 커넥트로 소통할 수 있습니다.<br>
                            기업/단체 별로 다양한 기능을 제공하오니 <b>관리자 가이드</b>를 확인해 보세요!
                        </p>
                        <div class="author wow fadeInUp py-5" data-wow-delay="1s" style="visibility: visible; animation-delay: 1s; animation-name: fadeInUp;">
                            <img src="${cPath}/resources/webUser/assets/images/start/guide-start3.png" alt="시작가이드 3">
                        </div>
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
                        <!-- <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">간편한 근태, 순쉬운 인력 관리를 제공하며<br/> 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.</p> -->

                        <div class="button">
                            <a href="${cPath}/w/subscribeView.do" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".6s">구독하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
