<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Editor's Style -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<div class="container-xxl flex-grow-1 container-p-y blog-single ">

    <div class="py-4 mb-4 mt-10">
        <div class="demo-inline-spacing pb-5">
            <a href="${cPath }/w/promotion/list.do" type="button" class="btn rounded-pill btn-outline-primary">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>
        </div>
    </div>
    <div class="mt-3">
        <div class="col col-md-9 m-auto">
            <div class="card mb-6">
                <h5 class="card-header">이벤트</h5>

                <form:form id="boardForm" cssClass="card-body" modelAttribute="saleBoard">
                    <div class="mb-4">
                        <label for="boardTitle" class="form-label">제목</label>
                        <form:input type="text" class="form-control" path="boardTitle" placeholder="제목을 입력하세요" required="required"/>
                        <form:errors path="boardTitle" cssClass="btn-label-danger" />
                    </div>
                    <div class="row">
                        <div class="mb-4 ">
                            <label for="boardType" class="form-label">공지구분</label>
                            <form:select class="form-select"  path="boardType" aria-label="Default select example">
                                <form:option value="EB06110">할인행사</form:option>
                                <form:option value="EB06120">온라인교육</form:option>
                                <form:option value="EB06130">오프라인교육</form:option>
                            </form:select>
                            <form:errors path="boardType" cssClass="btn-label-danger" />
                        </div>
                    </div>
                    <div class="mb-4">
                        <span class="form-label">이벤트 내용</span>
						<div id="boardContent"></div>
                        <form:textarea id="bContent" path="boardContent" style="display:none;"  required="required"/>
                        <form:errors path="boardContent" cssClass="btn-label-danger" />
                    </div>
                    <div class="row px-3 py-2">
                        <button id="boardBtn" type="button" onclick="btnChk()" class="btn btn-label-primary">공지하기</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
		const editor = new toastui.Editor({
		    el: document.querySelector('#boardContent'), // 에디터를 적용할 요소 (컨테이너)
		    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
		    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
		    previewStyle: 'tab'                // 마크다운 프리뷰 스타일 (tab || vertical)
		});


        function btnChk() {
			const title= document.querySelector("#boardTitle");
			const content = document.querySelector("#boardContent");
			const text = document.querySelector('#bContent');
            text.innerHTML = editor.getHTML();

            if (title.value == "" || title.value == null) {
				errorSwal("제목을 작성해주세요.");
			}
			else if (text.value=="<p><br></p>") {
				errorSwal("내용을 작성해주세요.");

			}else{
				const myform = document.querySelector('#boardForm');
				const selectType = document.querySelector(".form-select");
				const type = selectType.value;


				myform.submit();
			}

		}


        function errorSwal(msg){
        	swal({
				title : msg,
				icon  : "error",
				closeOnClickOutside : false
				});
        }


</script>


<%-- <script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/katex.js"></script> --%>
<%-- <script defer src="${cPath}/resources/webProvider/assets/vendor/libs/quill/quill.js"></script> --%>

<!-- Page JS -->
<%-- <script defer src="${cPath}/resources/webProvider/assets/js/forms-editors.js"></script> --%>

<!-- <script defer>
     document.querySelector("form").onsubmit = function () {
         const quillContent = fullEditor.root.innerHTML; // Quill 에디터의 HTML 내용
         document.querySelector("#textarea-content").value = quillContent; // textarea에 저장
     };
 </script> -->