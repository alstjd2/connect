<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!--     <div class="preloader"> -->
<!--         <div class="preloader-inner"> -->
<!--             <div class="preloader-icon"> -->
<!--                 <span></span> -->
<!--                 <span></span> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
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
                        <li><a href="${cPath }/w/index.do">홈</a></li>
                        <li><a href="${cPath }/w/support.do">지원</a></li>
                        <li>관리자 가이드</li>
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
                        관리자 가이드
                    </h2>
                </div>
            </div>
        </div>
        <nav class="container">
            <ul class="nav nav-pills mb-3 guide-btn-wrapper gap-4" id="pills-tab" role="tablist">
              <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all"
				        type="button" role="tab" aria-controls="pills-all" aria-selected="true">관리자(Admin)소개</button>
				</li>
                
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-service-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-service" type="button" role="tab" aria-controls="pills-service"
                        aria-selected="false">기본환경설정</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-member-tab" data-bs-toggle="pill" data-bs-target="#pills-member"
                        type="button" role="tab" aria-controls="pills-member" aria-selected="true">구성원관리</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-join-tab" data-bs-toggle="pill" data-bs-target="#pills-join"
                        type="button" role="tab" aria-controls="pills-join" aria-selected="false">서비스관리</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-error-tab" data-bs-toggle="pill" data-bs-target="#pills-error"
                        type="button" role="tab" aria-controls="pills-error" aria-selected="false">통계</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-etc-tab" data-bs-toggle="pill" data-bs-target="#pills-etc"
                        type="button" role="tab" aria-controls="pills-etc" aria-selected="false">구매 및 청구</button>
                </li>
            </ul>
		      <nav class="container">
    				<div class="tab-content pt-3" id="pills-tabContent">
					    <!-- 어드민(Admin)소개 -->
					    <div class="tab-pane fade active show" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02121'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
<!-- 					                <div class="tab-pane fade active show" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" tabindex="0"> -->
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02121'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02121'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02121'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
					
					    <!-- 기본환경설정 -->
					    <div class="tab-pane fade" id="pills-service" role="tabpanel" aria-labelledby="pills-service-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02122'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02122'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02122'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02122'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
					
					    <!-- 구성원관리 -->
					    <div class="tab-pane fade" id="pills-member" role="tabpanel" aria-labelledby="pills-member-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02123'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02123'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02123'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02123'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
									
									    <!-- 서비스관리 -->
					<!-- 				    <div class="tab-pane fade" id="pills-join" role="tabpanel" aria-labelledby="pills-join-tab" tabindex="0"> -->
					<%-- 				        <c:forEach items="${guideList}" var="guide"> --%>
					<%-- 				            <c:if test="${guide.boardGuideType eq 'DA02124'}"> --%>
					<%-- 				                <p>${guide.boardGuideType}</p> --%>
					<%-- 				                <p>${guide.boardContent}</p> --%>
					<%-- 				            </c:if> --%>
					<%-- 				        </c:forEach> --%>
					<!-- 				    </div> -->
									    
							<div class="tab-pane fade" id="pills-join" role="tabpanel" aria-labelledby="pills-join-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02124'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02124'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02124'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02124'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
					    
									    <!-- 통계 -->
					    <div class="tab-pane fade" id="pills-error" role="tabpanel" aria-labelledby="pills-error-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02125'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02125'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02125'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02125'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
					
					    <!-- 구매 및 청구 -->
					    <div class="tab-pane fade" id="pills-etc" role="tabpanel" aria-labelledby="pills-etc-tab" tabindex="0">
					        <c:set var="itemCount" value="0" />
					        <c:forEach items="${guideList}" var="guide">
					            <c:if test="${guide.boardGuideType eq 'DA02126'}">
					                <c:set var="itemCount" value="${itemCount + 1}" />
					            </c:if>
					        </c:forEach>
					
					        <c:choose>
					            <c:when test="${itemCount > 1}">
					                <div class="d-flex align-items-start">
					                    <div class="nav flex-column nav-pills me-3 sub-menu" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02126'}">
					                                <button class="nav-link" id="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab" data-bs-toggle="pill"
					                                    data-bs-target="#v-pills-${guide.boardGuideType}-${guide.boardNo}" type="button" role="tab"
					                                    aria-controls="v-pills-${guide.boardGuideType}-${guide.boardNo}" aria-selected="false">
					                                    ${guide.boardTitle}
					                                </button>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					
					                    <div class="tab-content" id="v-pills-tabContent">
					                        <c:forEach items="${guideList}" var="guide">
					                            <c:if test="${guide.boardGuideType eq 'DA02126'}">
					                                <div class="tab-pane fade" id="v-pills-${guide.boardGuideType}-${guide.boardNo}" role="tabpanel"
					                                    aria-labelledby="v-pills-${guide.boardGuideType}-${guide.boardNo}-tab">
					                                    <p>${guide.boardContent}</p>
					                                </div>
					                            </c:if>
					                        </c:forEach>
					                    </div>
					                </div>
					            </c:when>
					
					            <c:when test="${itemCount == 1}">
					                <c:forEach items="${guideList}" var="guide">
					                    <c:if test="${guide.boardGuideType eq 'DA02126'}">
					                        <p>${guide.boardContent}</p>
					                    </c:if>
					                </c:forEach>
					            </c:when>
					        </c:choose>
					    </div>
					</div>
			</nav>
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
                            <a href="${cPath }/w/support/early.do" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".4s">문의하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
	

</script>