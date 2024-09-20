<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h2 class="py-4 mb-6 fw-light"><b>${company.comNm} 관리자</b>님, 안녕하세요.</h2>
    <div class="row mx-0 g-3">
        <div class="col-md-3 col-12">
            <a href="${cPath}/gw/company/companyInfoUpdate.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-buildings'></i>
                    기업
                </p>
                <p class="px-5 fw-light text-start">기업 정보 변경, 회사 심볼 및 파비콘 관리,  사이트 컬러 관리, 레이아웃 관리</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath}/gw/organization/adminOrganization.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-group'></i>
                    조직
                </p>
                <p class="px-5 fw-light text-start">조직 생성/수정/삭제, 조직별 정보 및 기능관리</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath}/gw/adminEmployee/adminEmployeeList.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-user'></i>
                    직원
                </p>
                <p class="px-5 fw-light text-start">직원 생성/수정/삭제, 직원별 정보 및 기능관리</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/attendance/attendanceList.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class="menu-icon tf-icons bx bx-transfer-alt"></i>
                    근태시간
                </p>
                <p class="px-5 fw-light text-start">직원별 근태 시간 확인</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/application/vacation.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-calendar-check'></i>
                    부재현황
                </p>
                <p class="px-5 fw-light text-start">직원별 부재 신청 및 내역 확인</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/vacation/vacationList.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-calendar-plus' ></i>
                    부재항목
                </p>
                <p class="px-5 fw-light text-start">회사 부재 생성/수정/삭제</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/document/documentNumber.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-edit'></i>
                    문서번호
                </p>
                <p class="px-5 fw-light text-start">회사 문서번호 관리</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/document/list.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class="menu-icon tf-icons bx bx-file"></i>
                    문서
                </p>
                <p class="px-5 fw-light text-start">회사 내 전체 문서 확인</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/todoList/comTodoList.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-calendar'></i>
                    회사 캘린더
                </p>
                <p class="px-5 fw-light text-start">회사 구성원 전체가 공유하는 일정관리</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/board/gubun.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-receipt'></i>
                    게시판
                </p>
                <p class="px-5 fw-light text-start">게시판 카테고리 생성/수정/삭제, 회사 내 전체 게시글 확인</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath }/gw/room/roomList.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-clinic' ></i>
                    회의실
                </p>
                <p class="px-5 fw-light text-start">회의실 생성/수정/삭제</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
        <div class="col-md-3 col-12">
            <a href="${cPath}/gw/survey/template.do" class="btn btn-outline-dark d-flex flex-column align-items-start bg-white border-0 py-3 px-5 position-relative overflow-hidden justify-content-start text-dark h-100">
                <p class="fw-bold fs-5 pt-3 px-5">
                    <i class='menu-icon tf-icons bx bx-check-square'></i>
                    설문
                </p>
                <p class="px-5 fw-light text-start">설문 생성/수정/삭제, 설문 전체보기</p>
                <i class='bx bx-arrow-back tf-icons fs-3 position-absolute act-arrow'></i>
            </a>
        </div>
    </div>
    
    <section class="services style2 pb-5 pt-10 border-top mt-10">
            <div class="single-head">
                <div class="row g-5 mx-0">
                	<div class="col-md-6 order-lg-1 order-2">
	                  <div class="card">
	                    <div class="d-flex align-items-end row">
	                      <div class="col-7">
	                        <div class="card-body">
	                          <h5 class="card-title mb-1 text-nowrap">관리자 가이드</h5>
	                          <p class="card-subtitle text-nowrap mb-3">관리자를 어떻게 사용해야 할지 모르겠다면?</p>
	                          <p class="mb-3">기업정보 및 구성원(직원) 설정 등 우리 회사에 맞는 환경을 설정 할 수 있어요.</p>
	
	                          <a href="${cPath }/gw/company/guide-admin.do" class="btn btn-sm btn-primary">자세히보기</a>
	                        </div>
	                      </div>
	                      <div class="col-5">
	                        <div class="card-body text-end">  
	                          <img src="${cPath}/resources/webUser/assets/images/guide/guide2.png" width="147" height="137" class="rounded-start" alt="View Sales">
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
                	<div class="col-md-6 order-lg-1 order-2">
	                  <div class="card">
	                    <div class="d-flex align-items-end row">
	                      <div class="col-7">
	                        <div class="card-body">
	                          <h5 class="card-title mb-1 text-nowrap">사용자 가이드</h5>
	                          <p class="card-subtitle text-nowrap mb-3">그룹웨어 기능을 어떻게 사용해야 할지 모르겠다면?</p>
	                          <p class="mb-3">메시지부터 문서결재까지 그룹웨어를 사용하는 방법을 알아보세요.</p>
	                          <a href="${cPath }/gw/company/guide-service.do" class="btn btn-sm btn-primary">자세히보기</a>
	                        </div>
	                      </div>
	                      <div class="col-5">
	                        <div class="card-body text-end">  
	                          <img src="${cPath}/resources/webUser/assets/images/guide/guide3.png" width="147" height="137" class="rounded-start" alt="View Sales">
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
                </div>
            </div>
    </section>
    <!-- <div class="row mx-0 pt-5">
        <div>이 부분에 지원문의 파트 부분 연결 (가이드) </div>
        <div></div>
        <div></div>
    </div> -->
</div>
<div class="content-backdrop fade"></div>