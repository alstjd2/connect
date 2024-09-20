r<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="${cPath }/resources/groupwareMember/assets/vendor/libs/quill/quill.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/jmsaa/reply.js"></script>
		<script defer type="text/javascript"
		src="${cPath}/resources/js/app/jmsaa/board.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/groupwareMember/assets/css/custom/jms_aa.css" />
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="app-email card" data-updated-grb="${grbNo }">
		<div class="row g-0">
			<!-- 게시글 사이드바 -->
			<div class="col app-email-sidebar border-end flex-grow-0"
				id="app-email-sidebar">
				<div class="btn-compost-wrapper d-grid">
					<form action="${cPath}/gw/board/grbGubunInsertForm.do" method="get">
						<input type="hidden" name="comNo" value="${comNo}">
						<button type="submit" class="btn btn-primary btn-compose">
							<i class='bx bx-edit pe-2'></i> 새 게시글 작성
						</button>
					</form>
				</div>

				<div class="email-filters pt-4 pb-2 ps">
					<!-- 게시글 필터: 폴더 -->
					<ul class="email-filter-folders list-unstyled">
						<li class="d-flex mb-1 active"><a
							href="${cPath }/gw/board/board.do"
							class="d-flex flex-wrap align-items-center"> <i
								class='bx bxs-file-plus'></i> <span class="align-middle ms-2">최신글</span>
						</a></li>

						<!-- 아코디언 시작 -->
						<div class="accordion" id="boardAccordion">
							<div class=""> 
								<h2 class="accordion-header" id="heading-${gubun.grbGubunNo}">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse-${gubun.grbGubunNo}"
										aria-expanded="false"
										aria-controls="collapse-${gubun.grbGubunNo}"><i class='bx bx-copy-alt me-2'></i>게시판 선택</button>
								</h2>
								<div id="collapse-${gubun.grbGubunNo}"
									class="accordion-collapse collapse"
									aria-labelledby="heading-${gubun.grbGubunNo}"
									data-bs-parent="#boardAccordion">
									<div class="accordion-body">
										<ul class="list-unstyled">
											<c:forEach var="board" items="${gubunList}">
												<li class="d-flex mb-1">
													<form action="${cPath}/gw/board/gubunList.do" method="get"
														class="d-flex mb-1">
														<input type="hidden" name="grbGubunNo"
															value="${board.grbGubunNo}">
														<button type="submit"
															class="d-flex flex-wrap align-items-center btn p-0">
															<span class="align-middle">${board.grbGubunTitle}</span>
														</button>
													</form>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- 아코디언 끝 -->

						<li class="d-flex mb-1"><a
							href="${cPath }/gw/board/grbMyPost.do"
							class="d-flex flex-wrap align-items-center"> <i
								class='bx bxs-user-badge'></i> <span class="align-middle ms-2">내게시글</span>
						</a></li>
						<li class="d-flex mb-1"><a
							href="${cPath }/gw/board/grbImp.do"
							class="d-flex flex-wrap align-items-center"> <i
								class='bx bx-error-alt'></i> <span class="align-middle ms-2">필독</span>
						</a></li>
						<li class="d-flex mb-1"><a
							href="${cPath }/gw/board/grbAttention.do"
							class="d-flex flex-wrap align-items-center"> <i
								class='bx bx-star'></i> <span class="align-middle ms-2">즐겨찾기</span>
						</a></li>
						<li class="d-flex mb-1"><a href="${cPath }/gw/board/trash.do"
							class="d-flex flex-wrap align-items-center"> <i
								class="bx bx-trash"></i> <span class="align-middle ms-2">휴지통</span>
						</a></li>
					</ul>
				</div>
			</div>
			<!-- 게시글 필터 -->

			<div class="col app-emails-list ">
				<div class="card shadow-none border-0 rounded-0">
					<div class="card-body emails-list-header p-3 py-2">
						<!-- 게시글 목록: 검색 -->
						<div
							class="d-flex justify-content-between align-items-center px-3 mt-2">
							<hr class="mx-n3 emails-list-header-hr mb-2">
							<div class="d-flex align-items-center w-100"
								style="margin-bottom: 10px;">
								<i
									class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4 mb-4"
									data-bs-toggle="sidebar" data-target="#app-email-sidebar"
									data-overlay=""></i>
								<div class="mb-4 w-100" style="margin-top: 20px;">
									<div class="input-group input-group-merge shadow-none">
										<!-- Search Type Dropdown -->
										<select id="searchType" name="searchType"
											class="form-select border-0 py-0" aria-label="검색 유형 선택">
											<option value="">전체</option>
											<option value="title">제목</option>
											<option value="write">작성자</option>
											<option value="content">내용</option>
										</select> <span class="input-group-text border-0 p-0 pe-4"
											id="board-search"> <i
											class="bx bx-search bx-md text-body"></i>
										</span>
										<!-- Search Form -->
										<div id="searchUI">
											<!-- Search Input -->
											<input id="searchWord" name="searchWord"
												placeholder="게시판명을 검색하세요." type="text"
												class="form-control addr-search-input border-0 py-0"
												aria-label="게시판명을 검색하세요." value="" style="width: 800px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="mx-n3 emails-list-header-hr mb-2">
						<div class="email-list pt-0 ps" id="div-list-body">
							<c:forEach var="board" items="${grBoardList}">
								<ul class="list-unstyled m-0">
									<li
										class="email-list-item email-marked-read d-flex align-items-center body-li"
										id="boardBorder" data-starred="true" data-bs-toggle="sidebar"
										data-target="#app-email-view" data-grb-no="${board.grbNo}">
										<div class="d-flex align-items-center w-100">
											<div>
												<span class="ms-sm-3 me-4 d-sm-inline-block d-none">
													<label for="bookmark-${board.grbNo}"
													class="btn btn-icon rounded-pill btn-outline-warning">
														<input type="hidden" name="bookmark"
														class="bookmark-checkbox" data-adr-no="${board.grbNo}" />
														<input type="hidden" name="empNo" data-emp-no="${empNo}" />
														<c:choose>
															<c:when
																test="${not empty board.grbAttentionList && board.grbAttentionList[0].grbAttentionNo != 0}">
																<i id="bookmark-icon-${board.grbNo}" class="bx bxs-star"
																	data-adr-no="${board.grbNo}" data-emp-no="${empNo}"
																	data-att-no="${board.grbAttentionList[0].grbAttentionNo }"
																	onclick="toggleBoardmark(this)"></i>
															</c:when>
															<c:otherwise>
																<i id="bookmark-icon-${board.grbNo}" class="bx bx-star"
																	data-adr-no="${board.grbNo}" data-emp-no="${empNo}"
																	onclick="toggleBoardmark(this)"></i>
															</c:otherwise>
														</c:choose>
												</label>
												</span>
											</div>
											<div class="email-list-item-content ms-2 ms-sm-0 me-2">
												<span class="email-list-item-username me-2 text-heading">${board.grbTitle }</span>
											</div>
											<div
												class="email-list-item-meta ms-auto d-flex align-items-center">
												<c:if test="${board.grbAttachfile ne 0 }">
													<span class="email-list-item-attachment bx bx-paperclip bx-md 
													cursor-pointer me-2 float-end float-sm-none" style="margin-right: 20px !important;"></span>
												</c:if>
												<small class="email-list-item-time text-muted"
													id="boardWriter"> <!-- 작성자명 -->
													<div>${board.empNm}</div> <!-- 날짜와 시간 부분 (연도-월-일 시간:분) -->
													<div>${board.grbDate.substring(0, 16)}</div>
												</small>
												<ul class="list-inline email-list-item-actions">
													<c:if test="${board.empNo == empNo}">
														<!-- 쓰레기통 아이콘: 작성자 본인의 글일 때만 표시 -->
														<li class="list-inline-item email-delete btn btn-icon">
															<form>
																<label for="trash-${board.grbNo}"
																	class="list-inline-item email-delete btn btn-icon">
																	<input type="hidden" name="trash"
																	class="trash-checkbox" data-adr-no="${board.grbNo}" />
																	<input type="hidden" name="empNo"
																	data-emp-no="${empNo}" /> <i class="bx bx-trash bx-md"
																	data-adr-no="${board.grbNo}" data-emp-no="${empNo}"
																	onclick="toggleTrashYN(this)"></i>
																</label>
															</form>
														</li>
														<li class="list-inline-item email-unread btn btn-icon">
															<i class="bx bx-edit bx-md"
															onclick="redirectToEditForm(${board.grbNo})"></i>
														</li>
													</c:if>
												</ul>
											</div>
										</div>
									</li>
								</ul>
								<ul class="list-unstyled m-0">
									<li class="email-list-empty text-center d-none">No items
										found.</li>
								</ul>

							</c:forEach>
							<nav aria-label="Page navigation text-center">
								<ul
									class="pagination pagination-rounded justify-content-center pt-7"
									style="padding-top: 2.8rem !important;">
									<div class="paging-area">${pagingHTML}</div>
								</ul>
							</nav>
							<!-- 게시글 보기 : 내용 -->
							<div class="col app-email-view flex-grow-0 bg-lighter"
								id="app-email-view" style="width: calc(100%)"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    const grbGubunNo = "${grbGubunNo}";
</script>
	
	<form:form id="searchform" method="get" modelAttribute="condition">
		<form:hidden path="searchType" />
		<form:hidden path="searchWord" />
		<input type="hidden" name="page" />
	</form:form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script defer type="text/javascript"
		src="${cPath}/resources/groupwareMember/assets/js/custom"></script>
	<script defer type="text/javascript"
		src="${cPath}/resources/groupwareMember/assets/js/boardUpdate/gubunPaging.js"></script>
	<script type="text/javascript"
		src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
	<script type="text/javascript"
		src="${cPath}/resources/js/app/jmsaa/replyRemove.js"></script>