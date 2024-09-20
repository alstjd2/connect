<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y blog-single ">
  <div class="py-4 mb-6 ">
      <div class="demo-inline-spacing pb-5 row justify-content-between">
          <a href="${cPath }/w/early/earlyList.do" type="button" class="btn rounded-pill btn-outline-primary col-12 col-md-2">
              <i class='bx bx-arrow-back pe-2'></i> 뒤로가기
          </a>
         <div class="col-12 col-md-8">
    	   <form action="${cPath}/w/early/updateEarlyStatus.do" method="post" class="col d-flex gap-2 justify-content-end">
    	    <input type="hidden" name="what" value="${early.earlyNo}" />
    	    	<select name="earlyStatus" class="form-select" style="width: 50%;" aria-label="Default select example">
            		<option selected>초기설정 여부</option>
            		<option value="작업전" ${early.earlyStatus == '작업전' ? 'selected' : ''}>작업전</option>
            		<option value="작업중" ${early.earlyStatus == '작업중' ? 'selected' : ''}>작업중</option>
            		<option value="작업완료" ${early.earlyStatus == '작업완료' ? 'selected' : ''}>작업완료</option>
            		<option value="작업보류" ${early.earlyStatus == '작업보류' ? 'selected' : ''}>작업보류</option>
        		</select>
        <button type="submit" class="btn btn-label-info">작업변경</button>
<%--         <button type="button" onclick="location.href='${cPath}/earlyBoard/delete?errNo=${errBoard.errNo}'" class="btn btn-label-danger">문의삭제</button> --%>
    </form>
</div>
      </div>
  </div>
  <div class="mt-4">
    <h4 class="mb-0">초기지원문의</h4>
    <div class="detail-inner">
        <!-- post meta -->
        <h2 class="post-title mb-4">
            기업명 : ${early.comNm}(관리자명 : )
        </h2>
        <ul class="custom-flex post-meta">
            <li>
                <a href="tel:${early.earlyPhone}">
                    <i class='bx bx-user'></i>
                    ${early.earlyPhone}
                </a>
            </li>
            <li>
                <a href="mailto:${early.earlyEmail}">
                    <i class='bx bx-envelope'></i>
                    ${early.earlyEmail}
                </a>
            </li>
        </ul>
    </div>
</div>
</div>
