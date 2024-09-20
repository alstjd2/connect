<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
        <div class="demo-inline-spacing pb-5">
            <a href="membership.html" type="button" class="btn rounded-pill btn-outline-primary">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>
        </div>
        <div class="row">
            <!-- User Sidebar -->
       <div class="col-xl-4 col-lg-5 order-1 order-md-0">
           <!-- User Card -->
           <div class="card mb-6">
               <div class="card-body pt-12">
                   <div class="user-avatar-section">
                       <div class="d-flex align-items-center flex-column">

                           <div class="user-info text-center">
                               <h3 class="fw-bold">HDC</h3>
                               <span class="badge bg-label-secondary">철회</span>
                           </div>
                       </div>
                   </div>
                   <div
                       class="d-flex justify-content-around flex-wrap my-6 gap-0 gap-md-3 gap-lg-4">
                       <div class="d-flex align-items-center me-5 gap-4">
                           <div class="avatar">
                               <div
                                   class="avatar-initial bg-label-primary rounded w-px-40 h-px-40">
                                   <i class="bx bx-check bx-lg"></i>
                               </div>
                           </div>
                           <div>
                               <h5 class="mb-0">담당자</h5>
                               <span>김태희</span>
                           </div>
                       </div>
                       <div class="d-flex align-items-center gap-4">
                           <div class="avatar">
                               <div
                                   class="avatar-initial bg-label-primary rounded w-px-40 h-px-40">
                                   <i class="bx bx-customize bx-lg"></i>
                               </div>
                           </div>
                           <div>
                               <h5 class="mb-0">ID</h5>
                               <span>A001</span>
                           </div>
                       </div>
                   </div>
                   <h5 class="pb-4 border-bottom mb-4">Details</h5>
                   <div class="info-container">
                       <ul class="list-unstyled mb-6">
                           <li class="mb-2">
                               <span class="h6">이름:</span>
                               <span>김태희</span>
                           </li>
                           <li class="mb-2">
                               <span class="h6">Email:</span>
                               <span>sVhcIl6563@daum.net</span>
                           </li>
                           <li class="mb-2">
                               <span class="h6">성별:</span>
                               <span>여성</span>
                           </li>
                           <li>
                               <hr/>
                           </li>
                           <li class="mb-2">
                               <span class="h6">사업자명:</span>
                               <span>HDC</span>
                           </li>
                           <li class="mb-2">
                               <span class="h6">사업자번호:</span>
                               <span>370-19-4952</span>
                           </li>
                           <li class="mb-2">
                               <span class="h6">대표자:</span>
                               <span>남분옥</span>
                           </li>
                           <li class="mb-2">
                               <span class="h6">주소:</span>
                               <span>대전시 하단학구 위뜸동 88번지</span>
                           </li>
                       </ul>
                   </div>
                   <div class="d-flex justify-content-center">
                       <a href="javascript:;" class="btn btn-label-danger suspend-user">사용 중지 처리</a>
                   </div>
               </div>
           </div>
           <!-- /User Card -->
       </div>
       <!--/ User Sidebar -->

       <!-- User Content -->
       <div class="col-xl-8 col-lg-7 order-0 order-md-1">

           <!-- 직원테이블 -->
           <div class="card mb-4">
               <div class="card-datatable table-responsive">
                   <h5 class="card-header pb-0 text-sm-start text-center">직원 리스트</h5>
                   <div class="list-group p-4 pb-0">
                       <a href="javascript:void(0);"
                           class="list-group-item list-group-item-action d-flex justify-content-between">
                           <div class="li-wrapper d-flex justify-content-start align-items-center">
                               <div class="avatar me-3">
                                   <span class="avatar-initial rounded-circle bg-label-success">공</span>
                               </div>
                               <div class="list-content">
                                   <h6 class="mb-0">김태희</h6>
                                   <small class="text-muted">재무팀(관리직|과장)</small>
                               </div>
                           </div>
                           <small>입사일 2000/09/19</small>
                       </a>
                       <a href="javascript:void(0);"
                           class="list-group-item list-group-item-action d-flex justify-content-between">
                           <div class="li-wrapper d-flex justify-content-start align-items-center">
                               <div class="avatar me-3">
                                   <span
                                       class="avatar-initial rounded-circle bg-label-danger">맹</span>
                               </div>
                               <div class="list-content">
                                   <h6 class="mb-0">맹동승</h6>
                                   <small class="text-muted">기획팀(일반직|대리)</small>
                               </div>
                           </div>
                           <small>입사일 2004/12/16</small>
                       </a>
                       <a href="javascript:void(0);"
                           class="list-group-item list-group-item-action d-flex justify-content-between">
                           <div class="li-wrapper d-flex justify-content-start align-items-center">
                               <div class="avatar me-3">
                                   <span
                                       class="avatar-initial rounded-circle bg-label-primary">윤</span>
                               </div>
                               <div class="list-content">
                                   <h6 class="mb-0">윤항장</h6>
                                   <small class="text-muted">개발1부(관리직|부장)</small>
                               </div>
                           </div>
                           <small>입사일 1996/12/24</small>
                       </a>
                       <a href="javascript:void(0);"
                           class="list-group-item list-group-item-action d-flex justify-content-between">
                           <div class="li-wrapper d-flex justify-content-start align-items-center">
                               <div class="avatar me-3">
                                   <span
                                       class="avatar-initial rounded-circle bg-label-primary">홍</span>
                               </div>
                               <div class="list-content">
                                   <h6 class="mb-0">홍해누</h6>
                                   <small class="text-muted">경영2부(관리직|부장)</small>
                               </div>
                           </div>
                           <small>입사일 1998/07/12</small>
                       </a>
                   </div>
               </div>
           </div>
           <!-- /직원테이블 -->

           <div class="card mb-6">
               <h5 class="card-header">결제 상황</h5>
               <div class="card-body">
                   <div class="row row-gap-4 row-gap-xl-0">
                       <div class="col-xl-12 order-1 order-xl-0">
                           <div class="mb-4">
                               <h6 class="mb-1">현재 요금제</h6>
                               <p>월간 결재 36,000원</p>
                           </div>
                           <div class="plan-statistics d-flex">
                               <div class="col-md-9">
                                   <div class="d-flex justify-content-between">
                                       <h6 class="mb-1">Days</h6>
                                       <h6 class="mb-1">26 of 30 Days</h6>
                                   </div>
                                   <div class="progress mb-1" style="height: 10px">
                                       <div class="progress-bar w-75" role="progressbar"
                                           aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                       </div>
                                   </div>
                                   <small>그룹웨어 사용가능기간</small>
                               </div>
                               <div class="col-md-3 text-center">
                                   <button class="btn btn-primary me-4" data-bs-toggle="modal" data-bs-target="#upgradePlanModal">
                                       전체결제 내역보기
                                   </button>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <!--/ User Content -->
    </div>

</div>