<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="app-kanban">
                        <!-- 새 보드 추가 -->
                        <div class="row">
                            <div class="col-12">
                                <form class="kanban-add-new-board">
                                    <label class="kanban-add-board-btn" for="kanban-add-board-input">
                                        <i class="bx bx-plus"></i>
                                        <span class="align-middle">새로 추가</span>
                                    </label>
                                    <input type="text" class="form-control w-px-250 kanban-add-board-input mb-4 d-none"
                                        placeholder="보드 제목 추가" id="kanban-add-board-input" required />
                                    <div class="mb-4 kanban-add-board-input d-none">
                                        <button class="btn btn-primary btn-sm me-3">추가</button>
                                        <button type="button"
                                            class="btn btn-label-secondary btn-sm kanban-add-board-cancel-btn">
                                            취소
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 간반 래퍼 -->
                        <div class="kanban-wrapper"></div>

                        <!-- 작업/작업 및 활동 편집 -->
                        <div class="offcanvas offcanvas-end kanban-update-item-sidebar">
                            <div class="offcanvas-header border-bottom">
                                <h5 class="offcanvas-title">작업 편집</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                    aria-label="닫기"></button>
                            </div>
                            <div class="offcanvas-body pt-0">
                                <div class="nav-align-top">
                                    <ul class="nav nav-tabs mb-6 rounded-0">
                                        <li class="nav-item">
                                            <button class="nav-link active" data-bs-toggle="tab"
                                                data-bs-target="#tab-update">
                                                <i class="bx bx-edit bx-sm me-1_5"></i>
                                                <span class="align-middle">편집</span>
                                            </button>
                                        </li>
                                        <li class="nav-item">
                                            <button class="nav-link" data-bs-toggle="tab"
                                                data-bs-target="#tab-activity">
                                                <i class="bx bx-bar-chart bx-sm me-1_5"></i>
                                                <span class="align-middle">활동</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content p-0">
                                    <!-- 항목/작업 업데이트 -->
                                    <div class="tab-pane fade show active" id="tab-update" role="tabpanel">
                                        <form>
                                            <div class="mb-8 mt-2">
                                                <label class="form-label" for="title">제목</label>
                                                <input type="text" id="title" class="form-control"
                                                    placeholder="제목 입력" />
                                            </div>
                                            <div class="mb-8">
                                                <label class="form-label" for="due-date">마감일</label>
                                                <input type="text" id="due-date" class="form-control"
                                                    placeholder="마감일 입력" />
                                            </div>
                                            <div class="mb-8">
                                                <label class="form-label" for="label">레이블</label>
                                                <select class="select2 select2-label form-select" id="label">
                                                    <option data-color="bg-label-success" value="UX">UX</option>
                                                    <option data-color="bg-label-warning" value="이미지">이미지</option>
                                                    <option data-color="bg-label-info" value="정보">정보</option>
                                                    <option data-color="bg-label-danger" value="코드 리뷰">코드 리뷰</option>
                                                    <option data-color="bg-label-secondary" value="앱">앱</option>
                                                    <option data-color="bg-label-primary" value="차트 및 지도">차트 및 지도
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label">담당자</label>
                                                <div class="assigned d-flex flex-wrap"></div>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label" for="attachments">첨부파일</label>
                                                <div>
                                                    <input type="file" class="form-control" id="attachments" />
                                                </div>
                                            </div>
                                            <div class="mb-6">
                                                <label class="form-label">댓글</label>
                                                <div class="comment-editor border-bottom-0"></div>
                                                <div class="d-flex justify-content-end">
                                                    <div class="comment-toolbar">
                                                        <span class="ql-formats me-0">
                                                            <button class="ql-bold"></button>
                                                            <button class="ql-italic"></button>
                                                            <button class="ql-underline"></button>
                                                            <button class="ql-link"></button>
                                                            <button class="ql-image"></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="d-flex flex-wrap">
                                                    <button type="button" class="btn btn-primary me-4"
                                                        data-bs-dismiss="offcanvas">
                                                        업데이트
                                                    </button>
                                                    <button type="button" class="btn btn-label-danger"
                                                        data-bs-dismiss="offcanvas">
                                                        삭제
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- 활동 -->
                                    <div class="tab-pane fade text-heading" id="tab-activity" role="tabpanel">
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-success rounded-circle">HJ</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Jordan</span>가 보드를 떠났습니다.</p>
                                                <small class="text-muted">오늘 11:00 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/6.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0">
                                                    <span>Dianna</span>가 댓글에서 <span class="text-primary">@bruce</span>를
                                                    언급했습니다.
                                                </p>
                                                <small class="text-muted">오늘 10:20 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/2.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Martian</span>이 Charts & Maps 작업을 완료된 보드로 이동했습니다.
                                                </p>
                                                <small class="text-muted">오늘 10:00 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/1.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Barry</span>가 App 리뷰 작업에 댓글을 달았습니다.</p>
                                                <small class="text-muted">오늘 8:32 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-dark rounded-circle">BW</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Bruce</span>가 코드 리뷰 작업을 맡았습니다.</p>
                                                <small class="text-muted">오늘 8:30 PM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-danger rounded-circle">CK</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0">
                                                    <span>Clark</span>이 UX 연구 작업을 <span
                                                        class="text-primary">@martian</span>에게 할당했습니다.
                                                </p>
                                                <small class="text-muted">오늘 8:00 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/4.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0">
                                                    <span>Ray</span>가 <span>Forms & Tables</span> 작업을 진행 중에서 완료로 이동했습니다.
                                                </p>
                                                <small class="text-muted">오늘 7:45 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/1.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Barry</span>가 그에게 할당된 모든 작업을 완료했습니다.</p>
                                                <small class="text-muted">오늘 7:17 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-success rounded-circle">HJ</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Jordan</span>이 새로운 이미지 업데이트 작업을 추가했습니다.</p>
                                                <small class="text-muted">오늘 7:00 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <img src="assets/img/avatars/6.png" alt="Avatar"
                                                    class="rounded-circle" />
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0">
                                                    <span>Dianna</span>이 <span>FAQ UX</span> 작업을 진행 중에서 완료 보드로 이동했습니다.
                                                </p>
                                                <small class="text-muted">오늘 7:00 AM</small>
                                            </div>
                                        </div>
                                        <div class="media mb-4 d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-danger rounded-circle">CK</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Clark</span>이 <span>완료</span>라는 이름의 새 보드를 추가했습니다.
                                                </p>
                                                <small class="text-muted">어제 3:00 PM</small>
                                            </div>
                                        </div>
                                        <div class="media d-flex align-items-center">
                                            <div class="avatar me-3 flex-shrink-0">
                                                <span class="avatar-initial bg-label-dark rounded-circle">BW</span>
                                            </div>
                                            <div class="media-body">
                                                <p class="mb-0"><span>Bruce</span>가 진행 중 보드에 새 작업을 추가했습니다.</p>
                                                <small class="text-muted">어제 12:00 PM</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-kanban.js"></script>