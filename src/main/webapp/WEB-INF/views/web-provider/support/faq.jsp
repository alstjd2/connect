<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="py-4">FAQ</h4>
    <div class="card">
        <div class="table-responsive text-nowrap w-100">
            <table class="table w-100">
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>내용</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody class="table-border-bottom-0 w-100">
                    <tr >
                        <td>
                            자주묻는 질문
                        </td>
                        <td class="d-inline-block text-truncate" style="max-width: 300px;">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                        </td>
                        <td >
                            <div class="dropdown">
                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                    <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#onboardImageModal"><i class="bx bx-edit-alt me-1"></i> Edit</button>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> Delete</a>
                                </div>
                            </div>
                            
                            <div class="modal-onboarding modal fade animate__animated" id="onboardImageModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content text-center">
                                        <div class="modal-body p-0">
                                            <div class="onboarding-content mb-0">
                                                <h4 class="onboarding-title text-body">FAQ 수정</h4>
                                                <form>
                                                    <div class="g-6">
                                                        <div class="">
                                                            <div class="mb-4">
                                                                <label for="tilte" class="form-label">제목</label>
                                                                <input class="form-control" placeholder="자주묻는 질문" type="text" value="" tabindex="0" id="tilte" />
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <div class="mb-4">
                                                                <label for="content" class="form-label">내용</label>
                                                                <textarea id="basic-default-message" class="form-control" placeholder="질문 대답"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer border-0">
                                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <nav aria-label="Page navigation" class="pt-10">
        <ul class="pagination pagination-rounded pagination-outline-primary justify-content-center">
            <li class="page-item first">
                <a class="page-link" href="javascript:void(0);"><i
                        class="tf-icon bx bx-chevrons-left bx-sm"></i></a>
            </li>
            <li class="page-item prev">
                <a class="page-link" href="javascript:void(0);"><i
                        class="tf-icon bx bx-chevron-left bx-sm"></i></a>
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
                <a class="page-link" href="javascript:void(0);"><i
                        class="tf-icon bx bx-chevron-right bx-sm"></i></a>
            </li>
            <li class="page-item last">
                <a class="page-link" href="javascript:void(0);"><i
                        class="tf-icon bx bx-chevrons-right bx-sm"></i></a>
            </li>
        </ul>
    </nav>
</div>

<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/katex.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/quill.js"></script>
<!-- Page JS -->
<script defer src="${cPath}/resources/webProvider/assets/js/ui-modals.js"></script>
