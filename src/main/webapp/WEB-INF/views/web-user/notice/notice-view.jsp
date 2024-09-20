<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                    <li><a href="${cPath }/w/index.do">Home</a></li>
                    <li><a href="guide-start.html">참고자료</a></li>
                    <li><a href="${cPath}/w/notice/detailList.do?notice=notice">공지사항</a></li>
                    <li>업데이트</li>
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
                        ${board.boardTitle }
                    </h2>
                    <ul class="custom-flex post-meta">
                        <li>
                            <a href="#">
                                <i class="las la-calendar-check"></i>
                                ${board.boardDate }
                            </a>
                        </li>
                    </ul>
                    <hr />
                    <div class="board-content">

                        <p>
                            ${board.boardContent }
                        </p>
                        <!-- post image -->
                        <!-- post quote -->
                    </div>
                    <div class="post-tags-media">
                        <a href="${cPath }/w/notice/list.do">
                            <i class="las la-arrow-left"></i>
                            목록으로
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>