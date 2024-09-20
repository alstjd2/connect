<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content-wrapper">
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="card mb-6" style=" background: transparent; box-shadow: none; ">
                            <nav class="navbar navbar-expand-lg bg-primary">
                                <div class="container-fluid">
                                    <a class="navbar-brand" href="javascript:void(0)">내 근로시간</a>
                                </div>
                            </nav>
                        </div>
                        <div class="card mb-12">
                            <div class="card-header d-flex align-items-center justify-content-between">
                                <div class="card-title mb-0">
                                    <h5 class="m-0 me-2 fw-bold">금주 출퇴근 현황</h5>
                                </div>
                                <div class="dropdown">
                                    <button class="btn p-0" type="button" id="vehiclesOverview" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded bx-lg text-muted"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="vehiclesOverview">
                                        <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-none d-lg-flex vehicles-progress-labels mb-6">
                                    <div class="vehicles-progress-label unloading-text" style="width: 79.0%">정상근무</div>
                                    <div class="vehicles-progress-label loading-text" style="width: 12.4%">지각</div>
                                    <div class="vehicles-progress-label waiting-text text-nowrap" style="width: 8.6%">조퇴</div>
                                </div>
                                <div class="vehicles-overview-progress progress rounded-3 mb-6 bg-transparent overflow-hidden" style="height: 46px">
                                    <div class="progress-bar fw-medium text-start shadow-none bg-primary px-4 rounded-0" role="progressbar"
                                    style="width: 79.0%" aria-valuenow="79.0" aria-valuemin="0" aria-valuemax="100">
                                        79.0%
                                    </div>
                                    <div class="progress-bar fw-medium text-start shadow-none text-bg-info px-2 px-sm-4" role="progressbar"
                                    style="width: 12.4%" aria-valuenow="12.4" aria-valuemin="0" aria-valuemax="100">
                                        12.4%
                                    </div>
                                    <div class="progress-bar fw-medium text-start shadow-none snackbar text-paper px-1 px-sm-3 rounded-0 px-lg-4" role="progressbar"
                                    style="width: 8.6%" aria-valuenow="8.6" aria-valuemin="0" aria-valuemax="100">
                                        8.6%
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table card-table table-border-top-0">
                                        <tbody class="table-border-bottom-0">
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class='bx bx-time bx-lg text-heading'></i>
                                                        </div>
                                                        <h6 class="mb-0 fw-normal">정상근무</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">41시간 08분</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span>79.0%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                        </div>
                                                        <h6 class="mb-0 fw-normal">지각</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">06시간 04분</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span>12.4%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="w-50 ps-0">
                                                    <div class="d-flex justify-content-start align-items-center">
                                                        <div class="me-2">
                                                            <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                        </div>
                                                        <h6 class="mb-0 fw-normal">조퇴</h6>
                                                    </div>
                                                </td>
                                                <td class="text-end pe-0 text-nowrap">
                                                    <h6 class="mb-0">04시간 04분</h6>
                                                </td>
                                                <td class="text-end pe-0">
                                                    <span>8.6%</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <h5 class="card-header fw-bold">금주 날짜별 출퇴근</h5>
                            <div class="table-responsive text-nowrap">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>출근 시간</th>
                                            <th>퇴근 시간</th>
                                            <th>지각 여부</th>
                                            <th>조퇴 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                        <tr>
                                            <td>
                                                <i class='bx bx-calendar'></i>
                                                <span>08/12</span>
                                            </td>
                                            <td>
                                                <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                08:48
                                            </td>
                                            <td>
                                                <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                18:00
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <i class='bx bx-calendar'></i>
                                                <span>08/13</span>
                                            </td>
                                            <td>
                                                <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                08:48
                                            </td>
                                            <td>
                                                <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                18:00
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <i class='bx bx-calendar'></i>
                                                <span>08/14</span>
                                            </td>
                                            <td>
                                                <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                08:48
                                            </td>
                                            <td>
                                                <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                18:00
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <i class='bx bx-calendar'></i>
                                                <span>08/15</span>
                                            </td>
                                            <td>
                                                <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                08:48
                                            </td>
                                            <td>
                                                <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                14:50
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                            <td>
                                                <span class="badge bg-label-warning me-1">조퇴</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <i class='bx bx-calendar'></i>
                                                <span>08/16</span>
                                            </td>
                                            <td>
                                                <i class="bx bx-up-arrow-circle bx-lg text-heading"></i>
                                                09:08
                                            </td>
                                            <td>
                                                <i class="bx bx-down-arrow-circle bx-lg text-heading"></i>
                                                18:00
                                            </td>
                                            <td>
                                                <span class="badge bg-label-danger me-1">지각</span>
                                            </td>
                                            <td>
                                                <span class="badge bg-label-success me-1">정상</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <script defer src="${cPath}/resources/groupwareMember/assets/js/myInfo-commute.js"></script>