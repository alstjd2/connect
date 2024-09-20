<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>\

<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<div class="container-xxl flex-grow-1 container-p-y blog-single ">
   <div class="py-4 mb-4 mt-10">
      <div class="demo-inline-spacing pb-5 d-flex justify-content-between">
         <a href="${cPath }/w/promotion/list.do" type="button"
            class="btn rounded-pill btn-outline-primary">
            <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
         </a>
      </div>
   </div>
   <div class="card my-5 py-10 px-10">
      <div class="detail-inner ">
         <!-- post meta -->
         <div class="row col-12">
            <div class="col-10">
               <h4 class="mb-0">
                  이벤트 | <b>행사세일</b>
               </h4>
               <h2 class="post-title mb-4 ">${promotion.board.boardTitle }</h2>
            </div>
            <div class="col-2">
               <div class="d-flex justify-content-between align-items-center"
                  style="position: relative;"></div>
               <c:set var="now" value="<%=new java.util.Date()%>" />
               <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
               <c:if test="${today <= promotion.promoEnddate }">
                  <h4><span class="badge bg-label-warning">진행중</span></h4>
               </c:if>
               <c:if test="${today >= promotion.promoEnddate }">
                  <h4><span class="badge bg-label-danger">진행마감</span></h4>
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
<!--          <a href="javascript:;" data-bs-toggle="modal" -->
<!--                data-bs-target="boardModal" class="btn btn-success modal-dialog-centered"> -->
<!--                                  수정하기</a> -->
	<button class="btn btn-label-info"  data-bs-toggle="modal" data-bs-target="#boardModal">수정하기</button>
         <a href="#" id="boarDel" class="btn btn-label-dark">삭제하기</a>
      </div>
   </div>
      <%-- <!-- 구매 그래프  -->
          <div class=" row card col-8 mb-5 mt-10">
             <h4 class="post-title mb-4 pt-3 "><b>구매 현황</b></h4>
             <div>
                   <canvas id="barChart" class="chartjs pb-10 px-5" data-height="400"></canvas>
             </div>
            </div> --%>

   <div class="card my-5 py-10 px-5">
      <div class="row justify-content-around">
         <div class="col-8">
            <!-- 구매 그래프  -->
            <h4 class="post-title mb-10 pt-3 ">
               <b>구매 현황</b>
            </h4>
            <div>
               <canvas id="barChart" class="chartjs pb-10 px-5" data-height="400"></canvas>
            </div>
         </div>

         <div class="col-4">
            <!-- Current Plan -->
            <h4 class="post-title mb-10 pt-3 ">
               <b>등록 상품</b>
            </h4>
            <div class="card-body justify-content-between align-items-start">

               <c:choose>
                  <c:when test="${empty promotion.prod.prodNo }">
                     <b>등록 상품 미존재</b>
                  </c:when>
                  <c:otherwise>
                     <div class="col-12 mb-1">
                        <div class="mb-10">
                           <div class="">
                              <span class="badge bg-label-primary ">${promotion.prod.prodNm }</span>
                              <div class="">
                                 <h1 class="mb-0 text-primary">
                                    <fmt:formatNumber type="currency" maxFractionDigits="3"
                                       value="${promotion.prod.prodPrice }" />
                                 </h1>
                              </div>
                           </div>
                        </div>

                        <div class="mb-2">
                           <ul class="list-unstyled g-2 my-6">
                              <li class="mb-2 d-flex align-items-center">
                                 <i class="bx bxs-circle bx-6px text-secondary me-2"></i>
                                 <span>등록일시 :${promotion.board.boardDate } </span>
                              </li>
                              <li class="mb-2 d-flex align-items-center">
                                 <i class="bx bxs-circle bx-6px text-secondary me-2"></i>
                                 <span>시작일시:
									<fmt:parseDate value="${promotion.prod.prodEvenStart }" var="registered1" pattern="yyMMdd" />
									<fmt:formatDate value="${registered1}" pattern="yyyy-MM-dd"  var="strDate"/>
                                 ${strDate } </span>
                              </li>
                              <li class="mb-2 d-flex align-items-center">
                                 <i class="bx bxs-circle bx-6px text-secondary me-2"></i>
                                 <span>종료일시:
									<fmt:parseDate value="${promotion.prod.prodEvnEnd }" var="registered2" pattern="yyMMdd" />
									<fmt:formatDate value="${registered2}" pattern="yyyy-MM-dd"  var="endDate"/>
                                 ${endDate }</span>
                              </li>
                              <li class="mb-2 d-flex align-items-center">
                                 <i class="bx bxs-circle bx-6px text-secondary me-2"></i>
                                 <span>요약정보: ${promotion.prod.prodDetailContent1 }</span>
                              </li>
                              <li class="mb-2 d-flex align-items-center">
                                 <i class="bx bxs-circle bx-6px text-secondary me-2"></i>
                                 <span>상세내용: ${promotion.prod.prodDetailContent2 }</span>
                              </li>
                           </ul>

                        </div>
                     </div>
                  </c:otherwise>
               </c:choose>

					<div class="card-footer">
						<a href="javascript:;" data-bs-toggle="modal"
							data-bs-target="#prodModal"
							class="btn btn-success modal-dialog-centered"> 수정하기</a>
						<a href="#" id="boarDel" class="btn btn-label-dark">삭제하기</a>
					</div>

				</div>
            <!-- /Current Plan -->
         </div>
         <!--  -->


      </div>


<!-- board 모달 -->
     <%--  <div class="modal modal-xl comment-form" id="boardModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content p-5">
               <div class="modal-header pb-0"></div>
               <div class="modal-body">
                  <h3>수정</h3>

                  <form method="post" id="inputForm" action="${cPath }/w/modify/saleForm.do" >
                     <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="boardTitle" name="boardTitle"
                           required="required" value="${promotion.board.boardTitle }"/>
                        <label for="floatingInput">제목</label>
                     </div>

                     <div class="mb-3 form-floating">
                        <div id="bContent"></div>
                        <textarea name="boardContent" id="boardContent" style="display:none"></textarea>
                     </div>
                     <div class="col-12 text-center mt-5 mb-1">
                        <button id="boardBtn" type="button" onclick="btnModal()" class="btn btn-label-primary">저장</button>
                        <button type="reset" id="closeBtn"
                           class="btn btn-label-secondary" data-bs-dismiss="modal"
                           aria-label="Close">취소</button>
                     </div>
                     <input name="boardNo" id="boardNo" type="hidden" value="${promotion.board.boardNo }" />

                  </form>

               </div>
            </div>
         </div>
      </div> --%>

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



      <!-- 상품 모달 -->
      <div class="modal comment-form" id="prodModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content p-5">
               <div class="modal-header pb-0"></div>
               <div class="modal-body">
                  <h3>수정</h3>

                  <form method="post" id="prodForm" action="${cPath }/w/modify/prodForm.do" >
                     <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="prodNm" name="prodNm"  required="required" value="${promotion.prod.prodNm }"/>
                        <label for="floatingInput">상품명</label>
                     </div>
                     <div class="mb-3 form-floating">
                        <input type="number" class="form-control" id="prodPrice" name="prodPrice"  readonly value="${promotion.prod.prodPrice }"/>
                        <label for="floatingInput">가격</label>
                     </div>
                     <div class="mb-3 form-floating">
                        <input type="date" class="form-control" id="promoStdate" name="promoStdate"  required="required" value="${strDate }"/>
                        <label for="floatingInput">시작일시</label>
                     </div>
                     <div class="mb-3 form-floating">
                        <input type="date" class="form-control" id="promoEnddate" name="promoEnddate"  required="required" value="${endDate }"/>
                        <label for="floatingInput">종료일시</label>
                     </div>
                     <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="prodDetailContent1" name="prodDetailContent1"  required="required" value="${promotion.prod.prodDetailContent1 }"/>
                        <label for="floatingInput">요약정보</label>
                     </div>
                     <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="prodDetailContent2" name="prodDetailContent2"  required="required" value="${promotion.prod.prodDetailContent2 }"/>
                        <label for="floatingInput">상세정보</label>
                     </div>

                     <div class="col-12 text-center mt-5 mb-1">
                        <button id="prodBtn" type="button" onclick="prodModal()" class="btn btn-label-primary">저장</button>
                        <button type="reset" id="closeBtn"
                        		class="btn btn-label-secondary" data-bs-dismiss="modal"
                           		aria-label="Close">취소</button>
                     </div>

                     <input name="prodNo" id="prodNo" type="hidden" value="${promotion.prod.prodNo }" />

                  </form>

               </div>
            </div>
         </div>
      </div>

   </div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
//그래프 출력
	const buyList = JSON.parse(`${salePromoBuyList}`);
	let labels = [];
	let data1 = [];
	let maxAmount = 0;

	for (let i = 0; i < buyList.length; i++) {
	   let amount = buyList[i];
	   console.log("buyList.length :", buyList[i]);

	   labels.push(amount.buyDate.substr(0, 4) + "-"
	         + amount.buyDate.substr(4));
	   data1.push(Math.round(amount.buyAmount));

	   if (maxAmount < Math.round(amount.buyAmount)) {
	      maxAmount = Math.round(amount.buyAmount);
	   }
	}
	console.log(labels);


   /* //모달 동작시
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
 */
         function errorSwal(msg){
            swal({
              title : msg,
              icon  : "error",
              closeOnClickOutside : false
              });
         }

   </script>



<script defer="defer" src="${pageContext.request.contextPath}/resources/webProvider/assets/js/event-view-sale.js" ></script>
