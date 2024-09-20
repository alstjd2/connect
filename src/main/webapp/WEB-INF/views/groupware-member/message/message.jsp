<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 로그인한 사용자의 정보 전달 -->
<script type="text/javascript">
    const loggedInEmpNo = ${loggedInEmpNo};
    const loggedInEmpNm = "${loggedInEmpNm}";
    console.log("Logged in employee number:", loggedInEmpNo);
    console.log("Logged in employee name:", loggedInEmpNm);
</script>


<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="app-chat card overflow-hidden">
                        <div class="row g-0">

                            <!-- Sidebar Left -->
                            <div class="col app-chat-sidebar-left app-sidebar overflow-hidden" id="app-chat-sidebar-left">
                                <div class="chat-sidebar-left-user sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
                                    <div class="avatar avatar-xl avatar-online chat-sidebar-avatar">
                                        <img src="${cPath }/resources/groupwareMember/assets/img/avatars/1.png" class="rounded-circle" />
                                    </div>
                                    <h5 class="mt-4 mb-0">존 도</h5>
                                    <span>관리자</span>
                                    <i class="bx bx-x bx-lg cursor-pointer close-sidebar" data-bs-toggle="sidebar" data-overlay data-target="#app-chat-sidebar-left"></i>
                                </div>
                                <div class="sidebar-body px-6 pb-6">
                                    <div class="my-6">
                                        <label for="chat-sidebar-left-user-about" class="text-uppercase text-muted mb-1">소개</label>
                                        <textarea id="chat-sidebar-left-user-about" class="form-control chat-sidebar-left-user-about" rows="3" maxlength="120">안녕하세요, GitHub의 저장소를 구독하셨음을 알려드립니다.</textarea>
                                    </div>
                                    <div class="my-6">
                                        <p class="text-uppercase text-muted mb-1">상태</p>
                                        <div class="d-grid gap-2 pt-2 text-heading ms-2">
                                            <div class="form-check form-check-success">
                                                <input name="chat-user-status" class="form-check-input" type="radio" value="active" id="user-active" checked />
                                                <label class="form-check-label" for="user-active">온라인</label>
                                            </div>
                                            <div class="form-check form-check-warning">
                                                <input name="chat-user-status" class="form-check-input" type="radio" value="away" id="user-away" />
                                                <label class="form-check-label" for="user-away">자리 비움</label>
                                            </div>
                                            <div class="form-check form-check-danger">
                                                <input name="chat-user-status" class="form-check-input" type="radio" value="busy" id="user-busy" />
                                                <label class="form-check-label" for="user-busy">방해 금지</label>
                                            </div>
                                            <div class="form-check form-check-secondary">
                                                <input name="chat-user-status" class="form-check-input" type="radio" value="offline" id="user-offline" />
                                                <label class="form-check-label" for="user-offline">오프라인</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-6">
                                        <p class="text-uppercase text-muted mb-1">설정</p>
                                        <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                            <li class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <i class="bx bx-lock-alt me-1"></i>
                                                    <span class="align-middle">2단계 인증</span>
                                                </div>
                                                <div class="form-check form-switch mb-0 me-1">
                                                    <input type="checkbox" class="form-check-input" checked />
                                                </div>
                                            </li>
                                            <li class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <i class="bx bx-bell me-1"></i>
                                                    <span class="align-middle">알림</span>
                                                </div>
                                                <div class="form-check form-switch mb-0 me-1">
                                                    <input type="checkbox" class="form-check-input" />
                                                </div>
                                            </li>
                                            <li>
                                                <i class="bx bx-user me-1"></i>
                                                <span class="align-middle">친구 초대</span>
                                            </li>
                                            <li>
                                                <i class="bx bx-trash me-1"></i>
                                                <span class="align-middle">계정 삭제</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="d-flex mt-6">
                                        <button class="btn btn-primary w-100" data-bs-toggle="sidebar" data-overlay data-target="#app-chat-sidebar-left">
                                            <i class="bx bx-log-out bx-sm me-2"></i>로그아웃
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- /Sidebar Left-->



                            <!-- 채팅 & 연락처 -->
                            <div class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end" id="app-chat-contacts" data-auth-emp="">
                                <div class="sidebar-header px-6 border-bottom d-flex align-items-center flex-column gap-4 justify-content-center">
                                    <button type="button" class="btn btn-dark w-100" data-bs-toggle="modal" data-bs-target="#modalCenter">
                                        새 메시지 생성
                                    </button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="modalCenter" tabindex="-1" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalCenterTitle">모달 제목</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col mb-0">
                                                            <label for="TagifyUserList" class="form-label">사용자 목록</label>
                                                            <input id="TagifyUserList" name="TagifyUserList" class="form-control" value="김태희, 맹동승" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary">추가</button>
                                                    <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">닫기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="d-flex align-items-center me-6 me-lg-0">
                                            <div class="flex-shrink-0 avatar avatar-online me-4" data-bs-toggle="sidebar" data-overlay="app-overlay-ex" data-target="#app-chat-sidebar-left">
                                                <img class="user-avatar rounded-circle cursor-pointer" src="${cPath }/resources/groupwareMember/assets/img/avatars/1.png" alt="Avatar" />
                                            </div>
                                            <div class="flex-grow-1 input-group input-group-merge rounded-pill">
                                                <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search bx-sm"></i></span>
                                                <input type="text" class="form-control chat-search-input" placeholder="검색..." aria-label="Search..." aria-describedby="basic-addon-search31" />
                                            </div>
                                        </div>
                                        <i class="bx bx-x bx-lg cursor-pointer position-absolute top-50 end-0 translate-middle d-lg-none d-block" data-overlay data-bs-toggle="sidebar" data-target="#app-chat-contacts"></i>
                                    </div>
                                </div>
                                <div class="sidebar-body">
                                    <!-- 채팅 목록 -->
                                    <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-list">
                                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                                            <h5 class="text-primary mb-0">채팅방 목록</h5>
                                        </li>
                                        <!-- 채팅방 목록 출력 -->
                                        <c:forEach var="chatRoom" items="${chatRoomList}">
							              <li class="chat-contact-list-item mb-1">
							                <a class="d-flex align-items-center" href="javascript:void(0);" data-room-id="${chatRoom.msgrmNo}">
							                  <div class="chat-contact-info flex-grow-1 ms-4">
							                    <div class="d-flex justify-content-between align-items-center">
							                      <h6 class="chat-contact-name text-truncate m-0 fw-normal">${chatRoom.msgrmNm}</h6>
							                      <!-- 채팅방 이름 표시 -->
							                      <small class="text-muted"></small> <!-- 예시 시간, 실제 데이터로 교체 -->
							                    </div>
							                    <small class="chat-contact-status text-truncate"></small> <!-- 예시 메시지, 실제 데이터로 교체 -->
							                  </div>
							                </a>
							              </li>
							            </c:forEach>
							          </ul>

                                    <!-- 채팅방 목록 아래 빈 공간의 레이아웃-->
                                    <ul class="list-unstyled chat-contact-list mb-0 py-2" id="contact-list">
                                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                                            <h5 class="text-primary mb-0"></h5>
                                        </li>
									    <li class="chat-contact-list-item" style="min-height: 200px; visibility: hidden;"></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- 채팅 기록 -->
                            <div class="col app-chat-history">
                                <div class="chat-history-wrapper">
                                    <div class="chat-history-header border-bottom">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex overflow-hidden align-items-center">
                                                <i class="bx bx-menu bx-lg cursor-pointer d-lg-none d-block me-4"
                                                    data-bs-toggle="sidebar" data-overlay
                                                    data-target="#app-chat-contacts"></i>
                                                <div class="chat-contact-info flex-grow-1 ms-4">
                                                    <h6 class="m-0 fw-normal chat-room-header-name"></h6>
                                                    <small class="user-status text-body"></small>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i
                                                    class="bx bx-phone bx-md cursor-pointer d-sm-inline-flex d-none btn btn-icon text-secondary me-1"></i>
                                                <i
                                                    class="bx bx-video bx-md cursor-pointer d-sm-inline-flex d-none btn btn-icon text-secondary me-1"></i>
                                                <i
                                                    class="bx bx-search bx-md cursor-pointer d-sm-inline-flex d-none btn btn-icon text-secondary me-1"></i>
                                                <div class="dropdown">
                                                    <button
                                                        class="btn btn-icon text-secondary dropdown-toggle hide-arrow"
                                                        data-bs-toggle="dropdown" aria-expanded="true"
                                                        id="chat-header-actions">
                                                        <i class="bx bx-dots-vertical-rounded bx-md"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end"
                                                        aria-labelledby="chat-header-actions">
                                                        <a class="dropdown-item" href="javascript:void(0);">연락처 보기</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">알림 음소거</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">연락처 차단</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">채팅 삭제</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">신고하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-history-body">
                                        <ul class="list-unstyled chat-history" id="chat-history-body">
										<!-- 채팅 기록 AJAX 호출 -->
                                        </ul>
                                    </div>
                                    <!-- 채팅 메시지 작성 폼 -->
                                    <div class="chat-history-footer shadow-xs">
                                        <form class="form-send-message d-flex justify-content-between align-items-center" method="post">
                                            <input class="form-control message-input border-0 me-4 shadow-none"
                                                placeholder="메시지를 입력하세요..." />
                                            <div class="message-actions d-flex align-items-center">
                                                <i class="speech-to-text bx bx-microphone bx-md btn btn-icon cursor-pointer text-heading"></i>
                                                <label for="attach-doc" class="form-label mb-0">
                                                    <i class="bx bx-paperclip bx-md cursor-pointer btn btn-icon mx-1 text-heading"></i>
                                                    <input type="file" id="attach-doc" hidden />
                                                </label>
                                                <button class="btn btn-primary d-flex send-msg-btn">
                                                    <i class="bx bx-paper-plane bx-sm"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /채팅 기록 -->

                            <!-- 오른쪽 사이드바 -->

                            <!-- /오른쪽 사이드바 -->

                            <div class="app-overlay"></div>
                        </div>
                    </div>
                </div>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-chat.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/addressBook-group.js"></script>