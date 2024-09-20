<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <div class=" m-auto">
        <div class="nav-align-top">
            <ul class="nav nav-pills flex-column flex-sm-row mb-6">
                <li class="nav-item">
                    <a class="nav-link active" href="javascript:void(0);">
                        <i class='bx bx-check-square bx-sm me-1_5'></i>
                        설문 탬플릿 관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cPath}/gw/survey/list.do">
                        <i class='bx bx-list-check bx-sm me-1_5'></i>
                        설문 전체
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="card m-auto">
        <h5 class="card-header d-flex justify-content-between align-items-center flex-wrap">
            <span class="fw-bold ">템플릿 리스트</span>
            <a href="${cPath}/gw/survey/templateCreate.do" class="btn rounded-pill btn-label-secondary">
                <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                새 탬플릿 생성
            </a>
        </h5>
        <div class="table-responsive text-nowrap">
            <table class="table table-hover border-bottom">
                <thead>
                    <tr>
                        <th>설문지 제목</th>
                        <th class="w-300p">비고</th>
                    </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                    <tr>
                        <td>회식 일정/메뉴 설문</td>
                        <td class="w-300p">
                            <a class="btn btn-sm rounded-pill btn-label-success" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i> 수정</a>
                            <a class="btn btn-sm rounded-pill btn-label-danger" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> 삭제</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <nav aria-label="Page navigation" class="pt-3 pb-5">
                <ul class="pagination pagination-rounded d-flex justify-content-center">
                    <li class="page-item first">
                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left bx-sm"></i></a>
                    </li>
                    <li class="page-item prev">
                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left bx-sm"></i></a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">2</a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="javascript:void(0);">3</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">4</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">5</a>
                    </li>
                    <li class="page-item next">
                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right bx-sm"></i></a>
                    </li>
                    <li class="page-item last">
                        <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right bx-sm"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>