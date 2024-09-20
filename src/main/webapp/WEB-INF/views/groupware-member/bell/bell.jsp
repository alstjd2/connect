<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <!-- 알림 설정 -->
                                <div class="card-body">
                                    <h5 class="mb-1">최근 기기</h5>
                                    <span class="card-subtitle">알림을 표시하려면 브라우저의 권한이 필요합니다.
                                        <span class="notificationRequest"><span class="text-primary">권한 요청하기</span></span>
                                    </span>
                                    <div class="error"></div>
                                </div>
                                
                                <form action="javascript:void(0);">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-nowrap">알림 유형</th>
                                                    <th class="text-nowrap text-center">이메일</th>
                                                    <th class="text-nowrap text-center">브라우저</th>
                                                    <th class="text-nowrap text-center">앱</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-nowrap text-heading">새로운 소식</td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck1" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck2" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck3" checked="">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap text-heading">계정 활동</td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck4" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck5" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck6" checked="">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap text-heading">새 브라우저로 로그인</td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck7" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck8" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck9">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-nowrap text-heading">새 기기 연결</td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck10" checked="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck11">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-check mb-0 d-flex justify-content-center align-items-center">
                                                            <input class="form-check-input" type="checkbox" id="defaultCheck12">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="mt-6 text-center">
                                                <button type="submit" class="btn btn-primary me-3">변경</button>
                                                <button type="reset" class="btn btn-label-secondary">리셋</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- /알림 설정 -->
                            </div>
                        </div>
                    </div>
                </div>