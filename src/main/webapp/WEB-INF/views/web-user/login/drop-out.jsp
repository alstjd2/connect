<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="contact-head">
                <div class="inner-content">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="form-main">
                                <div class="btn-back mb-4">
                                    <a href="inquiry-error.html">
                                        <i class="las la-arrow-left"></i>
                                        목록으로
                                    </a>
                                </div>
                                <h3 class="inner-title left d-flex align-items-end justify-content-between">
                                    <span>회원탈퇴</span>
                                </h3>
                                <form class="form" method="post" action="" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input name="pass" type="password" placeholder="현재 비밀번호를 입력하세요." required="required">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input name="passChk" type="password" placeholder="비밀번호를 다시 입력하세요." required="required">
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked  required="required">
                                                <label class="form-check-label" for="flexCheckChecked">
                                                    이용중인 서비스가 있다면 취소해야합니다.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2" checked  required="required">
                                                <label class="form-check-label" for="flexCheckChecked2">
                                                    탈퇴처리하고 7일이내 철회가 가능합니다.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" checked  required="required">
                                                <label class="form-check-label" for="flexCheckChecked3">
                                                    7일이 넘어가면 계정이 삭제됩니다.
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-12 pt-5">
                                            <div class="form-group button text-center">
                                                <button type="submit" class="btn">회원탈퇴</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<script src="${cPath}/resources/webUser/assets/js/mypage.js"></script>     
