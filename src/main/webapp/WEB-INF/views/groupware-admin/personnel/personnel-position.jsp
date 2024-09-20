<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">

        <div class="col-lg-17 col-15 text-center">
            <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="fw-bold text-primary mb-3" style="font-size: 1.46rem; margin-top: 1.5px;">직급직책 관리</h5>
                    <div class="dropdown">
                        <button class="btn text-muted p-0" type="button" id="teamMemberList"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bx bx-dots-vertical-rounded bx-lg"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="teamMemberList">
                            <a class="dropdown-item" href="javascript:void(0);"><i
                                    class='bx bx-download'></i> EXCEL</a>
                        </div>
                    </div>

                </div>
                <div class="table-responsive">
                    <div class="d-flex mb-6 mx-8">
                        <form action="" method="get" class="d-flex">
                            <div class="input-group input-group-merge p-0 m-0 me-2">
                                <span class="input-group-text" id="basic-addon-search31"><i
                                        class="bx bx-search"></i></span>
                                <input type="text" class="form-control" name="searchName" placeholder="직급직책"
                                    aria-label="직원명" aria-describedby="basic-addon-search31"
                                    value="${param.searchName}">
                            </div>

                            <button type="submit" class="btn btn-dark">검색</button>
                        </form>
                        <a href="javascript:;" class="btn btn-secondary ms-10" role="button" data-bs-toggle="modal" data-bs-target="#editPerson">
                            <i class='bx bxs-user-account pe-2'></i>
                            수정하기
                        </a>
                        <a href="javascript:;" class="btn btn-primary ms-2" role="button" data-bs-toggle="modal" data-bs-target="#addPerson">
                            <i class='bx bxs-user-account pe-2'></i>
                            추가하기
                        </a>
                    </div>
                    <table class="table table-borderless table-sm dt-appointment-table">
                        <thead>
                            <tr class="border-bottom border-top">
                                <th>직급</th>
                                <th>직책</th>
                            </tr>
                        </thead>
                        <tbody>
                           <tr>
                                                    <td>
                                                        사장
                                                    </td>
                                                    <td>
                                                        임원
                                                    </td>
                                                </tr>
						   <tr>
                                                    <td>
                                                        이사
                                                    </td>
                                                    <td>
                                                        관리직
                                                    </td>
                                                </tr>

                           <tr>
                                                    <td>
                                                        부장
                                                    </td>
                                                    <td>
                                                        일반직
                                                    </td>
                                                </tr>
                           <tr>
                                                    <td>
                                                        과장
                                                    </td>
                                                    <td>
                                                        아르바이트
                                                    </td>
                                                </tr>
                           <tr>
                                                    <td>
                                                        대리
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                           <tr>
                                                    <td>
                                                        사원
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation">
    <ul class="pagination pagination-rounded justify-content-center py-10">
        <!-- First page -->
        <li class="page-item disabled">
            <a class="page-link" href="javascript:void(0);">
                <i class="tf-icon bx bx-chevrons-left bx-sm"></i>
            </a>
        </li>

        <!-- Previous page -->
        <li class="page-item disabled">
            <a class="page-link" href="javascript:void(0);">
                <i class="tf-icon bx bx-chevron-left bx-sm"></i>
            </a>
        </li>

        <!-- Page number 1 (current page) -->
        <li class="page-item active">
            <a class="page-link" href="javascript:void(0);">1</a>
        </li>

        <!-- Next page -->
        <li class="page-item disabled">
            <a class="page-link" href="javascript:void(0);">
                <i class="tf-icon bx bx-chevron-right bx-sm"></i>
            </a>
        </li>

        <!-- Last page -->
        <li class="page-item disabled">
            <a class="page-link" href="javascript:void(0);">
                <i class="tf-icon bx bx-chevrons-right bx-sm"></i>
            </a>
        </li>
    </ul>
</nav>

                </div>
            </div>









        </div>
    </div>
</div>
