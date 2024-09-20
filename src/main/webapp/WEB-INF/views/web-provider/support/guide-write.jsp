<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="pt-5"><b>사용자</b>(기능별) 가이드</h4>
<div class="col-xl-12">                                    
    <div class="mb-6 ">
        <div class="demo-inline-spacing pb-5">
            <a href="guide-service.html" type="button" class="btn rounded-pill btn-outline-primary">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>
        </div>
    </div>
    <div class="mt-3">
        <div class="col col-md-9 m-auto">
            <div class="card mb-6">
                <h5 class="card-header">사용자 가이드 작성</h5>
                <form class="card-body">
                    <div class="mb-4">
                        <label for="tilte" class="form-label">가이드 제목</label>
                        <input type="text" class="form-control" id="tilte" placeholder="제목을 입력하세요" >
                    </div>
                    <div class="row">
                        <div class="mb-4 ">
                            <label for="proceed" class="form-label">기능구분</label>
                            <select class="form-select" id="proceed" aria-label="Default select example">
                                <option selected="">기능구분</option>
                                <option value="DA02131">메시지</option>
                                <option value="DA02132">메일</option>
                                <option value="DA02133">캘린더</option>
                                <option value="DA02134">게시판</option>
                                <option value="DA02135">설문</option>
                                <option value="DA02136">화상회의</option>
                                <option value="DA02137">주소록</option>
                                <option value="DA02138">드라이브 </option>
                                <option value="DA02139">문서결재 </option>
                                <option value="DA02140">인사관리</option>
                                <option value="DA02141">근태관리</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-4">
                        <span class="form-label">가이드 내용</span>
                        <div id="full-editor"></div>
                        <textarea id="textarea-content" name="content" style="display:none;"></textarea>
                        </div>
                        <div class="row px-3 py-2">
                            <button type="submit" class="btn btn-primary">작성하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/katex.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/quill.js"></script>

<!-- Page JS -->
<script defer src="${cPath}/resources/webProvider/assets/js/forms-editors.js"></script>

<script defer>
document.querySelector("form").onsubmit = function () {
    const quillContent = fullEditor.root.innerHTML; // Quill 에디터의 HTML 내용
    document.querySelector("#textarea-content").value = quillContent; // textarea에 저장
};
</script>
