<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- 제목 및 내용 시작 -->

 <table class="table">
     <colgroup>
         <col>
         <col>
     </colgroup>

     <tbody>
         <tr>
             <th>제목</th>
             <td><input class="form-control bg-white" type="text"></td>
         </tr>
         <tr>
             <td colspan="2">
                 <table class="table">
                     <colgroup>
                         <col>
                         <col>
                         <col>
                         <col>
                     </colgroup>

                     <tbody>
                         <tr>
                             <th colspan="4">신청자 정보</th>
                         </tr>
                         <tr>
                             <th>팀/그룹</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>성명</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                         <tr>
                             <th>사번</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>직위</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                         <tr>
                             <th>연락처</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>기타</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                     </tbody>
                 </table>

                 <table class="table">
                     <colgroup>
                         <col>
                         <col>
                         <col>
                         <col>
                     </colgroup>

                     <tbody>
                         <tr>
                             <th colspan="4">대상자 정보</th>
                         </tr>
                         <tr>
                             <th>구분</th>
                             <td colspan="3">
                                 <input class="form-control bg-white" type="text" placeholder="직원 관계사/협력사 출입 부속품신청 기재요망">
                             </td>
                         </tr>
                         <tr>
                             <th>팀/그룹</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>성명</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                         <tr>
                             <th>사번</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>직위</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                         <tr>
                             <th>연락처</th>
                             <td><input class="form-control bg-white" type="text"></td>
                             <th>기타</th>
                             <td><input class="form-control bg-white" type="text"></td>
                         </tr>
                         <tr>
                             <th>현 사진 사용 유무</th>
                             <td>
                                 <input class="form-control bg-white" type="radio" name="photo" value="Yes"><label>Yes</label>
                                 <input class="form-control bg-white" type="radio" name="photo" value="No"><label>No</label>
                             </td>
                             <th>부속품 신청 유무</th>
                             <td>
                                 <input class="form-control bg-white" type="radio" name="accessory" value="케이스"><label>케이스</label>
                                 <input class="form-control bg-white" type="radio" name="accessory" value="줄"><label>줄</label>
                             </td>
                         </tr>
                     </tbody>
                 </table>

                 <table class="table">
                     <colgroup>
                         <col>
                         <col>
                     </colgroup>

                     <tbody>
                         <tr>
                             <th>기타신청사항</th>
                             <td>
                                 <textarea class="form-control" placeholder="SECOM 입출입 등록 신청 여부 등 기타신청사항 기재 요망"></textarea>
                             </td>
                         </tr>
                     </tbody>
                 </table>

             </td>
         </tr>
         <tr>
             <td colspan="2">
                 <p>※ 신입 또는 재직직원이 사원증 신청 시, 반드시 사진 파일 첨부 요망</p>
             </td>
         </tr>
     </tbody>
 </table>
