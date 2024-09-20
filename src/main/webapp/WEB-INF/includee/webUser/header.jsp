<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
	if (originalUri == null) {
	    originalUri = request.getRequestURI(); // fallback if not forwarded
	}
	String sub = originalUri.endsWith("/index.do") || originalUri.contains("/login/") || originalUri.contains("/member/") || originalUri.contains("/mypage/") ? "" : "sub";
%>
<div class="header-inner <%=sub%>">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg">
                    <a class="navbar-brand" href="${cPath }/w/index.do">
                        <img src="${cPath}/resources/webUser/assets/images/logo/logo.png" alt="connet-c-logo">
                        <img src="${cPath}/resources/webUser/assets/images/logo/footer-logo.png" alt="connet-w-logo">
                        </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="las la-bars open"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link <%=originalUri.endsWith("about/us.do")?"active":"" %>" href="${cPath }/w/about/us.do">About US</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle 
                                		  <%=originalUri.contains("about/message.do") || originalUri.contains("about/calender.do") || originalUri.contains("about/todo.do") || originalUri.contains("about/board.do") || originalUri.contains("about/survey.do") || originalUri.contains("about/conference.do") || originalUri.contains("about/address.do") || originalUri.contains("about/drive.do") || originalUri.contains("about/personnel.do") || originalUri.contains("about/attendance.do") ?"active":"" %>" 
                                   href="#" id="intro" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    서비스소개 
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="intro">
                                    <li><a class="dropdown-item" href="${cPath }/w/about/message.do">메시지</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/mail.do">메일</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/calender.do">캘린더</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/todo.do">할일</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/board.do">게시판</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/survey.do">설문</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/conference.do">화상회의</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/address.do">주소록</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/drive.do">드라이브</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/approval.do">문서결재</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/personnel.do">인사관리</a></li>
                                    <li><a class="dropdown-item" href="${cPath }/w/about/attendance.do">근태관리</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown ">
                                <a class="nav-link dropdown-toggle <%=originalUri.contains("about/startGuide.do") || originalUri.contains("promotion/list.do") || originalUri.contains("notice/list.do") ?"active":"" %>" href="#" id="reference" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    참고자료
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="reference">
                                    <li><a class="dropdown-item" href="${cPath}/w/about/startGuide.do">시작가이드</a></li>
                                    <li><a class="dropdown-item" href="${cPath}/w/promotion/list.do">이벤트 <i class="las la-level-up-alt"></i></a></li>
                                    <li><a class="dropdown-item" href="${cPath}/w/notice/list.do">공지사항 <i class="las la-level-up-alt"></i></a></li>
                                </ul>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link <%=originalUri.contains("support.do")?"active":"" %>" href="${cPath }/w/support.do" id="support" > 지원 </a>
                            </li>
                        </ul>
                        <security:authorize access="isAnonymous()">
	                        <div class="button d-flex align-items-center gap-3 mypage">
	                            <a href="${cPath }/w/login/loginForm.do"  class="me-3 px-3 ink-underline-opacity-0 link-secondary">로그인</a>
	                            <a href="${cPath }/w/subscribeView.do" class="btn">구독하기</a>
	                        </div>
                        </security:authorize>
                        <security:authorize access="isAuthenticated()">
	                        <security:authentication property="principal" var="principal"/>
	                        <security:authentication property="authorities" var="authorities"/>
	                        <security:authorize access="hasRole('MEMBER')">
								<div class="button d-flex align-items-center gap-3 mypage">
									<div class="dropdown dropdown-center text-end">
										<a id="userId" href="#" class="d-flex align-items-center gap-2 link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> 
<!-- 											<img src="https://github.com/mdo.png" alt="mdo" width="38" height="38" class="rounded-circle">  -->
											<span class="pt-1">${principal.realUser.memNm}님</span>
										</a>
										<ul class="dropdown-menu dropdown-menu-end">
											<li><a class="dropdown-item" href="${cPath }/w/mypage/mypageForm.do">마이페이지</a></li>
											<li><a class="dropdown-item" href="${cPath }/w/login/logout.do">로그아웃</a></li>
										</ul>
									</div>
								</div>
							</security:authorize>
						</security:authorize>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>

