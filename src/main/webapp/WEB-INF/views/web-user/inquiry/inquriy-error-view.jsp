<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="contact-us" class="contact-us section">
    <div class="container blog-single">
        <div class="contact-head">
            <div class="inner-content">
                <div class="row align-items-center">
                    <div class="col-12 post-details">
                        <div class="form-main detail-inner">
                            
                            <div class="btn-back">
                                <a href="${cPath }/w/mypage/mypageError.do">
                                    <i class="las la-arrow-left"></i>
                                    목록으로
                                </a>
                            </div>
                            <h3 class="inner-title left d-flex align-items-end justify-content-between">
                                <span>
                                    설문완료 일자가 지나도 설문이 가능합니다.
                                </span>
                                <span class="fw-light fs-6">${err.errWorkProgress }</span>
                            </h3>
                            <div class="board-content pt-0">
                                <ul class="list">
                                    <li>
                                        <i class="las la-check"></i>
                                        사용자-설문
                                    </li>
                                    <li>
                                        <i class="las la-check"></i>
                                        설문지를 작성하고 완료기간이 되어도 설문 작성이 가능합니다. 
                                    </li>
                                </ul>
                                <p>
                                     ${err.errContent}
                                </p>

                                <!-- New Section for Attachments -->
                                <p class="text-muted mb-2">첨부파일</p>
                                <div class="cursor-pointer">
                                    <i class="bx bx-file"></i>
                                    <span class="align-middle ms-1">
                                        <c:choose>
                                            <c:when test="${not empty err.atchFile and not empty err.atchFile.fileDetails}">
                                                <c:forEach var="file" items="${err.atchFile.fileDetails}">
                                                    <c:url value='/w/mypage/${file.atchFileId}/${file.fileSn}' var="downUrl"/>
                                                    <a href="${downUrl }">${file.orignlFileNm} </a><br/>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <span>첨부파일 없음</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <!-- End of New Section -->
                            </div>
                        </div>
                    </div>
                </div>

                <!-- New Section for Adding Answers -->
               <div class="row align-items-center mt-5">
                   <div class="col-12 post-details">
                       <div class="form-main detail-inner">
                           <h3 class="inner-title left d-flex align-items-end justify-content-between">
                               <span>답변</span>
                           </h3>
                           <div class="board-content pt-0">
                               <p>
                                   ${errAdminNo[0].errContent} <!-- 관리자에서 가져온 답변을 표시 -->
                               </p>
                           </div>
                       </div>
                   </div>
               </div>
               <!-- End of New Section -->

            </div>
        </div>
    </div>
</section>

<script src="${cPath}/resources/webUser/assets/js/mypage.js"></script>
