<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                    <li><a href=" ${cPath }/w/support.do">지원</a></li>
                    <li>초기세팅문의</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<section id="contact-us" class="contact-us py-5">
    <div class="container py-5">
        <div class="row pt-5">
            <div class="col-12">
                <div class="section-title px-0">
                    <h2 class="wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                        커넥트 가입 및 초기 설정에 어려움을 느끼시나요?
                    </h2>
                    <p class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                        이런 분들에게 딱 맞는 초기 세팅 서비스를 준비했습니다.(초기 세팅은 계정 당 1회 제공됩니다.)
                    </p>
                </div>
            </div>
        </div>
        <div class="row step-box px-5 justify-content-center gap-5">
            <div class="col-md-5 col-12">
                <div class=" wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                    <span class="fs-5 pb-1">step.1</span>
                    <div class="content">
                        <h3>신청하기</h3>
                        <p>아래 양식에 맞게 신청 정보를 입력해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-12">
                <div class=" wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                    <span class="fs-5 pb-1">step.2</span>
                    <div class="content">
                        <h3>초기 세팅 지원</h3>
                        <p>커넥트가 영업일 기준 3일 이내로 입력해 주신 이메일 주소 또는 전화번호로 연락드려 무료 초기 설정을 지원합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <div class="container pb-5">
    <div class="contact-head">
        <div class="inner-content">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="form-main">
                        <h3 class="inner-title left d-flex align-items-end justify-content-between">
                            <span>초기 세팅 문의</span>
                            <span class="fw-light fs-6">남겨주신 연락처로 연락드립니다. 꼭 사용하시는 연락처를 입력해주세요.</span>
                        </h3>
                        <!-- form:form 태그 사용 -->
                        <form:form class="form" method="post" modelAttribute="early">
                            <div class="row">
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <form:input path="comNm" type="text" placeholder="회사명을 입력해주세요" required="required" cssClass="form-control"/>
                                        <form:errors path="comNm" cssClass="text-danger" element="span"/>
                                    </div>
                                </div>
                       
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <form:input path="earlyEmail" type="email" placeholder="이메일을 입력해주세요" required="required" cssClass="form-control"/>
                                        <form:errors path="earlyEmail" cssClass="text-danger" element="span"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 pb-3">
                                    <div class="form-group">
                                        <form:input path="earlyPhone" type="tel" placeholder="휴대폰을 입력해주세요" required="required" cssClass="form-control"/>
                                        <form:errors path="earlyPhone" cssClass="text-danger" element="span"/>
                                    </div>
                                </div>
                                <hr/>
                                <!-- 개인정보 수집 및 이용 동의 -->
                                <div class="col-12">
                                    <div class="form-check">
                                        <form:checkbox path="earlyPerinfocollection" value="Y" cssClass="form-check-input" required="required"/>
                                        <form:errors path="earlyPerinfocollection" cssClass="text-danger" element="span"/>
                                        <label class="form-check-label">
                                            <span>개인정보 수집 및 이용에 동의합니다.</span>
                                            <a href="#">전문보기</a>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12 pt-3">
                                    <div class="form-group button text-center">
                                        <button type="submit" class="btn">제출</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>