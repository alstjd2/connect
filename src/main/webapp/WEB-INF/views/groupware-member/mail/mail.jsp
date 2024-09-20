<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="app-email card">
                        <div class="row g-0">
                            <!-- 이메일 사이드바 -->
                            <div class="col app-email-sidebar border-end flex-grow-0" id="app-email-sidebar">
                                <div class="btn-compost-wrapper d-grid">
                                    <button class="btn btn-primary btn-compose" data-bs-toggle="modal"
                                        data-bs-target="#emailComposeSidebar" id="emailComposeSidebarLabel">
                                        새 메일 작성
                                    </button>
                                </div>


				<div>
					<ul>
						<c:forEach items="${messageList }" var="mail">
							<li>${mail.snippet }</li>
						</c:forEach>
					</ul>
				</div>

				<!-- 이메일 필터 -->
                                <div class="email-filters pt-4 pb-2">
                                    <!-- 이메일 필터: 폴더 -->
                                    <ul class="email-filter-folders list-unstyled">
                                        <li class="active d-flex justify-content-between align-items-center mb-1"
                                            data-target="inbox">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-envelope"></i>
                                                <span class="align-middle ms-2">전체 편지함</span>
                                            </a>
                                        </li>
                                        <li class="d-flex mb-1" data-target="sent">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-send"></i>
                                                <span class="align-middle ms-2">보낸 편지함</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-1"
                                            data-target="draft">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-edit"></i>
                                                <span class="align-middle ms-2">받은 편지함</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between mb-1" data-target="starred">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-star"></i>
                                                <span class="align-middle ms-2">별표</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-1"
                                            data-target="spam">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-error-alt"></i>
                                                <span class="align-middle ms-2">스팸</span>
                                            </a>
                                        </li>
                                        <li class="d-flex align-items-center" data-target="trash">
                                            <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-trash"></i>
                                                <span class="align-middle ms-2">휴지통</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--/ 이메일 사이드바 -->

                            <!-- 이메일 목록 -->
                            <div class="col app-emails-list">
                                <div class="card shadow-none border-0 rounded-0">
                                    <div class="card-body emails-list-header p-3 py-2">
                                        <!-- 이메일 목록: 검색 -->
                                        <div class="d-flex justify-content-between align-items-center px-3 mt-2">
                                            <div class="d-flex align-items-center w-100">
                                                <i class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4 mb-4"
                                                    data-bs-toggle="sidebar" data-target="#app-email-sidebar"
                                                    data-overlay></i>
                                                <div class="mb-4 w-100">
                                                    <div class="input-group input-group-merge shadow-none">
                                                        <span class="input-group-text border-0 p-0 pe-4"
                                                            id="email-search">
                                                            <i class="bx bx-search bx-md text-body"></i>
                                                        </span>
                                                        <input type="text"
                                                            class="form-control email-search-input border-0 py-0"
                                                            placeholder="메일 검색" aria-label="메일 검색"
                                                            aria-describedby="email-search" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="mx-n3 emails-list-header-hr mb-2" />
                                        <!-- 이메일 목록: 액션 -->
                                        <div class="d-flex justify-content-between align-items-center ps-1">
                                            <div class="d-flex align-items-center">
                                                <div class="form-check mb-0 ms-2">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="email-select-all" />
                                                    <label class="form-check-label" for="email-select-all"></label>
                                                </div>
                                                <div class="btn btn-icon me-1">
                                                    <i class="bx bx-trash bx-md email-list-delete cursor-pointer"></i>
                                                </div>
                                                <div class="btn btn-icon me-1">
                                                    <i class="bx bx-envelope-open bx-md email-list-read cursor-pointer"></i>
                                                </div>
                                                <div class="dropdown me-1">
                                                    <button class="btn btn-icon p-0" type="button"
                                                        id="dropdownMenuFolderOne" data-bs-toggle="dropdown"
                                                        aria-haspopup="true" aria-expanded="false">
                                                        <i class="bx bx-folder bx-md"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end"
                                                        aria-labelledby="dropdownMenuFolderOne">
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="bx bx-error-alt bx-sm me-1"></i>
                                                            <span class="align-middle">스팸</span>
                                                        </a>
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="bx bx-edit bx-sm me-1"></i>
                                                            <span class="align-middle">임시 저장</span>
                                                        </a>
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="bx bx-trash bx-sm me-1"></i>
                                                            <span class="align-middle">휴지통</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="dropdown mx-1">
                                                    <button class="btn btn-icon dropdown-toggle hide-arrow"
                                                        data-bs-toggle="dropdown" aria-expanded="true"
                                                        id="dropdownLabelOne">
                                                        <i class="bx bx-label bx-md"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end"
                                                        aria-labelledby="dropdownLabelOne">
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="badge badge-dot bg-success me-1"></i>
                                                            <span class="align-middle">워크샵</span>
                                                        </a>
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="badge badge-dot bg-primary me-1"></i>
                                                            <span class="align-middle">회사</span>
                                                        </a>
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="badge badge-dot bg-warning me-1"></i>
                                                            <span class="align-middle">중요</span>
                                                        </a>
                                                        <a class="dropdown-item" href="javascript:void(0)">
                                                            <i class="badge badge-dot bg-danger me-1"></i>
                                                            <span class="align-middle">비공개</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <span class="btn btn-icon me-1">
                                                    <i class="bx bx-refresh bx-md scaleX-n1-rtl cursor-pointer email-refresh"></i>
                                                </span>
                                                <div class="dropdown">
                                                    <button class="btn btn-icon p-0" type="button" id="emailsActions"
                                                        data-bs-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                        <i class="bx bx-dots-vertical-rounded bx-md"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end"
                                                        aria-labelledby="emailsActions">
                                                        <a class="dropdown-item" href="javascript:void(0)">읽음으로
                                                            표시</a>
                                                        <a class="dropdown-item" href="javascript:void(0)">안 읽음으로
                                                            표시</a>
                                                        <a class="dropdown-item" href="javascript:void(0)">삭제</a>
                                                        <a class="dropdown-item" href="javascript:void(0)">보관</a>
                                                    </div>
                                                </div>1
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="container-m-nx m-0" />
                                    <!-- Email List: Items -->
                                    <div class="email-list pt-0">
                                        <ul class="list-unstyled m-0">

											<c:forEach items="${mailList }" var="mail">
	                                            <li class="email-list-item email-marked-read d-flex align-items-center"

			                                                data-starred="true"

														<c:if test="${mail.sent eq 'true' }">
	                                               			 data-draft="true"
														</c:if>
														<c:if test="${mail.sent  eq 'false' }">
															data-sent="true"
														</c:if>


	                                                data-bs-toggle="sidebar" data-target="#app-email-view">
	                                                <div class="d-flex align-items-center w-100">
	                                                    <div class="form-check mb-0 ms-2">
	                                                        <input class="email-list-item-input form-check-input" type="checkbox" id="email-2" />
	                                                        <label class="form-check-label" for="email-2"></label>
	                                                    </div>
	                                                    <span class="ms-sm-3 me-4 d-sm-inline-block d-none"><i
	                                                            class="email-list-item-bookmark bx bx-star bx-md cursor-pointer ms-1"></i></span>
	                                                    <div class="email-list-item-content ms-2 ms-sm-0 me-2">
	                                                        <span class="email-list-item-username me-2 text-heading"> ${mail.from }</span>
	                                                        <small class="email-list-item-subject d-xl-inline-block d-block">
	                                                            ${mail.subject }</small>
	                                                    </div>

	                                                    <div class="email-list-item-meta ms-auto d-flex align-items-center">
	                                                        <span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2"
	                                                            data-label="private"></span>
	                                                        <small class=" text-muted">${mail.dateTime }</small>
	                                                        <ul class="list-inline email-list-item-actions">
	                                                            <li class="list-inline-item email-delete btn btn-icon">
	                                                                <i class="bx bx-trash bx-md"></i>
	                                                            </li>
	                                                            <li class="list-inline-item email-unread btn btn-icon">
	                                                                <i class="bx bx-envelope bx-md"></i>
	                                                            </li>
	                                                            <li class="list-inline-item btn btn-icon"><i
	                                                                    class="bx bx-info-circle bx-md"></i></li>
	                                                        </ul>
	                                                    </div>
	                                                </div>
	                                            </li>
											</c:forEach>

                                        </ul>
                                        <ul class="list-unstyled m-0">
                                            <li class="email-list-empty text-center d-none">No items found.</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="app-overlay"></div>
                            </div>
                            <!-- /Emails List -->

                            <!-- 이메일 보기 -->
                            <div class="col app-email-view flex-grow-0 bg-lighter" id="app-email-view">
                                <div class="card shadow-none border-0 rounded-0 app-email-view-header p-5 pt-md-4 py-2">
                                    <!-- 이메일 보기 : 제목 바 -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center overflow-hidden">
                                            <span class="ms-sm-2 me-4"><i class="bx bx-chevron-left bx-md cursor-pointer"
                                                    data-bs-toggle="sidebar" data-target="#app-email-view"></i></span>
                                            <h6 class="text-truncate mb-0 me-2 fw-normal">[긴급]대덕에서 인력요청</h6>
                                            <span class="badge bg-label-warning">중요</span>
                                        </div>
                                        <!-- 이메일 보기 : 액션 바 -->
                                        <div class="d-flex align-items-center">
                                            <span class="btn btn-icon p-0 me-2 text-muted">
                                                <i class="bx bx-chevron-left bx-md"></i>
                                            </span>
                                            <span class="btn btn-icon p-0">
                                                <i class="bx bx-chevron-right bx-md"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <hr class="app-email-view-hr mx-n5 mb-2" />
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center">
                                            <span class="btn btn-icon me-1"><i
                                                    class="bx bx-trash bx-md cursor-pointer"></i></span>
                                            <span class="btn btn-icon me-1"><i
                                                    class="bx bx-envelope-open bx-md cursor-pointer"
                                                    data-bs-toggle="sidebar" data-target="#app-email-view"></i></span>
                                            <div class="dropdown">
                                                <button class="btn btn-icon p-0 me-1" type="button"
                                                    id="dropdownMenuFolderTwo" data-bs-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">
                                                    <i class="bx bx-folder bx-md"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownMenuFolderTwo">
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-error-alt me-1"></i>
                                                        <span class="align-middle">스팸</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-pencil me-1"></i>
                                                        <span class="align-middle">초안</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-trash me-1"></i>
                                                        <span class="align-middle">휴지통</span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="dropdown">
                                                <button class="btn btn-icon p-0" type="button" id="dropdownLabelTwo"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="bx bx-label bx-md"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownLabelTwo">
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="badge badge-dot bg-success me-1"></i>
                                                        <span class="align-middle">워크숍</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="badge badge-dot bg-primary me-1"></i>
                                                        <span class="align-middle">회사</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="badge badge-dot bg-info me-1"></i>
                                                        <span class="align-middle">중요</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <span class="btn btn-icon p-0">
                                                <i class="bx bx-star bx-md"></i>
                                            </span>
                                            <div class="dropdown ms-1">
                                                <button class="btn btn-icon p-0" type="button" id="dropdownMoreOptions"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="bx bx-dots-vertical-rounded bx-md"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownMoreOptions">
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-envelope me-1"></i>
                                                        <span class="align-middle">읽지 않음으로 표시</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-envelope-open me-1"></i>
                                                        <span class="align-middle">읽음으로 표시</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-star me-1"></i>
                                                        <span class="align-middle">별표 추가</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-calendar me-1"></i>
                                                        <span class="align-middle">이벤트 만들기</span>
                                                    </a>
                                                    <a class="dropdown-item" href="javascript:void(0)">
                                                        <i class="bx bx-volume-mute me-1"></i>
                                                        <span class="align-middle">음소거</span>
                                                    </a>
                                                    <a class="dropdown-item d-sm-none d-block" href="javascript:void(0)">
                                                        <i class="bx bx-printer me-1"></i>
                                                        <span class="align-middle">인쇄</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="m-0" />
                                <!-- 이메일 보기 : 내용 -->
                                <div class="app-email-view-content py-4">

                                    <!-- 이메일 보기 : 마지막 메일 -->
                                    <div class="card mx-sm-6 mx-3 mt-4">
                                        <div class="card-header border-bottom ">
                                        	<h6 class="fw-medium mb-0">[HDC-개발1팀/대리] 이원두</h6>
                                        </div>
                                        <div class="card-body pt-6">
                                            <p class="fw-medium">안녕하세요,</p>
                                            <p>
                                                대덕 거래처에서 급하게 개발자 1명의 지원을 요청하였습니다. 요청 사항에 따르면, 9월 23일(월) 오전 10시부터 오후 4시까지 대덕 현장에서 필요한 인력입니다.
                                            </p>
                                            <p>
                                                이와 관련하여, 해당 날짜에 충원된 인력이 바로 이 요청에 대응할 수 있도록 조치를 취해 주시기 바랍니다. 이 인력의 배치가 완료된 후, 현장에 필요한 모든 준비가 완료될 수 있도록 확인해 주시면 감사하겠습니다.
                                            </p>
                                            <p>추가로 필요한 정보나 조치가 필요하시면 언제든지 연락 주십시오. 빠른 확인과 대응 부탁드립니다. 감사합니다.</p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 이메일 보기 -->
                        </div>

                        <!-- 이메일 작성 -->
                        <div class="app-email-compose modal" id="emailComposeSidebar" tabindex="-1"
                            aria-labelledby="emailComposeSidebarLabel" aria-hidden="true">
                            <div class="modal-dialog modal-l m-0 me-md-6 mb-6 modal-lg">
                                <div class="modal-content p-0">
                                    <div class="modal-header py-3 justify-content-between">
                                        <h5 class="modal-title text-body fs-5">이메일 작성</h5>
                                        <div class="d-flex align-items-center gap-2">
                                            <button type="button" class="btn btn-sm btn-icon"><i
                                                    class="bx bx-minus"></i></button>
                                            <button type="button" class="btn btn-sm btn-icon" data-bs-dismiss="modal"
                                                aria-label="닫기">
                                                <i class="bx bx-x"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="modal-body flex-grow-1 pb-sm-0 px-6 py-2">
                                        <form class="email-compose-form">
                                            <div
                                                class="email-compose-to d-flex justify-content-between align-items-center">
                                                <label class="fw-medium mb-1 text-muted" for="emailContacts">받는
                                                    사람:</label>
                                                <div class="select2-primary border-0 shadow-none flex-grow-1 mx-2">
                                                    <select class="select2 select-email-contacts form-select"
                                                        id="emailContacts" name="emailContacts" multiple>

                                                        <!--  주소록  -->
														<c:forEach items="${mailAddList}" var="add">
	                                                        <option value="${add.adrMail }">[${add.adrAff }-${add.adrDep }/${add.adrPos }] ${add.adrNm }</option>
														</c:forEach>

                                                    </select>
                                                </div>
                                                <div class="email-compose-toggle-wrapper text-end">
                                                    <a class="email-compose-toggle-cc text-body"
                                                        href="javascript:void(0);">참조 |</a>
                                                    <a class="email-compose-toggle-bcc text-body"
                                                        href="javascript:void(0);">숨은 참조</a>
                                                </div>
                                            </div>

                                            <div class="email-compose-cc d-none">
                                                <hr class="mx-n6 my-0" />
                                                <div class="d-flex align-items-center">
                                                    <label for="email-cc" class="fw-medium text-muted">참조:</label>
                                                    <input type="text"
                                                        class="form-control border-0 shadow-none flex-grow-1 mx-2"
                                                        id="email-cc" placeholder="someone@email.com" />
                                                </div>
                                            </div>
                                            <div class="email-compose-bcc d-none">
                                                <hr class="mx-n6 my-0" />
                                                <div class="d-flex align-items-center">
                                                    <label for="email-bcc" class="fw-medium text-muted">숨은 참조:</label>
                                                    <input type="text"
                                                        class="form-control border-0 shadow-none flex-grow-1 mx-2"
                                                        id="email-bcc" placeholder="someone@email.com" />
                                                </div>
                                            </div>
                                            <hr class="mx-n6 my-0" />
                                            <div class="email-compose-subject d-flex align-items-center">
                                                <label for="email-subject" class="fw-medium text-muted">제목:</label>
                                                <input type="text"
                                                    class="form-control border-0 shadow-none flex-grow-1 mx-2"
                                                    id="email-subject" required="required"/>
                                            </div>
                                            <div class="email-compose-message" style="height: 50vh;" >

                                                <hr class="mx-n6 my-0" />
                                           		 <div class="mt-1">
	                                           		 <div id="editor"></div>
                                           		 </div>

                                            </div>

                                            <hr class="mx-n6 mt-0 mb-2" />
                                            <div
                                                class="email-compose-actions d-flex justify-content-between align-items-center my-4">
                                                <div class="d-flex align-items-center">
                                                    <div class="btn-group">
                                                        <button type="button" id="sendBtn"
                                                            class="btn btn-primary dropdown-toggle email-send-btn"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            보내기 <i
                                                                class="bx bx-paper-plane bx-sm scaleX-n1-rtl ms-2"></i>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item" href="javascript:void(0);" id="sendMailBtn">메일 전송</a></li>
                                                            <li><a class="dropdown-item" href="javascript:void(0);" id="saveMailBtn">임시 저장</a></li>
                                                        </ul>
                                                    </div>
                                                    <label for="attach-file" class="btn btn-sm btn-icon ms-4"><i
                                                            class="bx bx-paperclip cursor-pointer"></i></label>
                                                    <input type="file" name="file-input" class="d-none"
                                                        id="attach-file" />
                                                </div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="dropdown">
                                                        <button class="btn btn-sm btn-icon p-0" type="button"
                                                            id="dropdownMoreActions" data-bs-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMoreActions">
                                                            <li><button type="button" class="dropdown-item">라벨
                                                                    추가</button></li>
                                                            <li><button type="button" class="dropdown-item">일반 텍스트
                                                                    모드</button></li>
                                                            <li>
                                                                <hr class="dropdown-divider" />
                                                            </li>
                                                            <li><button type="button" class="dropdown-item">인쇄</button>
                                                            </li>
                                                            <li><button type="button" class="dropdown-item">맞춤법
                                                                    검사</button></li>
                                                        </ul>
                                                    </div>
                                                    <button type="reset" class="btn btn-sm btn-icon"
                                                        data-bs-dismiss="modal" aria-label="닫기">
                                                        <i class="bx bx-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /이메일 작성 -->

                    </div>
                </div>

<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
   	height: '500px',
    initialEditType: 'wysiwyg'
});

</script>

<script defer src="${cPath}/resources/groupwareMember/assets/js/app-email.js"></script>