<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container-xxl flex-grow-1 container-p-y blog-single">
	    <!-- 뒤로가기 버튼 -->
	    <div class="pt-4">
	        <div class="demo-inline-spacing pb-5 row justify-content-between">
	            <a href="${cPath }/w/err/errList.do" type="button" class="btn rounded-pill btn-outline-primary col-12 col-md-2">
	                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
	            </a>
	        </div>
	    </div> 
    <!-- 오류문의 제목과 내용 -->
		    <div class="mt-4">
		        <h4 class="mb-0">오류문의</h4>
		        <div class="detail-inner">
		            <!-- post meta -->
		            <h2 class="post-title mb-4">
		                ${err.errTitle}
		            </h2>
		            <ul class="custom-flex post-meta">
		                <li>
		                    <a href="#">
		                        <i class='bx bx-user'></i>
		                        <c:out value="${err.errLoc}" />
		                    </a>
		                </li>
		            </ul>
		            <hr>
		            <div class="board-content pb-0">
		                <p>
		                    ${err.errContent}
		                </p>
		            </div>
					  <c:if test="${not empty err.errAttachFile && not empty err.atchFile.fileDetails && not empty err.atchFile.fileDetails[0]}">
						    <p class="text-muted mb-2">첨부파일</p>
						    <div class="cursor-pointer">
						        <i class="bx bx-file"></i>
						        <span class="align-middle ms-1">
						            <c:url value='/w/err/${err.atchFile.fileDetails[0].atchFileId}/${err.atchFile.fileDetails[0].fileSn }' var="downUrl"/>
						            <a href="${downUrl }">${err.atchFile.fileDetails[0].orignlFileNm }</a>
						        </span>
						    </div>
						</c:if>
			    <!-- 답변 폼 -->
			    <div class="col-12 m-auto pt-10 mt-10 border-top">
			        <form action="${cPath}/w/err/updateErrStatus.do" method="post">
			
			            <div class="">
			                <label for="selectErr" class="form-label">답변진행도</label>
			                <select id="selectErr" name="errStatus" class="form-select" aria-label="Default select example">
			                    <option value="작업전" ${err.errWorkProgress == '작업전' ? 'selected' : ''}>작업전</option>
			                    <option value="작업중" ${err.errWorkProgress == '작업중' ? 'selected' : ''}>작업중</option>
			                    <option value="작업완료" ${err.errWorkProgress == '작업완료' ? 'selected' : ''}>작업완료</option>
			                    <option value="작업보류" ${err.errWorkProgress == '작업보류' ? 'selected' : ''}>작업보류</option>
			                </select>
			            </div>
			            <input type="hidden" name="what" value="${err.errNo}" />
			            <div> 
			                <label for="ControlTextarea" class="form-label pt-3">답변내용</label>
			                <textarea class="form-control" id="ControlTextarea" name="errContent" rows="4" required="true">${errBoard.errAdmin.errContent}</textarea>
			            </div>
			            <div class="text-center pt-3">
			                <button type="submit" class="btn btn-label-info">답변제출</button>
<%-- 			                <button type="button" onclick="location.href='${pageContext.request.contextPath}/ErrorBoard/delete?errNo=${errBoard.errNo}'" class="btn btn-label-danger">문의삭제</button> --%>
			            </div>
			        </form>
			    </div>
			</div>
		</div>
	</div>
