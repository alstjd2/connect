<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="py-4 mb-6 d-flex justify-content-between align-items-cente">
		<h3 class="fw-bold mb-0">회원관리</h3>
	</div>
	<div class="card">
	    <div class="card-header">
	        <div id="searchUI" class="d-flex flex-row bd-highlight"> 
				<div class="p-2 bd-highlight">
					<form:select class="form-select" aria-label="Small select example" path="condition.searchType">
						<form:option value="" label="전체"/>
						<form:option value="name" label="이름"/>
					</form:select>
				</div>
				<div class="p-2 bd-highlight">
					<form:input class="input-select border h-100 rounded px-2" path="condition.searchWord"/> 
				</div>
				<div class="p-2 bd-highlight">
					<button class="btn btn-info" id="searchBtn">검색</button>
				</div>
			</div> 
	    </div>
	    <div class="card-datatable table-responsive pb-0">
	        <table class="datatables-users table border-top" id="dataListTable" data-cpath="${cPath }" > 
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>고객명</th> 
	                    <th></th>
	                    <th>기업(단체)명</th>
	                    <th>가입일자</th>
	                    <th>구매상태</th>
	                    <th>비고</th>
	                </tr>
	            </thead>
	            <tbody id="list-body" >
	            
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" class="border-bottom-0 pb-0">
							<div class="paging-area"></div>
						</td>
					</tr>
				</tfoot>
	        </table>
	    </div>
	        <form:form id="searchform" method="get" modelAttribute="condition">
				<form:input type="hidden" path="searchType"/>
				<form:input type="hidden" path="searchWord"/>
				<input type="hidden" name="page" />
			</form:form>
			
		<div class="offcanvas offcanvas-start" tabindex="-1" id="companyDetail" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
			  <h5 class="offcanvas-title" id="offcanvasExampleLabel">기업(단체) 정보</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body"></div>
	    </div>
	    
	
	</div>
</div>


<!-- Vendors JS -->
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/moment/moment.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/select2/select2.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/@form-validation/popular.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/@form-validation/bootstrap5.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/@form-validation/auto-focus.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/cleavejs/cleave.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/cleavejs/cleave-phone.js"></script>

<script type="text/javascript" src="${cPath }/resources/js/app/jhjTa/web/membershipList.js"></script>
