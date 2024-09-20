<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}
		/resources/groupwareMember/assets/css/custom/jms_aa.css" />
<link rel="stylesheet"
	href="${cPath }/resources/groupwareMember/assets/vendor/libs/quill/editor.css">
<link rel="stylesheet"
	href="${cPath }/resources/groupwareAdmin/assets/vendor/libs/quill/editor.css">
<script
	src="${cPath }/resources/groupwareMember/assets/vendor/libs/quill/quill.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/js/app/jmsaa/reply.js"></script>
<script defer type="text/javascript"
	src="${cPath}/resources/groupwareMember/assets/js/custom/jms_aa2.js"></script>
<div
	class="card shadow-none border-0 rounded-0 app-email-view-header p-5 pt-md-4">
	<!-- 게시글 보기 : 제목 바 -->
	<div class="d-flex justify-content-between align-items-center">
		<div class="d-flex align-items-center overflow-hidden">
			<span class="ms-sm-2 me-4"> <i
				class="bx bx-chevron-left bx-md cursor-pointer"
				data-bs-toggle="sidebar" data-target="#app-email-view"
				style="width: calc(100%)" ></i>
			</span>
			<h5 class="text-truncate mb-0 me-2 fw-bold">${grbNo.grbTitle }</h5>
		</div>
<!-- 		게시글 보기 : 액션 바 -->
<!-- 		<div class="d-flex align-items-center"> -->
<!-- 			<span class="btn btn-icon p-0 me-2 text-muted"> <i -->
<!-- 				class="bx bx-chevron-left bx-md"></i> -->
<!-- 			</span> <span class="btn btn-icon p-0"> <i -->
<!-- 				class="bx bx-chevron-right bx-md"></i> -->
<!-- 			</span> -->
<!-- 		</div> -->
	</div>
</div>
<div class="d-flex justify-content-between align-items-center">
	<div class="d-flex align-items-center"></div>
	<div class="d-flex align-items-center">
		<div class="dropdown ms-1">
<!-- 			<button class="btn btn-icon p-0" type="button" -->
<!-- 				id="dropdownMoreOptions" data-bs-toggle="dropdown" -->
<!-- 				aria-haspopup="true" aria-expanded="false"> -->
<!-- 				<i class="bx bx-dots-vertical-rounded bx-md"></i> -->
<!-- 			</button> -->
			<div class="dropdown-menu dropdown-menu-end"
				aria-labelledby="dropdownMoreOptions" style="">
				<a class="dropdown-item" href="javascript:void(0)">
					<li class="list-inline-item email-unread btn btn-icon">
						<i class="bx bx-edit bx-md"
						onclick="redirectToEditForm(${grbNo.grbNo})"></i>
					</li>
				</a>
				<a class="dropdown-item" href="javascript:void(0)">
					<c:if test="${grbNo.empNo == empNo}">
					<c:out value="${grbNo.empNo == empNo }"></c:out>
						<!-- 쓰레기통 아이콘: 작성자 본인의 글일 때만 표시 -->
						<li class="list-inline-item email-delete btn btn-icon">
							<form>
								<label for="trash-${grbNo.grbNo}"
									class="list-inline-item email-delete btn btn-icon">
									<input type="hidden" name="trash" class="trash-checkbox"
									data-adr-no="${grbNo.grbNo}" /> <input type="hidden"
									name="empNo" data-emp-no="${empNo}" /> <i
									class="bx bx-trash bx-md" data-adr-no="${grbNo.grbNo}"
									data-emp-no="${empNo}" onclick="toggleTrashYN(this)"></i>
								</label>
							</form>
						</li>
					</c:if>
				</a>
			</div>
		</div>
	</div>
</div>
<hr class="m-0" />
<div class="app-email-view-content py-4" id="grboardDetail">
	<!-- 게시글 보기 : 내용 -->
	<!-- 게시글 보기 : 마지막 메일 -->
	<div class="card  mx-sm-6 mx-3 mt-4">
		<div
			class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">

			<div class="d-flex align-items-center mb-sm-0 mb-3">
			  <c:choose>
				    <c:when test="${not empty grbNo.employee.empProfile}">
				        <!-- 프로필 사진이 있을 경우 -->
				        <div class="avatar-wrapper emp-info" data-emp-no="${grbNo.employee.empNo}" data-target='#app-addr-contacts'>
				            <div class="avatar me-2">
				                <c:url value='/files/${grbNo.empAtchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
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
				        <div class="avatar-wrapper emp-info" data-emp-no="${grbNo.empNo}" data-target='#app-addr-contacts'>
				            <div class="avatar me-2">
				                <span class="avatar-initial rounded-circle"
				                      style="display: block; width: 38px; height: 38px; background-color: #ddd;"></span>
				            </div>
				        </div>
				    </c:otherwise>
				</c:choose>
			    <div class="flex-grow-1 ms-1">
			        <h6 class="m-0 fw-normal">${grbNo.grbTitle }</h6>
			        <small>${grbNo.empNm}</small>
			    </div>
			</div>
			<div class="d-flex align-items-center">
				<p class="mb-0 me-4 text-muted">${grbNo.grbDate.substring(0, 16)}</p>
			</div>
		</div>
<div class="card-body pt-6">
    <p>${grbNo.grbContent }</p>
    <hr />
    <p class="text-muted mb-2">첨부파일</p>
    <div class="cursor-pointer">
        <i class="bx bx-file"></i>
        <span class="align-middle ms-1">
            <c:choose>
                <c:when test="${not empty grbNo.atchFile and not empty grbNo.atchFile.fileDetails}">
                    <c:set var="fileExt" value="${fn:substringAfter(grbNo.atchFile.fileDetails[0].orignlFileNm, '.')}" />
                    
                    <!-- 파일이 이미지 파일일 경우 미리보기로 표시 -->
                    <c:choose>
                        <c:when test="${fileExt == 'jpg' || fileExt == 'jpeg' || fileExt == 'png' || fileExt == 'gif' || fileExt == 'jfif'}">
                            <c:url value='/gw/board/${grbNo.atchFile.fileDetails[0].atchFileId}/${grbNo.atchFile.fileDetails[0].fileSn }' var="imageUrl" />
                            <!-- 이미지 미리보기 -->
                            <img src="${imageUrl}" alt="첨부 이미지" class="img-thumbnail" width="150" />
                            <br/>
                            <!-- 파일명과 파일 크기 표시 및 다운로드 링크 -->
                            <a href="${imageUrl}" download>
                                ${grbNo.atchFile.fileDetails[0].orignlFileNm} 
                                (${grbNo.atchFile.fileDetails[0].fileFancysize})
                            </a>
                        </c:when>
                        <c:otherwise>
                            <!-- 이미지 파일이 아닐 경우 다운로드 링크와 파일 정보 표시 -->
                            <c:url value='/gw/board/${grbNo.atchFile.fileDetails[0].atchFileId}/${grbNo.atchFile.fileDetails[0].fileSn }' var="downUrl" />
                            <a href="${downUrl}" download>
                                ${grbNo.atchFile.fileDetails[0].orignlFileNm} 
                                (${grbNo.atchFile.fileDetails[0].fileFancysize})
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <span>첨부파일 없음</span>
                </c:otherwise>
            </c:choose>
        </span>
    </div>
</div>
	</div>
	<div class="card mx-sm-6 mx-3 mt-4" id="replyList">
		<div class="card-header border-bottom">
			<h6 class="m-0 fw-bold">댓글</h6>
		</div>
		<div class="card-body pt-3">
			<ul id="replyListContainer" class="list-unstyled">
				<c:choose>
					<c:when test="${not empty replyList}">
					    <c:forEach var="reply" items="${replyList}" varStatus="status">
					        <li class="media mb-3" style="display: flex;width: 100%;align-items: center;">
					            <c:choose>
					                <c:when test="${not empty reply.employee.empProfile}">
					                    <!-- 프로필 사진이 있을 경우 -->
					                    <c:url value='/files/${reply.empAtchFile.fileDetails[0].streFileNm}' var="profileUrl"/>	
					                    <img src="${profileUrl}"
					                        class="mr-3 rounded-circle"
					                        width="38" height="38" alt="프로필 사진">
					                </c:when>
					                <c:otherwise>
					                    <!-- 프로필 사진이 없을 경우 기본 아바타 -->
					                    <img src="assets/img/avatars/default-avatar.png"
					                        class="mr-3 rounded-circle"
					                        width="38" height="38" alt="기본 아바타">
					                </c:otherwise>
					            </c:choose>
					
					            <div style="display: flex;justify-content: space-between;width: 100%;">
					                <div class="media-body" style="margin-left: 20px;">
					                    <h6 class="mt-0 mb-1 fw-bold">${reply.employee.empNm}</h6>
					                    <p style="margin-bottom: 0;">${reply.replyContent }</p>
					                    <%-- <small class="text-muted">${reply.grbReplyDate}</small> --%>
					                </div>
					
					                <!-- 동일한 empNo일 때만 쓰레기통 아이콘과 수정 아이콘 표시 --> 
					                <c:if test="${reply.empNo == empNo}">
					                    <div class="media-options" style="align-items: center;display: flex;">
					                        <i class="bx bx-trash bx-md" onclick="toggleReplyYN(this)"
					                            data-reply-no="${reply.grbReplyNo}" style="margin-right: 10px;"></i>
					                    </div>
					                </c:if>
					            </div>
					        </li>
					
					        <c:if test="${!status.last}">
					            <hr class="my-4">
					            <!-- 마지막 항목이 아닌 경우에만 구분선 추가 -->
					        </c:if>
					    </c:forEach>
					</c:when>
					<c:otherwise>
						<p id="noReplyMessage" class="text-muted">등록된 댓글이 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</ul>

			<!-- 구분선 추가 -->
			<hr class="my-6">

			<!-- 댓글 작성 폼 -->
			<form id="writeForm" action="${cPath}/gw/board/insertReply.do"
				method="post" enctype="multipart/form-data">
				<h6 class="fw-normal pb-4">댓글 작성</h6>
				<div class="ps-3" id="replybox">
					<textarea class="form-control" id="replyContent"
						name="replyContent" rows="3" placeholder="내용을 입력하세요"></textarea>
				</div>
				<!-- 숨겨진 input 필드 -->
				<input type="hidden" name="grbNo" value="${grbNo.grbNo}">
				<div class="d-flex justify-content-end align-items-center mt-4">
					<button type="submit" class="btn btn-primary" id="replybtn">
						<span class="align-middle">댓글 등록</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script defer type="text/javascript"
src="${cPath}/resources/js/app/jmsaa/board.js"></script>