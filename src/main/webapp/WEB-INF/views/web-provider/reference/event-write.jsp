<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-xxl flex-grow-1 container-p-y blog-single ">
	<div class="py-4 mb-4 mt-10"> 
		<div class="demo-inline-spacing pb-5">
			<a href="event.html" type="button"
				class="btn rounded-pill btn-outline-primary"> <i
				class='bx bx-arrow-back pe-2'></i> 뒤로가기
			</a>
		</div>
	</div>
	<div class="mt-3">
		<div class="col col-md-9 m-auto">
			<div class="card mb-6">
				<h5 class="card-header">이벤트</h5>
				<form:form method="post" class="card-body"  enctype="multipart/form-data" modelAttribute="newEvent">

					<div class="row">
						<div class="mb-4 col-md-10">
							<label for="tilte" class="form-label">제목</label> <input
								type="text" class="form-control" id="tilte"
								placeholder="제목을 입력하세요">
						</div>
						<div class="mb-4 col-md-2">
							<label for="tilte" class="form-label">수용인원</label> <input
								type="number" class="form-control" id="tilte"
								placeholder="인원수">
						</div>
					</div>

					<div class="row">
						<div class="mb-4 col-md-6">
							<label for="proceed" class="form-label">진행방식</label> <select
								class="form-select" id="proceed"
								aria-label="Default select example">
								<option selected="">진행방식</option>
								<option value="1">오프라인</option>
								<option value="2">온라인</option>
								<option value="3">할인행사</option>
							</select>
						</div>
						<div class="mb-4 col-md-6">
							<label for="entry" class="form-label">모집여부</label> <select
								class="form-select" id="entry"
								aria-label="Default select example">
								<option selected="">모집여부</option>
								<option value="1">모집중</option>
								<option value="2">모집마감</option>
							</select>
						</div>


					</div>
					<div class="row">
						<div class="mb-4 col-md-6">
							<label for="event-start" class="form-label">이벤트 시작일시</label> <input
								class="form-control" type="datetime-local"
								value="2024-02-01T00:00:00" id="event-start">
						</div>
						<div class="mb-4 col-md-6">
							<label for="event-end" class="form-label">이벤트 종료일시</label> <input
								class="form-control" type="datetime-local"
								value="2024-09-23T12:00:00" id="event-end">
						</div>
					</div>
					<div class="mb-4">
						<span class="form-label">이벤트 내용</span>
						<div id="full-editor"></div>
						<textarea id="textarea-content" name="content"
							style="display: none;"></textarea>
					</div>
					<div class="row">
						<div class="mb-4 col-md-6">
							<input type="file" name="atchFile.fileDetails[0].uploadFile" class="form-control"/>
						</div>
						<div class="mb-4 col-md-6">
							<input type="file" name="atchFile.fileDetails[1].uploadFile" class="form-control"/>
						</div>
					</div>
					<div class="row p-2">
						<button type="button" class="btn btn-label-primary">등록하기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script defer
	src="${cPath}/resources/webProvider/assets/vendor/libs/quill/katex.js"></script>
<script defer
	src="${cPath}/resources/webProvider/assets/vendor/libs/quill/quill.js"></script>

<!-- Page JS -->
<script defer
	src="${cPath}/resources/webProvider/assets/js/forms-editors.js"></script>

<script defer>
	document.querySelector("form").onsubmit = function() {
		const quillContent = fullEditor.root.innerHTML; // Quill 에디터의 HTML 내용
		document.querySelector("#textarea-content").value = quillContent; // textarea에 저장
	};
</script>