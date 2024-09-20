<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <div class="col-lg-4 col-12 position-lg-sticky">
            <div class="card mb-6">
                <h4 class="card-header fw-bold pb-2">
                    <span class="card-title fw-bold text-primary mb-3">조직 관리</span>
                    <p class="fs-6 fw-medium mb-0 pt-1 pb-2" style="line-height: 1.2em; margin-top: 20px;">* 마우스 오른쪽 버튼을
                        클릭하여 조직을
                        추가 / 수정 / 삭제할 수 있습니다. (전체조직 삭제 제한) </p>
                    <p class="fs-6 fw-medium mb-0 pb-8" style="line-height: 1.2em;  margin-top: 10px;">* 조직을 드래그하여 위치를 변경할 수 있습니다.
                    (같은 급의 조직끼리 위치 변경)
                    </p>
                </h4>
                <div class="card-body">
                    <div id="organization" class="overflow-auto p-3 border"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-12 text-center">
            <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="fw-bold text-primary mb-3" style="font-size: 1.46rem; margin-top: 1.5px;">인사발령</h5>
                    <div class="dropdown">
                        <button class="btn text-muted p-0" type="button" id="teamMemberList"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bx bx-dots-vertical-rounded bx-lg"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="teamMemberList">
                            <a class="dropdown-item" href="javascript:void(0);"><i
                                    class='bx bx-download'></i> EXCEL</a>
                        </div>
                    </div>

                </div>
                <div class="table-responsive">
                    <div class="d-flex mb-6 mx-8">
                        <form action="${pageContext.request.contextPath}/gw/organization/adminOrganization.do" method="get" class="d-flex">
                            <div class="input-group input-group-merge p-0 m-0 me-2">
                                <span class="input-group-text" id="basic-addon-search31"><i
                                        class="bx bx-search"></i></span>
                                <input type="text" class="form-control" name="searchName" placeholder="직원명"
                                    aria-label="직원명" aria-describedby="basic-addon-search31"
                                    value="${param.searchName}">
                            </div>
                            <input type="date" class="form-control me-2" name="searchDate" placeholder="0000-00-00"
                                aria-label="0000-00-00" value="${param.searchDate}"
                                aria-describedby="basic-addon-search32" id="input-date">
                            <button type="submit" class="btn btn-dark">검색</button>
                        </form>
                        <a href="javascript:;" class="btn btn-primary ms-auto" role="button" data-bs-toggle="modal" data-bs-target="#addPerson">
                            <i class='bx bxs-user-account pe-2'></i>
                            발령추가
                        </a>
                    </div>
                    <table class="table table-borderless table-sm dt-appointment-table">
                        <thead>
                            <tr class="border-bottom border-top">
                                <th class="ps-6">직원이름</th>
                                <th>소속조직</th>
                                <th>직급</th>
                                <th>직책</th>
                                <th>발령구분</th>
                                <th>발령일</th>
                                <th class="pe-6">등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="appointment" items="${appointments}">
                                <tr>
                                    <td>
	                                    <a href="javascript:void(0);"
								           class="employee-name"
						                   data-bs-toggle="modal"
						                   data-bs-target="#employeeDetailsModal"
						                   data-apmNo="${appointment.apmNo}">
						                    ${appointment.employeeName}
                                   		</a>
                                    </td>
                                    <td>${appointment.departmentName}</td>
                                    <td>${appointment.positionName}</td>
                					<td>${appointment.onePositionName}</td>
                                    <td>${appointment.apmTypeName}</td>
                                    <td>${appointment.apmDate}</td>
                                    <td>${appointment.apmEndate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation">
    					<ul class="pagination pagination-rounded justify-content-center py-10">
       					 	<li class="page-item first ${currentPage == 1 ? 'disabled' : ''}">
            					<a class="page-link" href="?page=1&searchName=${param.searchName}&searchDate=${param.searchDate}"><i class="tf-icon bx bx-chevrons-left bx-sm"></i></a>
        					</li>
        					<li class="page-item prev ${currentPage == 1 ? 'disabled' : ''}">
            					<a class="page-link" href="?page=${currentPage - 1}&searchName=${param.searchName}&searchDate=${param.searchDate}"><i class="tf-icon bx bx-chevron-left bx-sm"></i></a>
        					</li>

        					<c:forEach var="i" begin="1" end="${totalPages}">
            					<li class="page-item ${i == currentPage ? 'active' : ''}">
                					<a class="page-link" href="?page=${i}&searchName=${param.searchName}&searchDate=${param.searchDate}">${i}</a>
            					</li>
        					</c:forEach>

        					<li class="page-item next ${currentPage == totalPages ? 'disabled' : ''}">
            					<a class="page-link" href="?page=${currentPage + 1}&searchName=${param.searchName}&searchDate=${param.searchDate}"><i class="tf-icon bx bx-chevron-right bx-sm"></i></a>
        					</li>
        					<li class="page-item last ${currentPage == totalPages ? 'disabled' : ''}">
            					<a class="page-link" href="?page=${totalPages}&searchName=${param.searchName}&searchDate=${param.searchDate}"><i class="tf-icon bx bx-chevrons-right bx-sm"></i></a>
        					</li>
    					</ul>
					</nav>
                </div>
            </div>

            <div class="modal fade text-start" id="employeeDetailsModal" tabindex="-1" style="display: none;"
                aria-hidden="true">
                <div class="modal-dialog modal-md modal-simple modal-pricing">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            <div class="text-center mb-6">
                                <h4 class="mb-2">인사 발령 내용</h4>
                                <p id="modalApmContent" />
                            </div>

                            <div
                                class="d-flex justify-content-between align-items-center border-bottom py-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">대상자</h6>
                                </div>
                                <p id="modalEmployeeName" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                                class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">소속조직</h6>
                                </div>
                                <p id="modalDepartmentName" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                                class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">직급</h6>
                                </div>
                                <p id="modalPositionName" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                                class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">직책</h6>
                                </div>
                                <p id="modalOnePositionName" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                                class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">발령구분</h6>
                                </div>
                                <p id="modalApmType" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                            	class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
			                    <div class="d-flex gap-4 align-items-center">
			                        <h6 class="m-0">재직상태</h6>
			                    </div>
			                    <p id="modalEmpState" class="m-0 d-none d-sm-block"></p>
			                </div>
                            <div
                                class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                                <div class="d-flex gap-4 align-items-center">
                                    <h6 class="m-0">발령일</h6>
                                </div>
                                <p id="modalApmDate" class="m-0 d-none d-sm-block"></p>
                            </div>
                            <div
                            	class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
			                    <div class="d-flex gap-4 align-items-center">
			                        <h6 class="m-0">등록일</h6>
			                    </div>
			                    <p id="modalApmEndate" class="m-0 d-none d-sm-block"></p>
			                </div>




                        </div>
                        <!--/ Pricing Plans -->
                    </div>
                </div>
            </div>

            <!-- 인사발령 추가 모달 -->
            <div class="modal fade text-start" id="addPerson" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-simple modal-enable-otp modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <div class="text-center">
                                <h4 class="mb-2">인사발령 추가</h4>
                                <p>인사 발령을 진행할 수 있습니다.</p>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/gw/organization/adminOrganization.do" method="post">
                            <div class="mb-6 mx-4 mx-md-0 px-md-6">
                                <label for="selectEmployee" class="form-label">대상자</label>
                                <select id="selectEmployee" class="form-select form-select-lg" name="empNo" required>
                                	<option value="" disabled selected>대상자를 선택하세요</option>
                                    <c:forEach var="employee" items="${employees}">
			                            <option value="${employee.empNo}">
			                            	${employee.empNm} / ${employee.empDepName}, ${employee.empPosName}
			                            </option>
			                        </c:forEach>
                                </select>
                            </div>
                            	<div class="row mb-6 mx-0 mx-md-0 px-md-6">
									<label class="form-label p-0" for="apmTypeSelect">발령종류</label>
									<select name="apmType" class="form-select form-select-lg" id="apmTypeSelect" required>
										<option value="" disabled selected>발령종류를 선택하세요</option>
								    	<c:forEach var="type" items="${apmTypes}">
								        	<option value="${type.conmcdNo}">${type.conmcdCode}</option>
								    	</c:forEach>
								    </select>
								</div>

								<!-- 부서 선택 박스, 기본적으로 숨김 처리 -->
							    <div class="row mb-6 mx-0 mx-md-0 px-md-6" id="orgDepSelectContainer" style="display:none;">
							        <label class="form-label p-0" for="orgDepSelect">이동할 조직</label>
							        <select name="newOrgDep" class="form-select form-select-lg" id="orgDepSelect">
							            <option value="" disabled selected>조직을 선택하세요</option>
							            <c:forEach var="org" items="${orgDepList}">
							                <option value="${org.orgNo}">${org.orgDep}</option>
							            </c:forEach>
							        </select>
							    </div>

                                    <div class="mb-6 mx-4 mx-md-0 px-md-6">
                                            <label for="apmDate" class="form-label">발령일자</label>
                                                <input class="form-control" type="date" id="apmDate" name="apmDate" required>
                					</div>
                					 <div class="mb-6 mx-4 mx-md-0 px-md-6">
					                    <label for="apmContent" class="form-label">발령내용</label>
					                    <textarea class="form-control" id="apmContent" name="apmContent" placeholder="내용 입력" required></textarea>
					                 </div>
					                 <div class="mb-6 mt-10 text-center">
					                    <button type="submit" class="btn btn-primary">
					                        <i class='bx bx-send bx-sm me-2'></i>
					                        발령처리
					                    </button>
					                 </div>
							    </form>
							</div>
						</div>
					</div>
            <!--/ Share Project Modal -->


            <!-- 조직도 트리 입력 모달창 -->
            <div class="modal fade text-start" id="nodeModal" tabindex="-1" aria-labelledby="nodeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="nodeModalLabel">조직관리</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="nodeForm">
                                <div class="form-group" style="margin-bottom: 20px;">
                                    <label for="nodeText">조직이름</label>
                                    <input type="text" class="form-control" id="nodeText" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px;">
                                    <label for="nodeRepresentative">조직대표</label>
                                    <select class="form-select text-capitalize select2" id="nodeRepresentative">
                                    	<option></option>
										<c:forEach var="employee" items="${employees}">
        									<option value="${employee.empNo}">
        										<c:if test="${employee.empNo == selectedRepresentativeId}">selected</c:if>
        										${employee.empNm} / ${employee.empDepName}, ${employee.empPosName}
        									</option>
    									</c:forEach>
                                  	</select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="autoInput" class="btn btn-secondary">자동입력</button>
                            <button type="button" id="saveNode" class="btn btn-primary">저장하기</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>








<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/organization-treeview.js"></script>
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/appointment-modal.js"></script>
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/forms-selects.js"></script>




