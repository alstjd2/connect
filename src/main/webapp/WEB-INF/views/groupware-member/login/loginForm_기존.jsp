<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty Message }">
	<script>
		alert("${Message}");
	</script>
</c:if>

<section class="">
    <form method="post">
        <h1 class="" >Connect Groupware<span>에 오신걸 환영합니다!</span></h1>
        <h1 class="">로그인</h1>
        <p class="" data-wow-delay=".2s">로그인하여 Connect Groupware 서비스를 경험하세요.</p>
            <div class="" data-wow-delay=".4s">
                <input type="text" class="" id="empId" name="empId" placeholder="아이디를 입력해주세요.">
            </div>
            <div class="" data-wow-delay=".4s">
                <input type="password" class="" id="empPw" name="empPw" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="" data-wow-delay=".8s">
                <button class="" type="submit">로그인</button>
            </div>
        </form>
        
<!--         <form method="post"> -->
<!--         	<div class="button wow fadeInUp" data-wow-delay=".8s"> -->
<!-- 	        	<input type="hidden" id="memId" name="memId" value="A001" /> -->
<!-- 	        	<input type="hidden" id="memPw" name="memPw" value="java" /> -->
<!-- 	        	<button class="btn py-2" type="submit">A001</button> -->
<!--             </div> -->
<!--         </form> -->

</section>
