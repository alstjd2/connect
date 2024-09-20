<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<div class="container-xxl flex-grow-1 container-p-y blog-single ">
	<div class="py-4 mb-4 mt-10">
		<div class="demo-inline-spacing pb-5 d-flex justify-content-between">
			<a href="${cPath }/w/promotion/list.do" type="button"
				class="btn rounded-pill btn-outline-primary"> <i
				class='bx bx-arrow-back pe-2'></i> 뒤로가기
			</a>
		</div>
	</div>
	<div class="card my-5 py-10 px-10">
		<div class="detail-inner ">
			<!-- post meta -->
			<div class="row col-12">
				<div class="col-10">
					<h4 class="mb-0">
						이벤트 | <b>온라인</b>
					</h4>
					<h2 class="post-title mb-4 ">${promotion.board.boardTitle }</h2>
				</div>
				<div class="col-2">
					<div class="d-flex justify-content-between align-items-center"
						style="position: relative;"></div>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<c:if test="${today <= promotion.promoEnddate }">
						<h4>
							<span class="badge bg-label-warning">진행중</span>
						</h4>
					</c:if>
					<c:if test="${today >= promotion.promoEnddate }">
						<h4>
							<span class="badge bg-label-danger">진행마감</span>
						</h4>
					</c:if>
				</div>
				<hr>
			</div>
			<div class="board-content pb-0">
				<div class="post-thumbnils"></div>
				<p>${promotion.board.boardContent }</p>
			</div>

		</div>
		<div>
<!-- 			 <a href="javascript:;" data-bs-toggle="modal" -->
<!--                data-bs-target="#boardModal" class="btn btn-success modal-dialog-centered"> -->
<!--                                  수정하기</a> -->
<button class="btn btn-label-info"  data-bs-toggle="modal" data-bs-target="#boardModal">수정하기</button>
			<a href="#" id="boarDel" class="btn btn-label-dark">삭제하기</a>
		</div>
	</div>
</div>

<!-- 모달 -->
<div class="modal modal-xl" id="boardModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">

		<form class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="backDropModalTitle">게시글 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col mb-6">
						<input
							type="hidden" id="nameBackdrop" class="form-control"
							value="${promotion.board.boardNo }" >
						<label for="nameBackdrop" class="form-label">제목</label>
						<input
							type="text" id="nameBackdrop" class="form-control"
							value="${promotion.board.boardTitle }">
					</div>
				</div>
				<div class="row g-6">
					<div class="col mb-0">
						<label for="emailBackdrop" class="form-label">내용</label>
						<textarea name="boardContent" class="form-control pt-10 pb-10"
							style="height:50vh;" >${promotion.board.boardContent }
							</textarea>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</form>

	</div>
</div>

      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
   //모달 동작시
   var bModal = document.getElementById('boardModal');

      const editor = new toastui.Editor({
          el: document.querySelector('#bContent'), // 에디터를 적용할 요소 (컨테이너)
          height: '60vh',                        // 에디터 영역의 높이 값 (OOOpx || auto)
          initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
          initialValue: '${promotion.board.boardContent}',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
          previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)

      });

	   const title= document.querySelector("#boardTitle");
	   const content = document.querySelector("#bContent");
	   const text = document.querySelector('#boardContent');
       const myform = document.querySelector('#inputForm');

       function btnModal() {
           text.innerHTML = editor.getHTML();

           if (title.value == "" || title.value == null) {
              return errorSwal("제목을 작성해주세요.");
           }else if (text.value=="<p><br></p>" ) {
              return errorSwal("내용을 작성해주세요.");
           }else{
              return myform.submit();
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

