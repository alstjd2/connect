<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="card">
      <h5 class="card-header pb-0 text-md-start text-center">
		 <i class="menu-icon bx bx-message-alt-edit"></i>
    	 문서 서식 선택
      </h5>
      <div class="card-datatable table-responsive">
        <table class="dt-insert table border-top">
          <thead>
            <tr>
              <th class="w10 ">카테고리코드</th>
              <th class="w10 ">카테고리명</th>
              <th class="w15 ">문서서식코드</th>
              <th>문서서식명</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
</div>

<script defer src="${cPath}/resources/groupwareMember/assets/js/document-insert-list.js"></script>