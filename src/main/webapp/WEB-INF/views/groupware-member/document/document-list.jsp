<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid flex-grow-1 container-p-y">
	<form class="dt_adv_search" method="GET">
	     <div class="col my-10 doc-status"></div>
    </form>
    <!-- Advanced Search -->
    <div class="card">
        <h5 class="card-header">
        	<i class="menu-icon bx bx-message-alt-add"></i>
        	결재 문서 관리
        </h5>
        <!--Search Form -->
        <div class="card-body">
            <form class="dt_adv_search" method="GET">
                <div class="row">
                    <div class="col-10">
                        <div class="row g-3">
                            <div class="col-12 col-sm-6 col-lg-4">
                                <!-- <label class="form-label">카테고리:</label> -->
                                <div class="doc-category"></div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <!-- <label class="form-label">서식명:</label> -->
                                <div class="doc-form-name"></div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <!-- <label class="form-label">작성자:</label> -->
                                <div class="doc-emp-name"></div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <!-- <label class="form-label">작성일:</label> -->
                                <div class="mb-0">
                                <input
                                    type="text"
                                    class="form-control dt-date flatpickr-range dt-input"
                                    data-column="8"
                                    placeholder="검색할 작성일을 선택하세요."
                                    data-column-index="7"
                                    name="dt_date" />
                                <input
                                    type="hidden"
                                    id="startDate1"
                                    class="form-control dt-date start_date dt-input"
                                    data-column="8"
                                    data-column-index="7"
                                    name="value_from_start_date" />
                                <input
                                    type="hidden"
                                    id="endDate1"
                                    class="form-control dt-date end_date dt-input"
                                    name="value_from_end_date"
                                    data-column="8"
                                    data-column-index="7" />
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <!-- <label class="form-label">완료일:</label> -->
                                <div class="mb-0">
                                <input
                                    type="text"
                                    class="form-control dt-date flatpickr-range dt-input"
                                    data-column="9"
                                    placeholder="검색할 완료일을 선택하세요."
                                    data-column-index="8"
                                    name="dt_date" />
                                <input
                                    type="hidden"
                                    id="startDate2"
                                    class="form-control dt-date start_date dt-input"
                                    data-column="9"
                                    data-column-index="8"
                                    name="value_from_start_date" />
                                <input
                                    type="hidden"
                                    id="endDate2"
                                    class="form-control dt-date end_date dt-input"
                                    name="value_from_end_date"
                                    data-column="9"
                                    data-column-index="8" />
                                </div>
                            </div>
                        </div>
                    </div>
                	<div class="col-2">
                    	<button id="reset" type="button" class="btn btn-primary w-100 h-100">필터 리셋</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-datatable table-responsive">
            <table class="dt-advanced-search table border-top">
                <thead>
                    <tr>
                        <th></th>
                        <th>상태</th>
                        <th>문서번호</th>
                        <th>카테고리</th>
                        <th>서식명</th>
                        <th>문서제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>완료일</th>
                    </tr>
                  </thead>
            </table>
        </div>
    </div>
    <!--/ Advanced Search -->

    <div class="modal fade " id="empMethods" tabindex="-1" aria-modal="true" role="dialog">
        <div class="modal-dialog modal-md modal-simple modal-enable-otp modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold fs-4" id="empMethodsLabel">직원 상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</div>
<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareMember/assets/js/document-list.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/emp-modal.js"></script>