<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div class="breadcrumbs overlay">
        <div class="back-img" style="background-image: url(${cPath}/resources/webUser/assets/images/breadcrumb/breadcrumb-bg.jpg);"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">참고자료</h1>
                        <p>
                            커넥트에서 제공하는 참고자료로<br /> 읽어보시면 커넥트 사용시 도움이 됩니다.
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index">Home</a></li>
                        <li><a href="#">참고자료</a></li>
                        <li><a href="${cPath}/w/promotion/list.do">이벤트</a></li>
                        <li>오프라인</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="blog-single py-0">
        <div class="container">
            <div class="single-inner py-5">
                <div class="post-details">
                    <div class="detail-inner ">
                        <!-- post meta -->
                        <h2 class="post-title mb-4">
                            ${promotion.board.boardTitle}
                        </h2>
                        <ul class="custom-flex post-meta">
                            <li>
                                <a href="#">
                                    <i class="las la-calendar-check"></i>
                                    2024. 07. 30
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="las la-clock"></i>
                                    10:00 - 17:00
                                </a>
                            </li>
                        </ul>
                        <hr />
                        <div class="board-content">
                            <div class="post-thumbnils">
                                <img src="assets/images/blog/blog-single.jpg" alt="#">
                            </div>
                            <p>
                                ${promotion.board.boardContent}
                            </p>
                            <!-- post image -->
                            <ul class="list">
                                <li>
                                    <i class="las la-check"></i>
                                    The organization is just beginning to operate in the market implementing.
                                </li>
                                <li>
                                    <i class="las la-check"></i>
                                    Customer-focused businesses build a virtuous cycle we call the "customer wheel."
                                </li>
                                <li>
                                    <i class="las la-check"></i>
                                    We help you at every stage of growth.
                                </li>
                                <li>
                                    <i class="las la-check"></i>
                                    TUse only the appropriate actions of pursuit and avoidance; and even these lightly.
                                </li>
                                <li>
                                    <i class="las la-check"></i>
                                    TUse only the appropriate actions of pursuit and avoidance; and even these lightly.
                                </li>
                                <li>
                                    <i class="las la-check"></i>
                                    TUse only the appropriate actions of pursuit and avoidance; and even these lightly.
                                </li>
                            </ul>
                            <h3>A cleansing hot shower or bath</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                                irure
                                dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                                pariatur.
                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia. </p>
                            <!-- post quote -->
                            <blockquote>
                                <div class="icon">
                                    <i class="las la-quote-left"></i>
                                </div>
                                <h4>"Don't demand that things happen as you wish, but wish that they happen as they
                                    do
                                    happen, and you will go on well."</h4>
                                <span>Epictetus, The Enchiridion</span>
                            </blockquote>
                            <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#exampleModal" class="modal-dialog-centered">참가 신청하기</a>
                            <div class="modal fade comment-form" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered ">
                                    <div class="modal-content p-5">
                                        <div class="modal-header pb-0">
                                            <h1 class="modal-title fs-5 " id="exampleModalLabel">참가신청하기</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="#" method="POST">
                                                <div class="mb-3 form-floating">
                                                    <input type="text" class="form-control" id="floatingInput" placeholder="홍길동">
                                                    <label for="floatingInput">신청자</label>
                                                </div>
                                                <div class="mb-3 form-floating">
                                                    <input type="text" class="form-control" id="floatingInput" placeholder="커넥트">
                                                    <label for="floatingInput">기업명</label>
                                                </div>
                                                <div class="form-floating">
                                                    <input type="number" class="form-control" id="floatingInput" placeholder="3">
                                                    <label for="floatingInput">참가자 수</label>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer pt-0 button">
                                            <button type="button" class="btn">신청하기</button>
                                            <!-- <button type="button" class="btn out" data-bs-dismiss="modal">취소</button> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post-tags-media">
                            <a href="#">
                                <i class="las la-arrow-left"></i>
                                목록으로
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>