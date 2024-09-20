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
                                    
                                        <li class="active d-flex mb-1" >
                                            <a href="${cPath}/gw/address/orgaddressList.do" class="d-flex flex-wrap align-items-center">
                                                <i class='bx bx-buildings'></i>
                                                <span class="align-middle ms-2">조직도</span>
                                            </a>
                                        </li>
                                        <li class="d-flex justify-content-between align-items-center mb-1">
                                        	<div id="organization" class="overflow-auto p-1"></div>
                                        </li>
                                        
                                        <li class="d-flex mb-1" >
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
            <div class="col app-emails-list" id="employee-list-container">
                <div class="card shadow-none border-0 rounded-0">
                    <div class="card-body emails-list-header p-3 py-2">
                        <!-- Email List: Search -->
                        <div class="d-flex justify-content-between align-items-center px-3 mt-2" >
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
												placeholder="직원이름을 검색하세요." aria-label="직원이름을 검색하세요."
												path="condition.searchWord" />
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="mx-n3 emails-list-header-hr mb-2" />
                        <!-- arrd List: Actions -->
                        <div class="d-flex justify-content-end align-items-center ps-1">
                        
                            <div class="d-flex align-items-center">
                                <span class="btn btn-icon me-1">
                                <i class="bx bx-refresh bx-md scaleX-n1-rtl cursor-pointer addr-refresh"></i>
                                </span>
                                
                            </div>
                        </div>
                    </div>
                    <hr class="container-m-nx m-0" />
                    <!-- arrd List: Items -->
                    <div class="addr-list pt-0 " id="content-area">
                        <div class="table-responsive text-nowrap " >
                            <table class="table card-table">
                                <thead>
                                    <tr>
                                    	<th class="border-top-0">번호</th>
                                       <th class="border-top-0">즐겨찾기</th>
                                       <th class="border-top-0">이름</th>
                                       <th class="border-top-0">부서(조직)</th>
                                       <th class="border-top-0">직급/직책</th>
                                       <th class="border-top-0">연락처</th>
                                       <th class="border-top-0">이메일</th>
                                    </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                   <c:choose>
										<c:when test="${not empty employeeList}">
											<c:forEach items="${employeeList}" var="employee">
												<tr>
													<td>${employee.rnum}</td>
													
													<c:forEach items="${employee.bookMarkList}" var="bookmark">
													<td>
							                            <form>
							                                <label for="bookmark-${bookmark.markNo}" class="btn btn-icon rounded-pill btn-outline-warning">
							                                    <input type="hidden" name="bookmark" class="bookmark-checkbox" data-emp-no="${employee.empNo}"data-mark-no="${bookmark.markNo}" />
							                                    <input type="hidden" name="empNo" data-emp-no="${employee.empNo}" />
							                                    <c:choose>
							                                        <c:when test="${not empty bookmark.markNo}">
							                                            <i class='bx bxs-star' data-mark-no="${bookmark.markNo}" data-emp-no="${employee.empNo}" onclick="toggleBookmark(this)"></i>
							                                        </c:when>
							                                        <c:otherwise>
							                                            <i class='bx bx-star' data-mark-no="${bookmark.markNo}" data-emp-no="${employee.empNo}" onclick="toggleBookmark(this)"></i>
							                                        </c:otherwise>
							                                    </c:choose>
							                                </label>
							                            </form>
							                            </td>
							                        </c:forEach>
														<td>
														    <div class="d-flex justify-content-start align-items-center user-name">
														        <c:choose>
														            <c:when test="${not empty employee.empProfile}">
														                <!-- 프로필 사진이 있을 경우 -->
														                <div class="avatar-wrapper emp-info" data-emp-no="${employee.empNo}" data-target='#app-addr-contacts'>
														                    <div class="avatar me-2">
														                            <c:url value='/files/${employee.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
																					
														                        <img src="${fileUrl }"
														                            class="d-block w-px-32 h-px-32 rounded-circle"
														                            id="uploadedAvatar"
														                            alt="프로필 사진"
														                        />
														                    </div>
														                </div>
														            </c:when>
														            <c:otherwise>
														                <!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
														                <div class="avatar-wrapper emp-info" data-emp-no="${employee.empNo}" data-target='#app-addr-contacts'>
														                    <div class="avatar me-2">
														                        <span class="avatar-initial rounded-circle"></span>
														                    </div>
														                </div>
														            </c:otherwise>
														        </c:choose>
														        
														        <div class="d-flex flex-column">
														            <span class="emp_name text-truncate">${employee.empNm}</span>
														            <small class="emp_post text-truncate text-muted">
<!-- 														                <span class="badge bg-label-primary me-1">근무중</span> -->
														                <span class="badge bg-label-primary me-1">${employee.empState}</span>
														            </small>
														        </div>
														    </div>
														</td>
														

													<td><c:forEach var="organization"
															items="${employee.company.organizationList}">
									                    ${organization.orgDep}<br />
														</c:forEach></td>
													<td><c:forEach var="position"
															items="${employee.company.positionList}">
									                    ${position.posNm} / 
									                    ${position.ONEPOSNM}
									                	</c:forEach></td>
													<td>${employee.empTel}</td>
													<td>${employee.empMail}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">등록된 구성원이 없습니다.</td>
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
    				z-index: 10000; width: 350px; ">
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
<script type="text/javascript">
    var baseUrl = '<c:url value="/" />';
</script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
    	var colorClasses = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
        // 모든 avatar-initial 요소를 선택합니다.
        document.querySelectorAll('.avatar-initial').forEach(function(element) {
            // 현재 row에서 emp_name을 찾습니다.
            var empNameElement = element.closest('tr').querySelector('.emp_name');
            if (empNameElement) {
                var empName = empNameElement.textContent.trim();
                console.log('Employee Name:', empName); // 디버깅용 로그
                if (empName) {
                	
                    // 첫 글자를 추출하고, 요소에 설정합니다.
                    var firstLetter = empName.charAt(0);
                    element.textContent = firstLetter;
                    console.log('First Letter Set:', firstLetter); // 디버깅용 로그
                } else {
                    console.log('Employee Name is empty');
                }
            } else {
                console.log('emp_name element not found');
            }
            var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
            element.classList.add('bg-label-' + randomColorClass);
        });
    });
</script>

<script defer src="${cPath}/resources/groupwareMember/assets/js/organization-ui-treeview2.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/paging.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/utils/fetchUtils.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/bookmarkList.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/hjadr/orgdetail.js"></script>