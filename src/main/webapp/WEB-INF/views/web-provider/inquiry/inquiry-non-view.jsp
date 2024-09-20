<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="container-xxl flex-grow-1 container-p-y blog-single ">
    <div class="py-4 mb-6 ">
        <div class="demo-inline-spacing pb-5 row justify-content-between">
            <a href="${cPath }/w/non/nonList.do" type="button" class="btn rounded-pill btn-outline-primary col-12 col-md-2">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>
            <div class="col-12 col-md-8">
                <form action="${cPath}/w/non/updateNonStatus.do" method="post" class="col d-flex gap-2 justify-content-end">
                    <!-- nonNo를 히든 필드로 전송 -->
                    <input type="hidden" name="what" value="${non.nonNo}">
                    
                    <select name="nonStatus" class="form-select" style="width: 50%;" aria-label="Default select example">
                        <option value="답변전" ${non.nonStatus == '답변전' ? 'selected' : ''}>답변전</option>
                        <option value="답변완료" ${non.nonStatus == '답변완료' ? 'selected' : ''}>답변완료</option>
                        <option value="미응답" ${non.nonStatus == '미응답' ? 'selected' : ''}>미응답</option>
                    </select>
                    <button type="submit" class="btn btn-label-info">답변여부변경</button>
<!--                     <button type="button" class="btn btn-label-danger">문의삭제</bu	tton> -->
                </form>
            </div>
        </div>
    </div>
    <div class="mt-4">
        <h4 class="mb-0">비회원문의</h4>
        <div class="detail-inner">
            <!-- post meta -->
            <h2 class="post-title mb-4">
                <c:out value="${non.nonTitle}" />
            </h2>
            <ul class="custom-flex post-meta">
                <li>
                    <a href="#">
                        <i class='bx bx-user'></i>
                        <c:out value="${non.nonNm}" />
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-envelope'></i>
                        <c:out value="${non.nonEmail}" />
                    </a>
                </li>
            </ul>
            <hr>
            <div class="board-content pb-0">
                <p>
                    <c:out value="${non.nonContent}" />
                </p>
            </div>

            <!-- 첨부파일이 존재할 경우에만 표시 -->
            <c:if test="${not empty non.nonAttachFileNo}">
			   <hr>
			    <div class="attach-files">
			        <h5>첨부파일</h5>
			        <ul class="list-group">
			            <li class="list-group-item">
			            <c:url value='/w/non/${non.atchFile.fileDetails[0].atchFileId }/${non.atchFile.fileDetails[0].fileSn }' var="downUrl"/>
			            <a href="${downUrl }">${non.atchFile.fileDetails[0].orignlFileNm }(${non.atchFile.fileDetails[0].fileFancysize})</a>
			                    <!-- 원본 파일 이름 표시 -->
			                <!-- 파일 크기 및 확장자 표시 -->
			            </li>
			        </ul>
			    </div>
			</c:if>
        </div>
    </div>
</div>