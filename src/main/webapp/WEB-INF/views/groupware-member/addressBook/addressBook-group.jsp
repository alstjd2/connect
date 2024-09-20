<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="app-addr card" id="app-addr">
                        <div class="row g-0">
                            <!-- Email Sidebar -->
                            <div class="col app-addr-sidebar border-end flex-grow-0" id="app-addr-sidebar">
                                <div class="btn-compost-wrapper d-grid">
                                    <h5 class="fw-bold mb-0 text-primary">
                                        <i class="menu-icon tf-icons bx bxs-user-detail"></i>
                                        주소록
                                    </h5>
                                </div>
                                <!-- addr Filters -->
                                <div class="addr-filters pt-4 pb-2 overscoll">
                                    <ul class="addr-filter-folders list-unstyled">
                                        <li class=" d-flex mb-1" >
                                            <a href="${cPath}/gw/address/orgaddressList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bx-buildings'></i>
                                                <span class="align-middle ms-2">조직도</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-1">
                                        	<div id="organization" class="overflow-auto p-1"></div>
                                        </li>
                                        <li class="active d-flex mb-1" >
                                            <a href="${cPath}/gw/address/addressgroupList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bxs-group'></i>
                                                <span class="align-middle ms-2">그룹</span>
                                            </a>
                                        </li>
                                        <li class=" d-flex justify-content-between mb-1" >
                                            <a href="${cPath}/gw/address/addressBookMarkList.do" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-star"></i>
                                                <span class="align-middle ms-2">즐겨찾기</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-1">
                                            <a href="${cPath}/gw/address/addressList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bxs-user-pin'></i>
                                                <span class="align-middle ms-2">외부연락처</span>
                                            </a>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <a href="${cPath}/gw/address/trashList.do" class="d-flex flex-wrap align-items-center">
                                                <i class="bx bx-trash"></i>
                                                <span class="align-middle ms-2">휴지통</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--/ addr Sidebar -->
        
                            <!-- addr List -->
                            <div class="col app-emails-list"  id="employee-list-container">
                                <div class="card shadow-none border-0 rounded-0">
                                    <div class="card-body emails-list-header p-3 py-2">
                                        <!-- Email List: Search -->
                                        <div class="d-flex justify-content-between align-items-center px-3 mt-2">
                                            <div class="d-flex align-items-center w-100">
                                                <i class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4 " data-bs-toggle="sidebar" data-target="#app-addr-sidebar" data-overlay></i>
                                                <div class="w-100">
                                                    <div class="input-group input-group-merge shadow-none">
                                                        <span class="input-group-text border-0 p-0 pe-4" id="addr-search">
                                                            <i class="bx bx-search bx-md text-body"></i>
                                                        </span>
                                                        <!-- Search Form -->
														<div id="searchUI">
															<!-- Hidden select input -->
															<form:select path="condition.searchType"
																style="display:none;">
																<option value="" label="전체" />
																<option value="name" label="이름" />
															</form:select>
				
															<form:input type="text"
																class="form-control addr-search-input border-0 py-0"
																placeholder="그룹이름을 검색하세요." aria-label="그룹명을 검색하세요."
																path="condition.searchWord" />
														</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="mx-n3 emails-list-header-hr mb-2" />
                                        <!-- arrd List: Actions -->
                                        <div class="d-flex justify-content-between align-items-center ps-1">
                                            <div class="d-flex align-items-center">
                                                <div class="btn btn-icon me-1" data-bs-toggle="modal" data-bs-target="#modalCenter">
                                                    <i class='bx bx-user-plus bx-md email-list-delete cursor-pointer'></i>
                                                </div>
                                                <!-- Modal -->
                                                <div class="modal fade" id="modalCenter" tabindex="-1" style="display: none;" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="modalCenterTitle">그룹추가</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <form id="modalForm" action="${cPath}/gw/address/addressGroupInsert.do" method="post">
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="col mb-6">
                                                                        <label for="grpNm" class="form-label">그룹명</label>
                                                                        <input type="text" id="grpNm" name="grpNm" class="form-control" maxlength="16" placeholder="그룹명을 입력해주세요">
                                                                    </div>
                                                                </div>
                                                                <div class="row ">
                                                                    <div class="col mb-6">
                                                                        <label for="grpCm" class="form-label">그룹소개</label>
                                                                        <input type="text" id="grpCm" name="grpCm" class="form-control" maxlength="150" placeholder="그룹에 대해 소개해주세요">
                                                                    </div>
                                                                </div>
                                                                <div class="row ">
                                                                    <div class="col mb-0">
                                                                        <label for="TagifyUserList" class="form-label">멤버 선택</label>
                                                                        <input id="TagifyUserList" name="TagifyUserList" class="form-control" value = ""  />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                            	<button type="button"class="btn btn-label-primary" id="dataBtn">자동입력</button>
                                                                <button type="button" class="btn btn-primary">추가</button>
                                                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                                                                    취소
                                                                </button>
                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <span class="btn btn-icon me-1">
                                                    <i class="bx bx-refresh bx-md scaleX-n1-rtl cursor-pointer addr-refresh"></i>
                                                </span>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="container-m-nx m-0" />
                                    <!-- arrd List: Items -->
                                    <div class="addr-list pt-0" id="content-area">
                                        <div class="table-responsive text-nowrap ">
                                            <table class="table card-table">
                                                <thead>
                                                    <tr>
                                                        <th class="border-top-0">번호</th>
                                                        <th class="border-top-0">그룹명</th>
                                                        <th class="border-top-0">멤버수</th>
                                                        <th class="border-top-0">그룹생성일</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-border-bottom-0">
                                                	<c:choose>
														<c:when test="${not empty groupList}">
															<c:forEach items="${groupList}" var="group">
																<tr>
																	<td>${group.rnum}</td>
																	<input type="hidden" name="grpNo" value="${group.grpNo}" />
																	<td>
			                                                            <div class="d-flex justify-content-start align-items-center user-name emp-info" data-grp-no="${group.grpNo}">
			                                                                <div class="d-flex flex-column" data-grp-no="${group.grpNo}">
			                                                                	<span class="emp_name text-truncate">${group.grpNm}</span>
			                                                                    <small class="emp_post text-truncate text-muted">
			                                                                        ${group.grpCm}
			                                                                    </small>
			                                                                </div>
			                                                            </div>
			                                                        </td>
			                                                        <td>
			                                                            <b><i class='bx bx-group'></i></b>
			                                                            <b>${group.empcount}</b>
			                                                        </td>
			                                                        <td>
			                                                            ${group.grpDate}
			                                                        </td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td colspan="6">소속된 그룹이 없습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                            <nav aria-label="Page navigation text-center">
                                                <ul class="pagination pagination-rounded justify-content-center pt-7">
				                                   <div class="paging-area">${pagingHTML}</div>
				                               </ul>
                                            </nav>
                                    
                                    
                                    </div>
                                </div>
                                <form:form id="searchform" method="get" modelAttribute="condition">
									<form:hidden path="searchType" />
									<form:hidden path="searchWord" />
									<input type="hidden" name="page" />
								</form:form>
                                
                                
                                <div class="app-overlay"></div>
                                <!-- Toast Container -->
					               <div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed p-3 d-flex gap-3 flex-wrap" style="top: 80px; right: 20px;
					    				z-index: 10000; width: 350px;">
					                   <!-- Toast Template -->
					                   <div id="toast-template" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
					                       <div class="toast-header">
					                           <i class="bx bx-bell me-2"></i>
					                           <div class="me-auto fw-medium">알림</div>
					                           <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
					                       </div>
					                       <div class="toast-body">
					                           메시지 내용
					                       </div>
					                   </div>
					               </div>
                            </div>
                            <!-- /addr List -->
                            <!-- detail.jsp -->
							<div class="col app-addr-sidebar-right app-sidebar "
								id="app-addr-sidebar-right"></div>
        
                        </div>
                    </div>
                </div>

<!-- Page JS -->

<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/groupInsert.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/groupempList.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/addressBook-group.js"></script>
<%-- <script defer src="${cPath}/resources/groupwareMember/assets/js/organization-ui-treeview.js"></script> --%>
<script defer src="${cPath}/resources/groupwareMember/assets/js/organization-ui-treeview2.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/groupdetail.js"></script>
	
<script type="text/javascript">
var tagify;

document.addEventListener('DOMContentLoaded', function () {
    var input = document.querySelector('#TagifyUserList');
    if (input) {
        tagify = new Tagify(input);

        // AJAX 요청을 통해 사용자 목록 로드
        fetch('jsongroupemployee.do')
            .then(response => response.json())
            .then(data => {
                if (data && Array.isArray(data)) {
                    tagify.addTags(data.map(user => ({ value: user.id, text: user.name })));
                }
            });
    } else {
        console.error('Tagify input element not found.');
    }
});


</script>
