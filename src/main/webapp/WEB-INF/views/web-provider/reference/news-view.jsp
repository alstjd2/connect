<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-xxl flex-grow-1 container-p-y blog-single ">
    <div class="py-4  mb-4 mt-10">
        <div class="demo-inline-spacing pb-5 d-flex justify-content-between">
            <a href="${cPath }/w/notice/list.do" type="button" class="btn rounded-pill btn-outline-primary">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>

        </div>
    </div>
	<div class="mt-4">
		<div class="detail-inner  ">
			<div class="mb-5 pb-1 col-12 row justify-content-between mx-0">
				<div class="post-title card col-8 mb-0">
					<div class="card-body">
						<h4 class="mb-0">
							공지사항 | <b>${board.commoncodeDetail.conmcdCode }</b>
						</h4>
						<hr>
						<h2 class="post-title py-1 px-5">${board.boardTitle }</h2>
					</div>
				</div>
				<div class="card post-title col-3">
					<div class="card-body">
						<div
							class="card-title d-flex align-items-start  mb-4">
						</div>
						<p class="mb-1">등록날짜</p>
						<h4 class="card-title mb-3">${board.boardDate }</h4>
							<div>
								<button class="btn btn-label-info"  data-bs-toggle="modal" data-bs-target="#exampleModal">수정하기</button>
								<a href="#" class="btn btn-label-danger">삭제하기</a>
							</div>
					</div>
				</div>
			</div>
			<!-- post meta -->
			<div class="board-content py-5 px-5 card row  mx-0">
				<div class="card-body">
					<p>내용</p>
					<hr>
					<p>${board.boardContent }</p>
				</div>
			</div>
		</div>

	</div>
</div>


<!-- 모달을 실행할 버튼 -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
<!--   Launch demo modal -->
<!-- </button> -->

<!-- 모달 -->
<div class="modal modal-xl" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							value="${board.boardNo }" >
						<label for="nameBackdrop" class="form-label">제목</label>
						<input
							type="text" id="nameBackdrop" class="form-control"
							value="${board.boardTitle }">
					</div>
				</div>
				<div class="row g-6">
					<div class="col mb-0">
						<label for="emailBackdrop" class="form-label">내용</label>
						<textarea
							type="email" id="emailBackdrop" class="form-control pt-10 pb-10"
							style="height:50vh;" >${board.boardContent }
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


