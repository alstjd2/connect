<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="col-md-6 m-auto">
        <form action="">
            <div class="card">
                <h5 class="card-header">
                    템플릿 생성
                </h5>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="" class="form-label">설문지 제목</label>
                        <input type="text" class="form-control" id="" placeholder="설문지 제목을 입력하세요">
                    </div>
                    <div class="mb-4 pb-2 d-flex gap-5 flex-wrap border-bottom px-2">
                        <div class="form-check form-switch mb-2">
                            <input class="form-check-input" type="checkbox" id="" checked="">
                            <label class="form-check-label" for="">중요 설문 여부 </label>
                        </div>
                        <div class="form-check form-switch mb-2">
                            <input class="form-check-input" type="checkbox" id="" checked="">
                            <label class="form-check-label" for="">익명 투표 여부 </label>
                        </div>
                        <div class="form-check form-switch mb-2">
                            <input class="form-check-input" type="checkbox" id="" checked="">
                            <label class="form-check-label" for="">응답자 모두 응답 여부 </label>
                        </div>
                    </div>
                    <table class="w-100 ">
                        <tbody id="survey-list" class="pb-5">
                            <tr class="survey-container border-white border-bottom-10" id="survey-1">
                                <td class=" p-5 bg-light-subtle rounded">
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="survey-1-multi-select">
                                        <label class="form-check-label" for="survey-1-multi-select">복수 선택 여부</label>
                                    </div>
                                    <input type="text" class="form-control bg-white mb-4" id="" name="survey-1-title" placeholder="설문1 | 제목을 입력하세요.">
                                    <div class="questions-list" id="questions-list-1">
                                        <div class="question-container mb-2 ms-0 row w-100">
                                            <label for="question-1-1" class="col-md-1 col-form-label text-center fw-bold p-0">1</label>
                                            <div class="col-md-11 p-0">
                                                <input type="text" name="survey-1-question-1" id="question-1-1" class="form-control bg-white" placeholder="항목을 입력하세요">
                                            </div>
                                        </div>
                                        <div class="question-container mb-2 ms-0 row w-100">
                                            <label for="question-1-2" class="col-md-1 col-form-label text-center fw-bold p-0">2</label>
                                            <div class="col-md-11 p-0">
                                                <input type="text" name="survey-1-question-2" id="question-1-2" class="form-control bg-white" placeholder="항목을 입력하세요">
                                            </div>
                                        </div>
                                        <!-- 항목이 추가되는 영역 -->
                                    </div>
                                    <button type="button" class="btn  btn-label-secondary btn-sm w-100" onclick="addQuestion(1)">
                                        <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                                        항목 추가
                                    </button>
                                </td>
                            </tr>
                            <!-- 설문 폼이 추가되는 영역 -->
                        </tbody>
                        <tfoot class="w-100">
                            <tr class="survey-container">
                                <td>
                                    <button type="button" class="btn btn-outline-secondary btn-sm w-100" onclick="addSurvey()">
                                        <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                                        설문 추가
                                    </button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary w-100">생성하기</button>
                </div>
            </div>
        </form>
    </div>
</div>