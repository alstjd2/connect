<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script defer type="text/javascript"
		src="${cPath}/resources/groupwareMember/assets/js/custom"></script>
    <div class="app-email card">
        <div class="row g-0">
            <!-- 게시글 사이드바 -->
            <div class="col app-email-sidebar border-end flex-grow-0" id="app-email-sidebar">
                <div class="btn-compost-wrapper d-grid">
                    <form action="${cPath}/gw/board/grbGubunInsertForm.do" method="get">
                        <input type="hidden" name="comNo" value="${comNo}">
                        <button type="submit" class="btn btn-primary btn-compose">
                            <i class='bx bx-edit pe-2'></i>
                            새 게시글 작성
                        </button>
                    </form>
                </div>
                
                <div class="email-filters pt-4 pb-2 ps">
                    <!-- 게시글 필터: 폴더 -->
                    <ul class="email-filter-folders list-unstyled">
                        <li class="d-flex mb-1 active">
                            <a href="${cPath}/gw/board/board.do" class="d-flex flex-wrap align-items-center">
                                <i class='bx bxs-file-plus'></i>
                                <span class="align-middle ms-2">최신글</span>
                            </a>
                        </li>
                        
                        <!-- 아코디언 시작 -->
                        <div class="accordion" id="boardAccordion">
							<div class="">
								<h2 class="accordion-header" id="heading-${gubun.grbGubunNo}">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse-${gubun.grbGubunNo}"
										aria-expanded="false"
										aria-controls="collapse-${gubun.grbGubunNo}">
										<i class='bx bx-copy-alt me-2'></i>게시판 선택</button>
								</h2>
								<div id="collapse-${gubun.grbGubunNo}"
									class="accordion-collapse collapse"
									aria-labelledby="heading-${gubun.grbGubunNo}"
									data-bs-parent="#boardAccordion">
									<div class="accordion-body">
										<ul class="list-unstyled">
											<c:forEach var="board" items="${grbInsertList}">
												<!-- gubunDelyn이 'N'인 항목만 표시 -->
												<c:if test="${board.grbDelyn == 'N'}">
													<li class="d-flex mb-1">
														<form action="${cPath}/gw/board/gubunList.do" method="get" class="d-flex mb-1">
															<input type="hidden" name="grbGubunNo" value="${board.grbGubunNo}">
															<button type="submit" class="d-flex flex-wrap align-items-center btn p-0">
																
																<span class="align-middle">${board.grbGubunTitle}</span>
															</button>
														</form>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
                        <!-- 아코디언 끝 -->

                        <li class="d-flex mb-1">
                            <a href="${cPath}/gw/board/grbMyPost.do" class="d-flex flex-wrap align-items-center">
                                <i class='bx bxs-user-badge'></i>
                                <span class="align-middle ms-2">내게시글</span>
                            </a>
                        </li>
                        <li class="d-flex mb-1">
                            <a href="${cPath}/gw/board/grbImp.do" class="d-flex flex-wrap align-items-center">
                                <i class='bx bx-error-alt'></i>
                                <span class="align-middle ms-2">필독</span>
                            </a>
                        </li>
                        <li class="d-flex mb-1">
                            <a href="${cPath}/gw/board/grbAttention.do" class="d-flex flex-wrap align-items-center">
                                <i class='bx bx-star'></i>
                                <span class="align-middle ms-2">즐겨찾기</span>
                            </a>
                        </li>
                        <li class="d-flex mb-1">
                            <a href="${cPath}/gw/board/trash.do" class="d-flex flex-wrap align-items-center">
                                <i class="bx bx-trash"></i>
                                <span class="align-middle ms-2">휴지통</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 게시글 목록 -->
            <div class="col app-emails-list">
                <div class="card shadow-none border-0 rounded-0" style="padding: 30px 10px;">
                    <!-- 게시글 작성 폼 -->
                    <div class="modal-body flex-grow-1 pb-sm-0 px-6 py-2">
                    	<!-- 
                    	요청URI : /gw/board/insertPost.do
                    	요청파라미터 : {grbGubunNo=,grbTitle=,grbContent=,uploadFile=파일객체}
                    	요청방식 : post
                    	 -->
                        <form id="writeForm" action="${cPath}/gw/board/insertPost.do" method="post" enctype="multipart/form-data">
						    <div class="form-group row mb-3">
						        <label for="boardSelect" class="col-sm-2 col-form-label">게시판</label>
						        <div class="col-sm-6" style="display: flex;align-items: center;">
						           <select class="form-select" name="grbGubunNo" aria-label="Default select example" id="boardSelect" required style="margin-right: 20px;">
									    <option value="">게시판 선택</option>
										    <c:forEach var="board" items="${grbInsertList}">
										        <c:if test="${board.grbDelyn == 'N'}">
										            <option value="${board.grbGubunNo}">${board.grbGubunTitle}</option>
										        </c:if>
										    </c:forEach>
									</select>
						        <div class="form-check" style="margin-bottom:0;">
		                          <input class="form-check-input" type="checkbox" name="grbAttentionYN" value="Y" id="grbAttentionYN" class="me-2">
		                          <label for="grbAttentionYN" class="form-check-label"> 필독 여부 </label>
		                       </div>
						        </div>
						    </div>
						
						    <div class="form-group row mb-3">
						        <label for="title" class="col-sm-2 col-form-label">제목</label>
						        <div class="col-sm-10">
						            <input type="text" class="form-control" id="title" name="grbTitle" maxlength="20" placeholder="제목을 입력하세요" required="">
						        </div>
						    </div>
						
						    <div class="form-group row mb-3">
						        <label for="content" class="col-sm-2 col-form-label">내용</label>
						        <div class="col-sm-10">
						            <textarea class="form-control" id="content" name="grbContent" rows="6" maxlength="500" placeholder="내용을 입력하세요"></textarea>
						        </div>
						    </div>
						
						    <div class="form-group row mb-3">
						        <label for="atchFile.fileDetails0.uploadFile" class="col-sm-2 col-form-label">파일 선택</label>
						        <div class="col-sm-10">
						            <input type="file" id="atchFile.fileDetails0.uploadFile" name="atchFile.fileDetails[0].uploadFile" class="form-control" />
						        </div>
						    </div>
						
						    <div class="form-group row">
						         <div class="col-sm-10 offset-sm-2" style="display: flex; justify-content: flex-end;">
							        <!-- 자동입력 버튼 -->
							        <button type="button" id="dataBtn" class="btn btn-secondary me-2">자동입력</button>
							        <!-- 등록 버튼 -->
							        <button type="submit" class="btn btn-primary">등록</button>
							    </div>
						    </div>
						</form>
                    </div>
                </div>
            </div>
            <!-- /게시글 목록 -->
        </div>
    </div>
</div>