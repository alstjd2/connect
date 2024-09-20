<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <section id="contact-us" class="contact-us section">
    <div class="container">
        <div class="contact-head">
            <div class="inner-content">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="form-main">
                            
                            <div class="btn-back mb-4">
                                <a href="${cPath }/w/mypage/mypageError.do">
                                    <i class="las la-arrow-left"></i>
                                    목록으로
                                </a>
                            </div>
                            <h3 class="inner-title left d-flex align-items-end justify-content-between">
                                <span>오류문의</span>
                                <span class="fw-light fs-6">그룹웨어에서 발생한 오류를 작성해주세요.</span>
                            </h3>
                            
							<form:form class="form" method="post" modelAttribute="err" enctype="multipart/form-data" action="${cPath }/w/mypage/ErrInsert.do">
							    <div class="row">
							        <!-- ERR_TITLE -->
							        <div class="col-12">
							            <div class="form-group">
							                <form:input path="errTitle" type="text" placeholder="제목을 입력해주세요" required="required" cssClass="form-control"/>
							                <form:errors path="errTitle" cssClass="text-danger" element="span"/>
							            </div>
							        </div>
							        <!-- ERR_LOC -->
							        <div class="col-12 col-md-6">
								        <div class="form-group message">
								            <form:select path="errLoc" cssClass="form-select" aria-label="Default select example">
								                <form:option value="" label="오류발생 위치" />
								                <form:option value="관리자-기본환경" label="관리자-기본환경" />
								                <form:option value="관리자-구성원관리" label="관리자-구성원관리" />
								                <form:option value="관리자-서비스관리" label="관리자-서비스관리" />
								                <form:option value="사용자-메시지" label="사용자-메시지" />
								                <form:option value="사용자-메일" label="사용자-메일" />
								                <form:option value="사용자-캘린더" label="사용자-캘린더" />
								                <form:option value="사용자-게시판" label="사용자-게시판" />
								                <form:option value="사용자-설문" label="사용자-설문" />
								                <form:option value="사용자-화상회의" label="사용자-화상회의" />
								                <form:option value="사용자-주소록" label="사용자-주소록" />
								                <form:option value="사용자-드라이브" label="사용자-드라이브" />
								                <form:option value="사용자-문서결재" label="사용자-문서결재" />
								                <form:option value="사용자-인사관리" label="사용자-인사관리" />
								                <form:option value="사용자-근태관리" label="사용자-근태관리" />
								                <form:option value="기타" label="기타" />
								            </form:select>
								            <form:errors path="errLoc" cssClass="text-danger" element="span"/>
								        </div>
							
							        </div>
							        <!-- ERR_INCIDENT_DESCRIPTION -->
							       <div class="col-12 col-md-6">
									    <div class="form-group message">
									        <form:input path="errIncidentDescription" type="text" placeholder="오류발생 위치에서 어떤 일을 하다가 애러가 발생했나요?" required="required" cssClass="form-control"/>
									        <form:errors path="errIncidentDescription" cssClass="text-danger" element="span"/>
									    </div>
									</div>
									<!-- ERR_CONTENT -->
									<div class="col-12">
									    <div class="form-group message">
									        <form:textarea path="errContent" placeholder="더 자세한 설명을 기재하고 싶으시다면 작성 부탁드립니다." cssClass="form-control"/>
									        <form:errors path="errContent" cssClass="text-danger" element="span"/>
									    </div>
									</div>
									<!-- 파일 업로드 필드 -->
									<div class="col-12 pb-5">
									    <div class="form-group">
									        <form:input path="atchFile.fileDetails[0].uploadFile" type="file" cssClass="form-control" />
									    </div>
									    <small>
									        파일당 10MB이하, 전체 5개까지 첨부 가능합니다.
									        jpg, jpeg, png, gif, bmp, tif, doc, docx, xls, xlsx, ppt, pptx, hwp, txt, pdf 파일만 등록 가능합니다.
									    </small>
									</div>
									<hr/>
									
									<!-- 제출 버튼 -->
									<div class="col-12 pt-5">
									    <div class="form-group button text-center">
									        <button type="button" class="btn" onclick="confirmSubmit()">제출</button>
									    </div>
									</div>
							    </div>
							</form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="${cPath}/resources/webUser/assets/js/mypage.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function confirmSubmit() {
    const form = document.querySelector('form');

    // form의 유효성 검사를 먼저 수행
    if (form.reportValidity()) {
        Swal.fire({
            title: "정말 제출하시겠습니까?",
            text: "입력한 내용이 제출됩니다!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "네, 제출합니다!",
            cancelButtonText: "취소"
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit(); // 사용자가 확인을 누르면 form이 제출됩니다.
            }
        });
    } else {
        // form 검증 실패 시, 브라우저가 기본적으로 제공하는 검증 메시지가 표시됩니다.
    }
}
</script>
