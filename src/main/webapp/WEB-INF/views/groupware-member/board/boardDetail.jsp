<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-md-8">
		<c:if test="${not empty grbNo}">
				        <div class="col flex-grow-0 bg-lighter" id="app-email-view">
				            <div class="card shadow-none border-0 rounded-0 app-email-view-header p-5 pt-md-4">
				                <div class="d-flex justify-content-between align-items-center">
				                    <div class="d-flex align-items-center overflow-hidden">
				                        <span class="ms-sm-2 me-4">
				                            <a href="${pageContext.request.contextPath}/gw/board/board.do">
				                                <i class="bx bx-chevron-left bx-md cursor-pointer" data-bs-toggle="sidebar" data-target="#app-email-view"></i>
				                            </a>
				                        </span>
				                        <h5 class="text-truncate mb-0 me-2 fw-bold">${grbNo.grbTitle}</h5>
				                        <c:if test="${grbNo.grbAttentionYN == 'Y'}">
				                            <span class="badge bg-label-warning">즐겨찾기</span>
				                        </c:if>
				                    </div>
				                    <div class="d-flex align-items-center">
				                        <span class="btn btn-icon p-0 me-2 text-muted">
				                            <i class="bx bx-chevron-left bx-md"></i>
				                        </span>
				                        <span class="btn btn-icon p-0">
				                            <i class="bx bx-chevron-right bx-md"></i>
				                        </span>
				                    </div>
				                </div>
				            </div>
				            
				            <hr class="m-0"/>
				            <div class="app-email-view-content py-4">
				                <!-- 게시글 보기 : 마지막 메일 -->
				                <div class="card mx-sm-6 mx-3 mt-4">
				                    <div class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">
				                        <div class="d-flex align-items-center mb-sm-0 mb-3">
				                            <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="user-avatar"
				                                 class="flex-shrink-0 rounded-circle me-4" height="38" width="38"/>
				                            <div class="flex-grow-1 ms-1">
				                                <h6 class="m-0 fw-normal">
				                                </h6>
				                                <small class="text-body">
				                                </small>
				                            </div>
				                        </div>
				                        <div class="d-flex align-items-center">
				                            <p class="mb-0 me-4 text-muted">${grbNo.grbDate}</p>
				                            <c:if test="${grbNo.grbAttachfile != 0}">
				                                <span class="btn btn-icon"><i class="bx bx-paperclip bx-md cursor-pointer"></i></span>
				                            </c:if>
				                            <c:if test="${grbNo.grbAttentionYN == 'Y'}">
				                                <span class="btn btn-icon"><i class="email-list-item-bookmark bx bx-star bx-md cursor-pointer"></i></span>
				                            </c:if>
				                        </div>
				                    </div>
				                    <div class="card-body pt-6">
				                        <p>${grbNo.grbContent}</p>
				                        <hr/>
				                        <c:if test="${grbNo.grbAttachfile != 0}">
				                            <p class="text-muted mb-2">첨부파일</p>
				                            <div class="cursor-pointer">
				                                <i class="bx bx-file"></i>
				                                <span class="align-middle ms-1">첨부파일 번호: ${grbNo.grbAttachfile}</span>
				                            </div>
				                        </c:if>
				                    </div>
				                </div>
				                
				                <!-- 게시글 보기 : 회신 메일 -->
				                <div class="email-reply card mt-4 mx-sm-6 mx-3 mb-4">
				                    <h6 class="card-header border-0 fw-normal pb-4">답변쓰기</h6>
				                    <div class="card-body pt-0 ps-3">
				                        <div class="d-flex justify-content-start">
				                            <div class="email-reply-toolbar border-0 w-100 ps-0 pb-4">
				                                <span class="ql-formats me-0">
				                                    <button class="ql-bold"></button>
				                                    <button class="ql-italic"></button>
				                                    <button class="ql-underline"></button>
				                                    <button class="ql-list" value="ordered"></button>
				                                    <button class="ql-list" value="bullet"></button>
				                                    <button class="ql-link"></button>
				                                    <button class="ql-image"></button>
				                                </span>
				                            </div>
				                        </div>
				                        <div class="email-reply-editor"></div>
				                        <div class="d-flex justify-content-end align-items-center mt-4">
				                            <div class="cursor-pointer btn btn-text-secondary text-secondary me-4">
				                                <i class="bx bx-paperclip bx-16px text-heading me-2"></i>
				                                <span class="align-middle">첨부파일</span>
				                            </div>
				                            <button class="btn btn-primary">
				                                <span class="align-middle">작성하기</span>
				                                <i class="bx bx-paper-plane bx-sm ms-2 scaleX-n1-rtl"></i>
				                            </button>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </c:if>
				</div>
				
