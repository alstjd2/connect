<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-xxl flex-grow-1 container-p-y">
   <!-- Column Search -->
   <div class="card">
       <h5 class="card-header pb-0 d-flex justify-content-between border-bottom align-items-center pb-6">
           <b>증명서관리</b>
           <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#certificatesIssuance">
               <i class='bx bx-edit pe-2'></i>
               증명서 발급
           </a>
           <div class="modal fade emp-info" id="certificatesIssuance" tabindex="-1" aria-modal="true" role="dialog">
               <div class="modal-dialog modal-lg modal-simple modal-enable-otp modal-dialog-centered">
                   <div class="modal-content">
                       <div class="modal-body">
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                           <div class="text-center">
                               <h4 class="mb-2">증명서 발급</h4>
                           </div>
                       </div>
                       <form action="">                                            
                           <div class="mb-6 mx-4 mx-md-0 px-md-6">
                               <label for="select2Basic" class="form-label">신청자</label>
                               <select id="select2Basic" class="form-select form-select-lg share-project-select" data-allow-clear="true">
                                   <option data-name="정윤지" selected>정윤지</option>
                                   <option data-name="이희진" >이희진</option>
                                   <option data-name="이성훈" >이성훈</option>
                                   <option data-name="황혜원" >황혜원</option>
                               </select>
                           </div>
                           <div class="row mb-6 mx-0 mx-md-0 px-md-6">
                               <label for="" class="form-label p-0">증명서종류</label>
                               <div class="row p-0">
                                   <div class="col-md-4">
                                       <div class="form-check custom-option custom-option-basic checked">
                                           <label class="form-check-label custom-option-content" for="customRadioTemp1">
                                               <input name="customRadioTemp" class="form-check-input" type="radio" value="" id="customRadioTemp1" checked="">
                                               <span class="custom-option-header">
                                                   <span class="h6 mb-0">재직증명서</span>
                                               </span>
                                               <span class="custom-option-body">
                                                   <small>재직증명서에 대한 설명을 작성해주세요.</small>
                                               </span>
                                           </label>
                                       </div>
                                   </div>
                                   <div class="col-md-4">
                                       <div class="form-check custom-option custom-option-basic">
                                           <label class="form-check-label custom-option-content" for="customRadioTemp2">
                                               <input name="customRadioTemp" class="form-check-input" type="radio" value="" id="customRadioTemp2">
                                               <span class="custom-option-header">
                                                   <span class="h6 mb-0">경력증명서</span>
                                               </span>
                                               <span class="custom-option-body">
                                                   <small>경력증명서에 대한 설명을 작성해주세요.</small>
                                               </span>
                                           </label>
                                       </div>
                                   </div>
                                   <div class="col-md-4">
                                       <div class="form-check custom-option custom-option-basic">
                                           <label class="form-check-label custom-option-content" for="customRadioTemp2">
                                               <input name="customRadioTemp" class="form-check-input" type="radio" value="" id="customRadioTemp2">
                                               <span class="custom-option-header">
                                                   <span class="h6 mb-0">소득증명서</span>
                                               </span>
                                               <span class="custom-option-body">
                                                   <small>소득증명서에 대한 설명을 작성해주세요.</small>
                                               </span>
                                           </label>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <div class="mb-6 mx-4 mx-md-0 px-md-6 row">
                               <div class="col-md-6">
                                   <label for="form-date-input" class="form-label">발급매수</label>
                                   <input class="form-control" type="number" placeholder="발급매수 숫자만" value="발급매수" id="form-date-input">
                               </div>
                               <div class="col-md-6">
                                   <label for="form-date-input" class="form-label">발급용도</label>
                                   <input class="form-control" type="text" placeholder="발급용도" id="form-date-input">
                               </div>
                           </div>
                           <div class="mb-6 mt-10 text-center">
                               <button class="btn btn-primary">
                                   <i class='bx bx-send bx-sm me-2'></i>
                                   증명서발급
                               </button>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </h5>
       <div class="card-datatable text-nowrap">
           <table class="dt-column-search table table-bordered">
               <thead>
                   <tr>
                       <th>발급번호</th>
                       <th>상태</th>
                       <th>직원명</th>
                       <th>증명서</th>
                       <th>발급일</th>
                       <th>프린트</th>
                   </tr>
               </thead>
               <tfoot>
                   <tr>
                       <th>발급번호</th>
                       <th>상태</th>
                       <th>직원명</th>
                       <th>증명서</th>
                       <th>발급일</th>
                       <th>프린트</th>
                   </tr>
               </tfoot>
           </table>
       </div>
   </div>
   <!--/ Column Search -->
    

</div>
                    
<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/personnel-certificate.js"></script>
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/emp-info.js"></script>