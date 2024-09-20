<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="login m-auto">
    <form method="post">
        <h1 class="h3 pc fw-bold wow fadeInDown" >Connect<span>에 오신걸 환영합니다!</span></h1>
        <h1 class="h3 mo fw-bold wow fadeInDown mb-4">로그인</h1>
        <p class="mb-4 wow fadeInDown" data-wow-delay=".2s">로그인하여 Connect 서비스를 경험하세요.</p>
            <div class="form-floating wow fadeInUp" data-wow-delay=".4s">
                <input type="text" class="form-control" id="floatingInput" name="memId" placeholder="아이디를 입력해주세요.">
                <label for="floatingInput">아이디</label>
            </div>
            <div class="form-floating form-group has-feedback wow fadeInUp" data-wow-delay=".4s">
<!--                 <i class="pass-view las la-low-vision"></i> -->
                <input type="password" class="form-control" id="floatingPassword" name="memPw" placeholder="비밀번호를 입력해주세요.">
                <label for="floatingPassword">비밀번호</label>
            </div>
            <ul class="d-flex align-items-center justify-content-between wow fadeInUp my-3" data-wow-delay=".6s">
                <li>
                    <a href="${cPath }/gw/login/loginForm.do">그룹웨어 로그인</a>
                	<!-- class="form-check text-start"> -->
                    <!-- <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                     <label class="form-check-label" for="flexCheckDefault">
                        아이디 기억하기
                    </label>  -->
                </li>
                <li class="">
                    <a href="${cPath }/w/member/idFind.do">아이디찾기</a>
                    <span>|</span>
                    <a href="${cPath }/w/member/pwFind.do">비밀번호 찾기</a>
                </li>
            </ul>
            <div class="button wow fadeInUp" data-wow-delay=".8s">
                <button class="btn w-100 py-2" type="submit">로그인</button>
            </div>
            <p class="pt-3 text-center wow fadeInUp"  data-wow-delay=".8s">
                회원이 아니신가요? <a href="${cPath }/w/member/joinForm.do">회원가입</a>
            </p>
        </form>
        <hr>
        <div class="d-flex flex-wrap gap-3">
	        <form method="post">
	        	<div class="button wow fadeInUp" data-wow-delay=".8s">
		        	<input type="hidden" name="memId" value="A001" />
		        	<input type="hidden" name="memPw" value="java" />
		        	<button class="btn py-2 btn-outline-primary" type="submit">기존회원</button>
	            </div>
	        </form>
	        <form method="post">
	        	<div class="button wow fadeInUp" data-wow-delay=".8s">
		        	<input type="hidden" name="memId" value="dhkim1212" />
		        	<input type="hidden" name="memPw" value="java1212" />
		        	<button class="btn py-2 btn-outline-primary" type="submit">신규회원</button>
	            </div>
	        </form>
	        <form method="post">
	        	<div class="button wow fadeInUp" data-wow-delay=".8s">
		        	<input type="hidden" name="memId" value="hyewon" />
		        	<input type="hidden" name="memPw" value="java" />
		        	<button class="btn py-2 btn-outline-primary" type="submit">프로바이더</button>
	            </div>
	        </form>
<!-- 	        <form method="post">
	        	<div class="button wow fadeInUp" data-wow-delay=".8s">
		        	<input type="hidden" name="memId" value="yunji" />
		        	<input type="hidden" name="memPw" value="java" />
		        	<button class="btn py-2 btn-outline-primary" type="submit">윤지/프로바이더</button>
	            </div>
	        </form> -->

        </div>
</section>
