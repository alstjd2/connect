<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Editor's Style -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<div class="container-xxl flex-grow-1 container-p-y blog-single ">

    <div class="py-4 mb-4 mt-10">
        <div class="demo-inline-spacing pb-5">
            <a href="${cPath }/w/notice/list.do" type="button" class="btn rounded-pill btn-outline-primary">
                <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
            </a>
        </div>
    </div>
    <div class="mt-3">
        <div class="col col-md-9 m-auto">
            <div class="card mb-6">
                <h5 class="card-header">이벤트</h5>

                <form:form id="boardForm" cssClass="card-body" action="${cPath }/w/eventWrite/saleForm.do" modelAttribute="newBoard">
                    <div class="mb-4">
                        <label for="boardTitle" class="form-label">제목</label>
                        <form:input type="text" class="form-control" path="boardTitle"  value="${newBoard.boardTitle }" placeholder="제목을 입력하세요" required="required"/>
                        <form:errors path="boardTitle" cssClass="btn-label-danger" />
                    </div>
                    <div class="row">
                        <div class="mb-4 ">
                            <label for="boardType" class="form-label">이벤트 구분</label>
                            <form:select class="form-select"  path="boardType" aria-label="Default select example" value="${newBoard.boardType }" >
                                <form:option value="EB06110">할인행사</form:option>
                                <form:option value="EB06120">온라인교육</form:option>
                                <form:option value="EB06130">오프라인교육</form:option>
                            </form:select>
                            <form:errors path="boardType" cssClass="btn-label-danger" />
                        </div>
                    </div>

					<div class="row col-12 mx-0">
						<div class="mb-2 col-6 ps-0">
							<label for="promotion.promoStdate" class="form-label">시작날짜</label>
							<form:input type="date" class="form-control"
								path="promotion.promoStdate" placeholder="상세 내용을 입력하세요"  required="required" />
							<form:errors path="promotion.promoStdate"
								cssClass="btn-label-danger" />
						</div>
						<div class="mb-2 col-6 pe-0">
							<label for="promotion.promoEnddate" class="form-label">종료날짜</label>
							<form:input type="date" class="form-control"
								path="promotion.promoEnddate" placeholder="상세 내용을 입력하세요"  required="required"/>
							<form:errors path="promotion.promoEnddate" cssClass="btn-label-danger" />
						</div>
					</div>

					<!-- off -->
					<div id="offInput" style="display: none">
						<div class="row col-12 mx-0">
							<div class="mb-2 col-10 pe-0"></div>
							<div class="mb-2 col-2 pe-0 ">
								<label for="promotion.promoNum" class="form-label">수용인원</label>
								<form:input type="number" class="form-control"
									path="promotion.promoNum" placeholder="ex) 35"  required="required" />
								<form:errors path="promotion.promoNum"
									cssClass="btn-label-danger" />
							</div>
						</div>
					</div>

					<!-- sale -->
					<div id="saleInput" style="display:none">
						<div class="row col-12 mx-0">
							<div class="mb-4 col-6  ps-0 ">
								<label for="prod.prodNm" class="form-label">상품명</label>
								<form:input type="text" class="form-control" path="prod.prodNm"
									placeholder="ex)봄맞이 세일 월간건"  required="true"/>
								<form:errors path="prod.prodNm" cssClass="btn-label-danger" />
							</div>
							<div class="mb-4 col-6 pe-0 ">
								<label for="prod.prodPrice" class="form-label">가격</label>
								<form:input type="number" class="form-control"
									path="prod.prodPrice" placeholder="ex) 35000"  required="required" />
								<form:errors path="prod.prodPrice" cssClass="btn-label-danger" />
							</div>
						</div>
						<div class="row col-12 mx-0">
							<div class="mb-4 col-6 ps-0">
								<label for="prod.prodUseDay" class="form-label">사용날짜</label>
								<form:select class="form-select seleP" path="prod.prodUseDay"
									aria-label="Default select example">
									<form:option value="30" select="">월간건(30일)</form:option>
									<form:option value="365">연간건(365일)</form:option>
								</form:select>
								<form:errors path="prod.prodUseDay" cssClass="btn-label-danger" />
							</div>
							<div class="mb-4 col-6 pe-0">
								<label for="prod.prodDetailContent1" class="form-label">요약
									내용</label>
								<form:input type="text" class="form-control"
									path="prod.prodDetailContent1" placeholder="요약 내용을 입력하세요"  required="required" />
								<form:errors path="prod.prodDetailContent1"
									cssClass="btn-label-danger" />
							</div>
						</div>
						<div class="mb-4 mx-0">
							<label for="prod.prodDetailContent2" class="form-label">상세
								내용</label>
							<form:input type="text" class="form-control"
								path="prod.prodDetailContent2" placeholder="상세 내용을 입력하세요"  required="required" />
							<form:errors path="prod.prodDetailContent2"
								cssClass="btn-label-danger" />
						</div>
					</div>
					<div class="mb-4">
                        <span class="form-label">이벤트 내용</span>
						<div id="boardContent"></div>
                        <form:textarea id="bContent" path="boardContent" style="display:none;"  required="required" />
                        <form:errors path="boardContent" cssClass="btn-label-danger" />
                    </div>
                    <div class="row px-3 py-2">
                        <button id="btn" type="button" class="btn btn-label-primary">등록하기</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>



<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
	const msg = `${massage}` ;
	if(msg){
			swal({
				title : "게시글 작성이 실패되었습니다",
				icon  : "error",
				closeOnClickOutside : false
				}).then(function(){
				location.href="${cPath}/w/eventWrite/saleForm.do";
	});
	}


	const select = document.getElementById('boardType');

	select.addEventListener('change', function() {
		const divSale = document.getElementById('saleInput');
		const divOff = document.getElementById('offInput');
		const op = select.value;
		const off = divOff.querySelectorAll('input');
		const saleS = document.querySelector('.seleP');
		const sale = divSale.querySelectorAll('input');

		if (op == 'EB06110') {
			//할인행사
			divSale.style.display = "block";
			divOff.style.display = "none";

			// 각 input 요소에 disabled 속성 추가
			off.forEach((element) => {
				element.disabled = true;
			 });

			sale.forEach((element) => {
				element.disabled = false;
			 });
			saleS.disabled = false;

		}
		if (op == 'EB06120') {
			//온라인교육
			divSale.style.display = "none";
			divOff.style.display = "none";
			off.forEach((element) => {
				element.disabled = true;
			 });
			sale.forEach((element) => {
				element.disabled = true;
			 });
			saleS.disabled = true;
		}
		if (op == 'EB06130') {
			//오프라인교육
			divSale.style.display = "none";
			divOff.style.display = "block";
			off.forEach((element) => {
				element.disabled = false;
			 });

			sale.forEach((element) => {
				element.disabled = true;
			 });
			saleS.disabled =  true;

		}

	});

	const editor = new toastui.Editor({
		el : document.querySelector('#boardContent'), // 에디터를 적용할 요소 (컨테이너)
		height : '500px', // 에디터 영역의 높이 값 (OOOpx || auto)
		initialEditType : 'markdown', // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
// 		initialValue : '내용을 입력해 주세요.', // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
		previewStyle : 'tab' // 마크다운 프리뷰 스타일 (tab || vertical)

	});

	const btn = document.querySelector("#btn");

	btn.addEventListener("click", function() {
		const text = document.querySelector('#bContent');
		if(editor.getHTML() == "<p><br></p>"){
			swal({
				title : "내용을 작성해주세요",
				icon  : "error",
				closeOnClickOutside : false
				}).then(function(){
			});

		}else{
			const myform = document.querySelector('#boardForm');
			console.log("출력", text);
			text.innerHTML = editor.getHTML();
			myform.submit();
		}


	});
</script>


