<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="py-4">이용약관</h4>
    <div class="col col-md-9 m-auto">       
        <form class="card-body">
            <span class="form-label">내용수정</span>
            <div id="full-editor"></div>
            <textarea id="textarea-content" name="content" style="display:none;"></textarea>
            <div class="row px-3 py-2">
                <button type="submit" class="btn btn-primary">수정하기</button>
            </div>
        </form>
    </div>
</div>

<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/katex.js"></script>
<script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/quill.js"></script>
<!-- Page JS -->
<script defer src="${cPath}/resources/webProvider/assets/js/forms-editors.js"></script>
