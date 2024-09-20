<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="py-4"><b>사용자</b>(기능별) 가이드</h4>
    <div class="col-xl-12">                                    
        <div class="row px-4 pt-0 pb-10">
            <a href="${cPath }/w/support/guideWrite.do" class="btn btn-success mt-0">가이드추가</a>
        </div>
        <div class="nav-align-left mb-6">
            <ul class="nav nav-pills me-4" role="tablist">
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-message" aria-controls="navs-pills-left-home" aria-selected="true">
                        메시지
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-mail" aria-controls="navs-pills-left-profile" aria-selected="false" tabindex="-1">
                        메일
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-calendar" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        캘린더
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-board" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        게시판
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-survey" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        설문
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-conference" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        화상회의
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-addressBook" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        주소록
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-drive" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        드라이브
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-document" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        문서결재
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-personnel" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        인사관리
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-left-attendance" aria-controls="navs-pills-left-messages" aria-selected="false" tabindex="-1">
                        근태관리
                    </button>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="navs-pills-left-message" role="tabpanel">
                    <div class="card text-center mb-4">
                        <div class="card-header">
                            <div class="nav-align-top">
                                <ul class="nav nav-pills" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-within-card-active" aria-controls="navs-pills-within-card-active" aria-selected="true">
                                        Active
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-within-card-link" aria-controls="navs-pills-within-card-link" aria-selected="false" tabindex="-1">
                                        Link
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="tab-content p-0">
                                <div class="tab-pane fade active show" id="navs-pills-within-card-active" role="tabpanel">
                                    <h4 class="card-title">Special active title</h4>
                                    <p class="card-text">
                                        With supporting text below as a natural lead-in to additional content.
                                    </p>
                                    <div class="text-end">
                                        <a href="" class="btn btn-secondary">수정</a>
                                        <a href="#" type="button" class="btn btn-danger">삭제</a>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="navs-pills-within-card-link" role="tabpanel">
                                    <h4 class="card-title">Special link title</h4>
                                    <p class="card-text">
                                        With supporting text below as a natural lead-in to additional content.
                                    </p>
                                    <div class="text-end">
                                        <button type="button" class="btn btn-secondary">수정</button>
                                        <button type="button" class="btn btn-danger">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-mail" role="tabpanel">
                    <div class="demo-inline-spacing row px-5">
                        <button type="button" class="btn btn-outline-primary">게시글 추가</button>
                    </div>
                    <p>
                        Donut dragée jelly pie halvah. Danish gingerbread bonbon cookie wafer candy oat cake ice
                        cream. Gummies halvah tootsie roll muffin biscuit icing dessert gingerbread. Pastry ice cream
                        cheesecake fruitcake.
                    </p>
                    <p class="mb-0">
                        Jelly-o jelly beans icing pastry cake cake lemon drops. Muffin muffin pie tiramisu halvah
                        cotton candy liquorice caramels.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-calendar" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-board" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-survey" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-conference" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-addressBook" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-drive" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-document" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-personnel" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
                <div class="tab-pane fade" id="navs-pills-left-attendance" role="tabpanel">
                    <p>
                        Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                        cupcake gummi bears cake chocolate.
                    </p>
                    <p class="mb-0">
                        Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                        roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                        jelly-o tart brownie jelly.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
