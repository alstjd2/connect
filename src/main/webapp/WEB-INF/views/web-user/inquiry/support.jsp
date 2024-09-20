<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <li><a href="${cPath}/w/index.do">홈</a></li>
                    <li>지원</li>
                </ul>
            </div>
        </div>
    </div>
</div>
 <section class="support pb-5" style="position: static;">
        <div class="container pb-5">
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
                        <a href="${cPath }/w/support/early.do" class="single-service wow fadeInUp" data-wow-delay=".2s">
                            <h4 class="fw-bold">초기세팅 문의하기</h4>
                            <div class="icon">
                                <i class="las la-tools"></i>
                            </div>
                            <p>제품을 구매하고 초기 세팅에 어려움이 있으시다면 초기세팅 문의하기</p>
                        </a>
                    </div>
                </div>
            </div>
            <section class="guide-section pt-5">
                <div id="container" class="container pt-5">
                    <div class="row pb-3 g-2">
                        <div class="col-md-10">
                            <h2 class="wow fadeInUp fw-bold" > 
                                자주 묻는 질문
                            </h2>
                        </div>
                        <div class="col-md-2">
                            <div class="see-all wow fadeInUp" data-wow-delay=".2s">
                                <a href="${cPath }/w/faq.do" class="">전체보기 <i class="las la-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
			          <div class="row grid">
			    		<c:if test="${not empty boardList}">
			        		<c:forEach items="${boardList}" var="board" varStatus="status" begin="0" end="5">
			            		<div class="col-lg-6 col-md-6 grid-item member">
			                		<div class="guide-overlay">
			                    		<div class="pf-content">
			                       			 <h4>
			                            		 <a href="${cPath}/w/faq.do">
			                                			${board.boardTitle}
			                               			 <i class="las la-angle-right"></i>
			                           			 </a>
			                        		</h4>
			                   		   </div>
			                		</div>
			            		</div>
			       			 </c:forEach>
			    		</c:if>
					</div>
            </div>
            </section>
        </div>
    </section>
    <section class="services style2 py-5">
        <div class="container py-5">
            <div class="single-head">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-service wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <a href="${cPath }/w/support/guide-start.do">
                                <img src="${cPath}/resources/webUser/assets/images/guide/guide1.png" alt="시작 가이드 이미지">
                                <h3>시작 가이드</h3>
                                <p>커넥트를 처음 시작하셨나요? 회사 계정을 만들고, 구성원을 초대해보세요.</p>
                                <span class="more"> 자세히보기 <i class="las la-long-arrow-alt-right"></i></span>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-service wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <a href="${cPath }/w/support/guide-admin.do">
                                <img src="${cPath}/resources/webUser/assets/images/guide/guide2.png" alt="관리자 가이드 이미지">
                                <h3>관리자 가이드</h3>
                                <p>기업정보 및 구성원(직원) 설정 등 우리 회사에 맞는 환경을 설정 할 수 있어요.</p>
                                <span class="more"> 자세히보기 <i class="las la-long-arrow-alt-right"></i></span>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-service wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <a href="${cPath }/w/support/guide-service.do">
                                <img src="${cPath}/resources/webUser/assets/images/guide/guide3.png" alt="사용자 가이드 이미지">
                                <h3>사용자 가이드</h3>
                                <p>메시지부터 문서결재관리까지 커넥트 그룹웨어를 사용하는 방법을 알아보세요</p>
                                <span  class="more"> 자세히보기 <i class="las la-long-arrow-alt-right"></i></span>
                            </a>
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
                        <h2 class="text-white wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            더 궁금한 것이 있으시거나<br>
                            다른 도움이 필요하신가요?
                        </h2>
                        <!-- <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">간편한 근태, 순쉬운 인력 관리를 제공하며<br/> 소통과 협업, 경영지원을 하나의 플랫폼에서 활용하여 생산성을 높여드립니다.</p> -->

                        <div class="button">
                            <a href="${cPath }/w/support/non.do" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".4s">문의하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <script src="${cPath}/resources/webUser/assets/js/isotope.min.js"></script>
 <script type="text/javascript">
    //============== isotope masonry js with imagesloaded
    imagesLoaded('#container', function () {
        var elem = document.querySelector('.grid');
        var iso = new Isotope(elem, {
            // options
            itemSelector: '.grid-item',
            masonry: {
                // use outer width of grid-sizer for columnWidth
                columnWidth: '.grid-item'
            }
        });

        let filterButtons = document.querySelectorAll('.guide-btn-wrapper button');
        filterButtons.forEach(e =>
            e.addEventListener('click', () => {

                let filterValue = event.target.getAttribute('data-filter');
                iso.arrange({
                    filter: filterValue
                });
            })
        );
    });
</script>