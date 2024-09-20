<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <script defer type="text/javascript" -->
<%-- 		src="${cPath}/resources/groupwareMember/assets/js/boardUpdate/boardUpdate.js"></script> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}
		/resources/groupwareMember/assets/css/custom/jms_aa.css" />
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/groupwareMember/assets/css/boardDetail.css">
<div class="col app-email-view flex-grow-0 bg-lighter show"
    id="app-email-view" style="width: calc(100%)">

    <script
        src="/connect/resources/groupwareMember/assets/vendor/libs/quill/quill.js"></script>

    <div
        class="card shadow-none border-0 rounded-0 app-email-view-header p-5 pt-md-4">
        <!-- 게시글 수정 : 제목 바 -->
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center overflow-hidden">
                <span class="ms-sm-2 me-4"> 
                    <i class="bx bx-chevron-left bx-md cursor-pointer"
                        data-bs-toggle="sidebar" data-target="#app-email-view"
                        style="width: calc(100%)"></i>
                </span>
                <!-- 게시글 제목 출력 -->
                <h5 class="text-truncate mb-0 me-2 fw-bold">게시글 수정</h5>
            </div>
            <!-- 게시글 수정 : 액션 바 -->
<!--             <div class="d-flex align-items-center"> -->
<!--                 <span class="btn btn-icon p-0 me-2 text-muted"> -->
<!--                     <i class="bx bx-chevron-left bx-md"></i> -->
<!--                 </span>  -->
<!--                 <span class="btn btn-icon p-0">  -->
<!--                     <i class="bx bx-chevron-right bx-md"></i> -->
<!--                 </span> -->
<!--             </div> -->
        </div>

        <hr class="m-0">
        <div class="app-email-view-content py-4" id="grboardUpdate">
            <!-- 게시글 수정 : 내용 -->
            <form:form method="post" action="${pageContext.request.contextPath}/gw/board/updatePost.do" modelAttribute="grBoard" enctype="multipart/form-data">
                <div class="card mx-sm-6 mx-3 mt-4">
                    <div class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">
                        <div class="d-flex align-items-center mb-sm-0 mb-3">
                            <!-- 작성자 정보 -->
                            <form:hidden path="grbNo" />
                            <c:choose>
				    <c:when test="${not empty grBoard.employee.empProfile}">
				        <!-- 프로필 사진이 있을 경우 -->
				        <div class="avatar-wrapper emp-info" data-emp-no="${grBoard.employee.empNo}" data-target='#app-addr-contacts'>
				            <div class="avatar me-2">
				                <c:url value='/files/${grBoard.empAtchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
				                <img src="${fileUrl }"
				                    class="d-block w-px-38 h-px-38 rounded-circle"
				                    id="uploadedAvatar"
				                    alt="프로필 사진"
				                    height="38" width="38"
				                />
				            </div>
				        </div>
				    </c:when>
				    <c:otherwise>
				        <!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
				        <div class="avatar-wrapper emp-info" data-emp-no="${grBoard.empNo}" data-target='#app-addr-contacts'>
				            <div class="avatar me-2">
				                <span class="avatar-initial rounded-circle"
				                      style="display: block; width: 38px; height: 38px; background-color: #ddd;"></span>
				            </div>
				        </div>
				    </c:otherwise>
				</c:choose>
                            <div class="flex-grow-1 ms-1">
                                <h6 class="m-0 fw-normal">${grBoard.employee.empNm}</h6>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <!-- 작성일자 출력 -->
                            <p class="mb-0 me-4 text-muted">${grBoard.grbDate}</p>
                        </div>
                    </div>
                    <div class="card-body pt-6">
                        <!-- 게시글 제목 수정 -->
                        <div class="mb-3">
                            <label for="grbTitle" class="form-label">제목</label>
                            <form:input path="grbTitle" id="grbTitle" class="form-control" />
                        </div>

                        <!-- 게시글 내용 수정 -->
                        <div class="mb-3">
	                            <label for="grbContent" class="form-label">내용</label>
	                            <form:textarea path="grbContent" id="grbContent" class="form-control" rows="10"/>
	                        </div>
	
	                        <hr>
	                        <p class="text-muted mb-2">첨부파일</p>
	                        <div class="mb-3"  >
							    <i class="bx bx-file"></i> 
							    <span class="align-middle ms-1">
							        <c:choose>
							            <c:when test="${not empty grBoard.atchFile and not empty grBoard.atchFile.fileDetails}">
							                <c:url value='/gw/board/${grBoard.atchFile.fileDetails[0].atchFileId}/${grBoard.atchFile.fileDetails[0].fileSn }' var="downUrl" />
							                <a href="${downUrl}">${grBoard.atchFile.fileDetails[0].orignlFileNm} (${grBoard.atchFile.fileDetails[0].fileFancysize})</a>
							                
							          <i class="bx bx-trash bx-md text-danger cursor-pointer" 
									   onclick="deleteItem(this)" 
									   	data-grb-no="${grBoard.grbNo}">
										</i>
								           </c:when>
							            <c:otherwise>
							                <span>첨부파일 없음</span>
							            </c:otherwise>
							        </c:choose>
							    </span>
							</div>
	                        <!-- 새로운 파일 첨부 -->
	                          <div class="mb-3">
						        <label for="atchFile.fileDetails0.uploadFile" class="col-sm-2 col-form-label">파일 선택</label>
						        <div class="col-sm-10">
						            <input type="file" id="atchFile.fileDetails0.uploadFile" name="atchFile.fileDetails[0].uploadFile" class="form-control" />
						        </div>
						    </div>
	
	                        <div class="text-end">
	                            <input type="hidden" name="grbNo" value="${grBoard.grbNo}" />
	                            <button type="submit" class="btn btn-primary" >수정하기</button>
	                        </div>
	                    </div>
	                </div>
	            </form:form>
	        </div>
	    </div>
	</div>
