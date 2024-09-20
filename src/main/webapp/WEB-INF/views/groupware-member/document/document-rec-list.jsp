<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="w-100 px-10 mt-10">
	<form class="dt_adv_search" method="GET">
	     <div class="col my-10 doc-statusRec"></div>
    </form>
    <!-- Advanced Search -->
    <div class="card">
        <h5 class="card-header">
        	<i class="menu-icon bx bx-message-alt-check"></i>
        	수신 문서 관리
        </h5>
        <!--Search Form -->
        <div class="card-body">
            <form class="dt_adv_search" method="GET">
                <div class="row">
                    <div class="col-10">
                        <div class="row g-3">
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="doc-status"></div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="doc-form-name"></div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="doc-emp-name"></div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="mb-0">
	                                <input
	                                    type="text"
	                                    class="form-control dt-date flatpickr-range dt-input"
	                                    data-column="6"
	                                    placeholder="검색할 작성일을 선택하세요."
	                                    data-column-index="5"
	                                    name="dt_date" />
	                                <input
	                                    type="hidden"
	                                    class="form-control dt-date start_date dt-input"
	                                    data-column="6"
	                                    data-column-index="5"
	                                    name="value_from_start_date" />
	                                <input
	                                    type="hidden"
	                                    class="form-control dt-date end_date dt-input"
	                                    name="value_from_end_date"
	                                    data-column="6"
	                                    data-column-index="5" />
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="mb-0">
	                                <input
	                                    type="text"
	                                    class="form-control dt-date flatpickr-range dt-input"
	                                    data-column="7"
	                                    placeholder="검색할 완료일을 선택하세요."
	                                    data-column-index="6"
	                                    name="dt_date" />
	                                <input
	                                    type="hidden"
	                                    class="form-control dt-date start_date dt-input"
	                                    data-column="7"
	                                    data-column-index="6"
	                                    name="value_from_start_date" />
	                                <input
	                                    type="hidden"
	                                    class="form-control dt-date end_date dt-input"
	                                    name="value_from_end_date"
	                                    data-column="7"
	                                    data-column-index="6" />
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="mb-0">
                                <input
                                    type="text"
                                    class="form-control dt-date flatpickr-range dt-input"
                                    data-column="10"
                                    placeholder="검색할 작업완료일을 선택하세요."
                                    data-column-index="9"
                                    name="dt_date" />
                                <input
                                    type="hidden"
                                    class="form-control dt-date start_date dt-input"
                                    data-column="10"
                                    data-column-index="9"
                                    name="value_from_start_date" />
                                <input
                                    type="hidden"
                                    class="form-control dt-date end_date dt-input"
                                    name="value_from_end_date"
                                    data-column="10"
                                    data-column-index="9" />
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
        <div class="card-datatable table-responsive rec">
            <table class="dt-advanced-search table border-top">
                <thead class="dt-complex-header table table-bordered">
                      <tr>
                        <th colspan="7" class="border-end text-center">발신내용</th>
                        <th colspan="3" class="text-center">수신내용</th>
                      </tr>
                    <tr>
                        <th></th>
                        <th>결재상태</th>
                        <th>서식명</th>
                        <th>문서제목</th>
                        <th>작성자</th>
                        <th>문서작성일</th>
                        <th class="border-end">결재완료일</th>
                        <th>수신상태</th>
                        <th>수신자</th>
                        <th>작업완료일</th>
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
<script defer src="${cPath}/resources/groupwareMember/assets/js/document-rec-list.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/emp-modal.js"></script>