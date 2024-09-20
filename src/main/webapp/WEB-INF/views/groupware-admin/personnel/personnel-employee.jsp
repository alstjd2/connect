<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

    <!-- Column Search -->
    <div class="card">
        <h5 class="card-header pb-0 d-flex justify-content-between border-bottom align-items-center pb-6">
            <b>직원관리</b>
            <div class="d-flex gap-5">
	            <a href="${cPath}/resources/커넥트-엑셀일괄업로드(양식).xlsx" download class="btn btn-label-secondary" >
	                <i class='bx bx-download pe-2'></i>
	                엑셀 양식 다운로드
	            </a>
	            <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#uploadExcelModal">
	                <i class='bx bx-upload pe-2' ></i>
	                엑셀 일괄 업로드
	            </a>
            </div>
        </h5>
        <div class="card-datatable text-nowrap">
            <table class="dt-column-search table table-bordered">
                <thead>
                    <tr>
                        <th>직원번호</th>
                        <th>직원명</th>
                        <th>소속조직</th>
                        <th>직책</th>
                        <th>직급</th>
                        <th>재직여부</th>
                    </tr>
                </thead>
                <tbody>
					<!-- AJAX로 채워질 부분(?) -->
                </tbody>
                <tfoot>
                    <tr>
                   		<th>직원번호</th>
                        <th>직원명</th>
                        <th>소속조직</th>
                        <th>직책</th>
                        <th>직급</th>
                        <th>재직여부</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <!-- 엑셀 파일 업로드 모달 -->
    <div class="modal fade" id="uploadExcelModal" tabindex="-1" aria-labelledby="uploadExcelModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadExcelModalLabel">엑셀 파일 업로드</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${cPath}/gw/adminEmployee/uploadEmployeeExcel" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="excelFile" class="form-label">엑셀 파일 선택</label>
                            <input type="file" class="form-control" id="excelFile" name="file" required>
                        </div>
                        <button type="submit" class="btn btn-primary">엑셀 업로드</button>
                    </form>
                </div>
            </div>
        </div>
    </div>





<!--     / Column Search -->

    <div class="modal fade" id="empDetail" tabindex="-1" aria-modal="true" role="dialog">
        <div class="modal-dialog modal-md modal-simple modal-enable-otp modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="text-center mb-6">
                        <h4 class="mb-2">직원 상세정보</h4>
                        <p> 직원의 상세정보 확인 및 수정 </p>
                    </div>

                    <input type="hidden" id="editEmpNo" value="">

                    <div class="d-flex justify-content-between align-items-center border-bottom py-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">이름(회사메일)</h6>
                        </div>
                        <p class="m-0 d-none d-sm-block" id="detailNameEmail"></p>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">부서 / 직급 / 직책</h6>
                        </div>
                        <p class="m-0 d-none d-sm-block" id="detailDepartmentPosition"></p>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">재직상태</h6>
                        </div>
                        <p class="m-0 d-none d-sm-block" id="detailStatus"></p>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">직원번호</h6>
                        </div>
                        <p class="m-0 d-none d-sm-block" id="detailEmpNo"></p>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">입사일</h6>
                        </div>
                        <div id="editEmpJoindateContainer">
					        <p class="m-0" id="viewEmpJoindate"></p>
					        <input type="date" class="form-control d-none" id="editEmpJoindate">
					    </div>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">개인 이메일</h6>
                        </div>
                        <div id="editEmpMailContainer">
                        	<p class="m-0" id="viewEmpMail"></p>
    						<input type="email" class="form-control d-none" id="editEmpMail">
                    	</div>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">휴대폰번호</h6>
                        </div>
                        <div id="editEmpTelContainer">
	                        <p class="m-0" id="viewEmpTel"></p>
	    					<input type="tel" class="form-control d-none" id="editEmpTel">
    					</div>
                    </div>
                    <div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4">
                        <div class="d-flex gap-4 align-items-center">
                        <h6 class="m-0">생일</h6>
                        </div>
                        <div id="editEmpBirContainer">
	                        <p class="m-0" id="viewEmpBir"></p>
	    					<input type="date" class="form-control d-none" id="editEmpBir">
    					</div>
                    </div>
                    <div class="d-flex justify-content-end gap-2">
	                    <button type="button" class="btn btn-secondary" id="editButton">수정</button>
	                    <button type="button" class="btn btn-primary" id="saveChangesButton" style="display: none;">저장</button>
	                </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Offcanvas to add new user -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser"  aria-labelledby="offcanvasAddUserLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasEmployeeFormLabel">직원 정보 입력</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <form action="${cPath}/gw/adminEmployee/register" method="post">
            	<input type="hidden" name="comNo" value="${comNo}" />
                <div class="mb-3">
                    <label for="empNm" class="form-label">직원명</label>
                    <input type="text" class="form-control" id="empNm" name="empNm" required>
                </div>

                <div class="mb-3">
                    <label for="empId" class="form-label">아이디</label>
                    <div class="input-group">
	                    <input type="text" class="form-control" id="empId" name="empId" readonly>
	                    <button class="btn btn-secondary" type="button" id="generateIdButton">아이디 생성</button>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="empPw2">비밀번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="empPw2" name="empPw" readonly>
                        <button class="btn btn-secondary" type="button" id="generatePasswordButton">비밀번호 생성</button>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="orgDep" class="form-label">부서</label>
                    <select class="form-select" id="orgDep" name="empDep" required>
                        <option value="" disabled selected>부서 선택</option>
                        <c:forEach var="dept" items="${departments}">
				            <option value="${dept.orgNo}">${dept.orgDep}</option>
				        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="empOneposName" class="form-label">직책</label>
                    <select class="form-select" id="empOneposName" name="empOnepos" required>
                        <option value="" disabled selected>직책 선택</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="empPosName" class="form-label">직급</label>
                    <select class="form-select" id="empPosName" name="empPos" required>
                        <option value="" disabled selected>직급 선택</option>
                    </select>
                </div>


                <div class="mb-3">
                	<label for="empGender" class="form-label">성별</label>

					<select class="form-select" id="empGender" name="empGender" required>
						<option value="" disabled selected>성별 선택</option>
						<option value="M">남성</option>
    					<option value="F">여성</option>
					</select>
                </div>

                <div class="mb-3">
                    <label for="empBir" class="form-label">생일</label>
                    <input type="date" class="form-control" id="empBir" name="empBir" required>
                </div>

                <div class="mb-3">
                    <label for="empJoindate" class="form-label">입사일</label>
                    <input type="date" class="form-control" id="empJoindate" name="empJoindate" required>
                </div>

                <div class="mb-3">
                    <label for="empCommail" class="form-label">회사 메일</label>
                    <input type="email" class="form-control" id="empCommail" name="empCommail disabled" required readonly disabled >
                </div>

                <div class="mb-3">
                    <label for="empMail" class="form-label">개인 메일</label>
                    <input type="email" class="form-control" id="empMail" name="empMail" required>
                </div>

                <div class="mb-3">
                    <label for="empTel" class="form-label">휴대폰 번호</label>
                    <input type="tel" class="form-control" id="empTel" name="empTel" required>
                </div>

                <div class="mb-3">
	                <label for="empYear" class="form-label">근무 연수</label>
	                <input type="number" class="form-control" id="empYear" name="empYear" min="0" required>
	            </div>




                <div class="mb-3">
                    <label for="empState" class="form-label">재직 상태</label>
                    <select class="form-select" id="empState" name="empState" required>
						<option value="" disabled selected>재직상태 선택</option>
						<option value="재직중">재직중</option>
        				<option value="휴직">휴직</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">저장</button>
            </form>
        </div>
    </div>
    <!-- / Offcanvas to add new user -->

</div>

<script defer src="${cPath}/resources/groupwareAdmin/assets/js/personnel-employee.js"></script>







