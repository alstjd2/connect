<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="${pageContext.request.contextPath }" scope="application"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>

<!doctype html>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>

<html 
	lang="ko" 
	<c:choose>
		<c:when test="${not empty company.comOg and company.comOg eq 1}">
			class="light-style layout-menu-fixed layout-compact"
			data-template="horizontal-menu-template-no-customizer-starter"
		</c:when>
		<c:otherwise>
			class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" 
			data-template="vertical-menu-template-starter"
		</c:otherwise>
	</c:choose>
	dir="ltr"
    data-theme="theme-default" 
    data-assets-path="${cPath}/resources/groupwareMember/assets/" 
    data-style="light"
    data-themes="${company.comWlogo}"
    >

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>${company.comNm}</title>
    <meta name="description" content="dcmDetail" />

    <tiles:insertAttribute name="preScript"/>
    <tiles:insertAttribute name="customCss"/>
</head>

<body data-context-path="${cPath}" 
	<c:if test="${not empty company.comOg and company.comOg eq 1}">
		class="py-10 mt-10"
	</c:if>
>

    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <!-- Layout wrapper -->
	<c:choose>
		<c:when test="${not empty company.comOg and company.comOg eq 1}">
			<div class='layout-wrapper layout-navbar-full layout-horizontal layout-without-menu '>
		</c:when>
		<c:otherwise>
			<div class='layout-wrapper layout-content-navbar'>
		</c:otherwise>
	</c:choose>
        <div class="layout-container">
        
    		<tiles:insertAttribute name="sidebar"/>

            <div class="layout-page ">
                <tiles:insertAttribute name="header"/>

                <div class="container-xxl flex-grow-1 container-p-y dcmPage">
               		<div class="mb-10 mt-5 d-flex justify-content-between">
               			<a href="${cPath}/gw/document/insert.do" class="btn rounded-pill btn-label-primary">
                          <span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>문서 서식 선택
                        </a>
                        <button type="button" class="btn rounded-pill btn-secondary" id="autoInput">자동입력</button>
               		</div>
               		<form:form modelAttribute="dcmDetail" id="dcmInsertForm" action="" enctype="multipart/form-data">
                  	   <form:hidden path="pmtDcm.comNo" value="${company.comNo}" />
                  	   <form:hidden path="pmtDcm.pmtDcmStaNo" value="DB01130" />
                  	   <form:hidden path="pmtDcm.pmtDcmEmpno" value="${employee.empNo}" />
                  	   <form:hidden path="pmtDcm.pmtDcmEmpnm" value="${employee.empNm}" />
                  	   <form:hidden path="pmtDcm.dcmFormCode" value="${comForm.dcmFormCode}" />
                  	   <form:hidden path="pmtDcm.pmtDcmEmpdep" value="${employee.company.organizationList[0].orgDep}" />
                  	   <form:hidden path="pmtDcm.pmtDcmEmponepos" value="${employee.company.positionList[0].posNm}" />
                  	   <form:hidden path="pmtDcm.pmtDcmTepSaveYn" value="N" />
                      <div class="row invoice-preview">
                          <!-- Invoice -->
                          <div class="col-xl-9 col-md-8 col-12 mb-md-0 mb-6">
                              <div class="card invoice-preview-card p-sm-12 p-6">
					               	<table class="w-100 table">
									    <tbody>
									        <tr><th>*제 목</th>
									        	<td colspan="6">
									        		<form:input id="title" path="pmtDcm.pmtDcmTitle" cssClass="form-control bg-white" type="text" placeholder="문서의 제목을 입력해주세요." required="required"/>
									        		<form:errors path="pmtDcm.pmtDcmTitle" cssClass="text-danger form-text text-end" element="span" />
									        	</td>
									        </tr>
				               			</tbody>
								    </table>
					               <div class="card-body px-0 py-1">
					                   <table class="w-100 table">
					                       <tbody class="border-top">
					                           <tr class="border-bottom py-3">
					                               <th class="px-4 w-120p">문서번호</th> <td style="color:#bbb" >문서기안 후 자동생성</td>
					                               <th class="px-4 w-120p">기 안 자</th> <td>${employee.empNm}</td>
					                           </tr>
					                           <tr class="border-bottom py-3">
					                               <th class="px-4 w-120p">기안서식</th> <td>${comForm.dcmFormNm}</td>
					                               <th class="px-4 w-120p">소속/직책</th>
					                               <td >${employee.company.organizationList[0].orgDep}/${employee.company.positionList[0].posNm}</td>
					                           </tr>
					                       </tbody>
					                   </table>
					               </div>
					               <div id="content" class="mb-10">
	              						<tiles:insertAttribute name="contentPage" />
	              				   </div>
              					   <form:textarea path="pmtDcm.pmtDcmContent" id="htmlContent" style="display:none;"></form:textarea>
					                <div class="col mb-3">
			                          	<label for="select-dcm" class="h6 mb-1">관련문서 선택</label>
			                          	<form:select path="pmtDcm.pmtRetDcmNo" id="select-dcm" class="select2 select2-dcm form-select form-select-lg" data-allow-clear="true">
			                          		<form:option value="">관련 문서 선택</form:option>
			                          		<c:forEach items="${relatedDcmList}" var="relatedDcm">
			                          			<form:option value="${relatedDcm.pmtDcmNo}">${relatedDcm.pmtDcmEmpnm}  |  ${relatedDcm.pmtDcmSaveDate}  |  ${relatedDcm.pmtDcmTitle}</form:option>
			                          		</c:forEach>
				                        </form:select>
				                     </div>
  			                     	<c:if test="${comForm.dcmFormFilesYn eq 'Y'}">
						                <div class="col mb-5">
						                	<div class="d-flex align-items-center justify-content-between pb-3">
						                        <p class="h6 mb-1">첨부파일</p>
												<button type="button" id="addAtchBtn" class="btn btn-outline-primary btn-sm">
					                              <span class="tf-icons bx bx-plus bx-18px me-2 "></span> 첨부 파일 추가
					                            </button>
						                	</div>
						                	<div class="d-flex flex-wrap gap-3">						                	
												<form:input type="file" path="atchFile.fileDetails[0].uploadFile" id="atch1" cssClass="form-control"/>
												<form:input type="file" path="atchFile.fileDetails[1].uploadFile" id="atch2" cssClass="form-control" cssStyle="display:none"/>
												<form:input type="file" path="atchFile.fileDetails[2].uploadFile" id="atch3" cssClass="form-control" cssStyle="display:none"/>
												<form:input type="file" path="atchFile.fileDetails[3].uploadFile" id="atch4" cssClass="form-control" cssStyle="display:none"/>
												<form:input type="file" path="atchFile.fileDetails[4].uploadFile" id="atch5" cssClass="form-control" cssStyle="display:none"/>
						                	</div>
					                    </div>
			                     	</c:if>  
                                  	<div class="table-responsive">
	                                    <table class="table m-0 table-borderless">
	                                        <tbody>
		                                          <tr>
		                                              <td class="align-top pe-6 ps-0 py-6 text-body">
		                                                  <p class=" p-0 m-0">위와 같이 문서를 기안합니다.</p>
		                                              </td>
		                                              <td class="px-0 py-6 w-px-100">
		                                                  <p class="mb-2">기안일 :</p>
		                                                  <p class="mb-2">기안자 :</p>
		                                              </td>
		                                              <td class="text-end ps-0 py-6 w-px-120 fw-medium text-heading">
		                                                  <p class="fw-medium mb-2">
		                                                  	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
		                                                  </p>
		                                                  <p class="fw-medium mb-2">
		                                                      ${employee.empNm} 
		                                                      <span class="stamp">
		                                                          (인)
		                                                      </span>
		                                                  </p>
		                                              </td>
		                                          </tr>
	                                        </tbody>
	                                    </table>
                                  	</div>
		                                  
	                                  <div class="card-body invoice-preview-header rounded">
	                                      <div class="d-flex justify-content-between flex-xl-row flex-md-column flex-sm-row flex-column align-items-xl-start align-items-md-start align-items-sm-center align-items-start">
	                                          <div>
	                                              <div class="d-flex svg-illustration mb-6 gap-2 align-items-center">
	                                                  <span class="app-brand-text demo fw-bold ms-50 lh-1">${com.comNm}</span>
	                                              </div>
	                                              <p class="mb-0">
	                                                  <span class="pe-2">대표이사 </span>
	                                                  <b>${com.comBsnm}</b>
	                                              </p>
	                                              <p class="mb-0">
	                                                  <span class="pe-2">사업자등록번호 </span>
	                                                  <b>${com.comBsno}</b>
	                                              </p>
	                                              <p class="mb-0">
	                                                  <span class="pe-2">주소</span> 
	                                                  <b>${com.comAdr}</b>
	                                              </p>
	                                              <p class="mb-0">
	                                                  <span class="pe-2">전화번호</span>
	                                                  <b>${com.comTel}</b>
	                                              </p>
	                                          </div>
	                                          <div>
	                                              
	                                          </div>
	                                      </div>
	                                  </div>
	                                  <hr class="mt-0 mb-6" />
	                                  <div class="card-body p-0">
	                                      <div class="row">
	                                          <div class="col-12">
	                                              <span class="fw-medium text-heading">경고:</span>
	                                              <span>
	                                                  해당문서는 <b>${com.comNm}</b>에서 내부적으로 작성된 문서로 외부에 노출되지 않도록 주의 부탁드립니다.
	                                              </span>
	                                          </div>
	                                      </div>
	                                  </div>
	                              </div>
	                          </div>
	                          <!-- /Invoice -->
		          
	                          <!-- Invoice Actions -->
	                          <div class="col-xl-3 col-md-4 col-12 invoice-actions">
		                          <div class="card">
		                              <nav class="card-body">
		                                  <ul class="px-0 mx-0 ">
		                                      <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">*전결가능직급선택</li>
		                                  </ul>
		                                  <ul class="d-flex align-items-center px-0 mb-0">
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcm.pmtDcmPrePos" cssClass="select2 select2-pos form-select" data-allow-clear="true" required="required">
		                                          	<form:option value="">전결 가능 직급 선택</form:option>
					                          		<c:forEach items="${posComList}" var="pos">
					                          			<form:option value="${pos.posNo}">${pos.posNm}</form:option>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul class="px-0 mb-4">
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
						                          <form:errors path="pmtDcm.pmtDcmPrePos" cssClass="text-danger form-text text-end" element="span" />
						                      </li>
		                                  </ul>
		                                  <ul class="px-0 mx-0 ">
		                                      <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">결재인원</li>
		                                  </ul>
		                                  <ul id="appInput1" class="d-flex align-items-center px-0 mb-0 flex-wrap gap-3">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-dark">*순서 1</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcmAppEmpId1" cssClass="select2 select2-emp form-select" data-allow-clear="true" required="required">
		                                          	<form:option value="">결재 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<c:if test="${emp.empNo ne principal.realUser.empNo}">
					                          				<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          			</c:if>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul class="px-0 mb-4">
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
						                          <form:errors path="pmtDcmAppEmpId1" cssClass="text-danger form-text text-end" element="span" />
						                      </li>
		                                  </ul>
		                                  <ul id="appInput2" class="align-items-center px-0 mb-4 flex-wrap gap-3" style="display: none ">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-dark">순서 2</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcmAppEmpId2" cssClass="select2 select2-emp form-select" data-allow-clear="true">
		                                          	<form:option value="">결재 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<c:if test="${emp.empNo ne principal.realUser.empNo}">
					                          				<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          			</c:if>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul id="appInput3" class="align-items-center px-0 mb-4 flex-wrap gap-3" style="display: none ">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-dark">순서 3</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcmAppEmpId3" cssClass="select2 select2-emp form-select" data-allow-clear="true">
		                                          	<form:option value="">결재 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<c:if test="${emp.empNo ne principal.realUser.empNo}">
					                          				<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          			</c:if>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul id="appInput4" class="align-items-center px-0 mb-4 flex-wrap gap-3" style="display: none ">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-dark">순서 4</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcmAppEmpId4" cssClass="select2 select2-emp form-select" data-allow-clear="true">
		                                          	<form:option value="">결재 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<c:if test="${emp.empNo ne principal.realUser.empNo}">
					                          				<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          			</c:if>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul id="appInput5" class="align-items-center px-0 mb-4 flex-wrap gap-3" style="display: none ">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-dark">순서 5</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select path="pmtDcmAppEmpId5" cssClass="select2 select2-emp form-select" data-allow-clear="true">
		                                          	<form:option value="">결재 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<c:if test="${emp.empNo ne principal.realUser.empNo}">
					                          				<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          			</c:if>
					                          		</c:forEach>
						                          </form:select>
		                                      </li>
		                                  </ul>
		                                  <ul class="px-0 mb-4 w-100">
		                                  	<li class="list-unstyled me-2 w-100">
		                                  		<button type="button" class="btn btn-outline-primary w-100" id="addApp">
			                                  		<span class="tf-icons bx bx-plus bx-18px me-2"></span> 결재 인원 추가
		                                  		</button>
		                                  	</li>
		                                  </ul>
		                                  <ul class="px-0 mx-0 ">
		                                      <li class="fw-bold fs-5 px-0 mx-0 list-unstyled ">*수신자</li>
		                                  </ul>
		                                  <ul class="d-flex align-items-center px-0 mb-4 border-bottom pb-4 mb-0 flex-wrap gap-3">
		                                      <li class="list-unstyled me-2">
		                                          <span class="badge bg-label-primary">수신자</span>
		                                      </li>
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                          <form:select id="pmtDcmRecEmpno" path="pmtDcm.pmtDcmRecEmpno" cssClass="select2 select2-rec form-select" data-allow-clear="true" required="required">
		                                          	<form:option value="">수신 인원 선택</form:option>
					                          		<c:forEach items="${empList}" var="emp">
					                          			<form:option value="${emp.empNo}">${emp.company.organizationList[0].orgDep}(${emp.company.positionList[0].posNm}/${emp.company.positionList[0].ONEPOSNM}) ${emp.empNm} </form:option>
					                          		</c:forEach>
						                          </form:select>
		                                      	  <form:hidden path="pmtDcm.pmtDcmRecStano" value="DB01120" />
		                                      	  <form:hidden path="pmtDcm.pmtDcmRecEmpnm" value="" />
		                                      	  <form:hidden path="pmtDcm.pmtDcmRecEmpdep" value="" />
		                                      	  <form:hidden path="pmtDcm.pmtDcmRecEmponepos" value="" />
		                                      </li>
		                                  </ul>
		                                  <ul class="px-0 mb-4">
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
		                                      	  <form:errors path="pmtDcm.pmtDcmRecEmpno" cssClass="text-danger form-text text-end" element="span" />
						                      </li>
		                                  </ul>
		                                  <ul class="px-0 mx-0 ">
		                                      <li class="fw-bold fs-5 px-0 mx-0 list-unstyled">참조인원</li>
		                                  </ul>
		                                  <ul class="d-flex flex-wrap align-items-center px-0 mb-4 border-bottom pb-4 gap-2">
		                                      <li class="d-flex align-items-center list-unstyled w-100" >
						                          <form:input id="empRefList" path="pmtDcmPrfEmpList" cssClass="form-control" value=""/>
						                      </li>
		                                  </ul>
							               <button class="btn btn-primary w-100" type="submit">
							                   <i class='bx bx-send bx-sm me-2'></i>
							                   기안하기
							               </button>
		                              </nav>
		                          </div>
	                          </div>
	                          <!-- /Invoice Actions -->
	                      </div>
                      </form:form>
              	</div>
            </div>
        </div>
        <div class="layout-overlay layout-menu-toggle"></div>
        <div class="drag-target"></div>
    </div>
    <tiles:insertAttribute name="postScript"/>
    
    <script defer src="${cPath}/resources/groupwareMember/assets/js/document-selects.js"></script>    
    <script defer src="${cPath}/resources/groupwareMember/assets/js/document-ref-selects.js"></script>
    <script defer src="${cPath}/resources/js/ckeditor/ckeditor.js"></script>
    <script defer src="${cPath}/resources/js/app/board/boardEdit.js"></script>

    <tiles:insertAttribute name="customScript"/>
</body>

</html>
