<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <div class="breadcrumbs overlay">
        <div class="back-img" style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">지원</h1>
                        <p>
                            서비스 사용 중 발생한 이슈 <br/>또는 궁금증을 지원페이지에서 확인하실 수 있습니다.
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${cPath }/w/index.do">홈</a></li>
                        <li><a href=" ${cPath }/w/support.do">지원</a></li>
                        <li>문의하기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section id="contact-us" class="contact-us py-5">
        <div class="container">
            <div class="contact-head">
                <div class="inner-content">
                    <div class="row align-items-center">
                        <div class="col-12">
								<div class="form-main">
								    <h3 class="inner-title left d-flex align-items-end justify-content-between">
								        <span>문의하기</span>
								        <span class="fw-light fs-6">남겨주신 이메일로 연락드립니다. 꼭 사용하시는 이메일로 입력해주세요.</span>
								    </h3>
									    <form:form class="form" method="post" modelAttribute="non" enctype="multipart/form-data" action="${cPath }/w/support/non.do">
									        <div class="row">
									            <!-- 이름 입력 -->
									            <div class="col-lg-6 col-12">
									                <div class="form-group">
									                    <form:input path="nonNm" type="text" placeholder="이름을 입력해주세요" required="required" cssClass="form-control"/>
									                    <form:errors path="nonNm" cssClass="text-danger" element="span"/>
									                </div>
									            </div>
									            
									            <!-- 이메일 입력 -->
									            <div class="col-lg-6 col-12">
									                <div class="form-group">
									                    <form:input path="nonEmail" type="email" placeholder="이메일을 입력해주세요" required="required" cssClass="form-control"/>
									                    <form:errors path="nonEmail" cssClass="text-danger" element="span"/>
									                </div>
									            </div>
									            
									            <!-- 제목 입력 -->
									            <div class="col-12">
									                <div class="form-group">
									                    <form:input path="nonTitle" type="text" placeholder="제목을 입력해주세요" required="required" cssClass="form-control"/>
									                    <form:errors path="nonTitle" cssClass="text-danger" element="span"/>
									                </div>
									            </div>
									            
									            <!-- 메시지 입력 -->
									            <div class="col-12">
									                <div class="form-group message">
									                    <form:textarea path="nonContent" placeholder="문의 내용을 입력해주세요."  cssClass="form-control"></form:textarea>
									                    <form:errors path="nonContent" cssClass="text-danger" element="span"/>
									                </div>
									            </div>
									            
									            <!-- 파일 첨부 -->
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
									            
									            <!-- 개인정보 수집 동의 -->
									            <div class="col-12">
									                <div class="form-check">
									                    <form:checkbox path="nonPerinfocollection" value="Y" cssClass="form-check-input" required="required"/>
									                    <form:errors path="nonPerinfocollection" cssClass="text-danger" element="span"/>
									                    <label class="form-check-label" for="flexCheckChecked">
									                        <span>개인정보 수집 및 이용에 동의합니다.</span>
									                        <a href="#">전문보기</a>
									                    </label>
									                </div>
									            </div>
									            <!-- 제출 버튼 -->
									            <div class="col-12 pt-5">
									                <div class="form-group button text-center">
									                    <button type="submit" class="btn">제출</button>
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
