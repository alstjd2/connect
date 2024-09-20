<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



 <table class="table">
     <colgroup>
         <col>
         <col>
         <col>
         <col>
     </colgroup>
     <tbody>
         <tr>
             <th>채용부서</th>
             <td><input class="form-control bg-white" type="text"></td>
             <th>채용인원</th>
             <td><input class="form-control bg-white" type="text"></td>
         </tr>
         <tr>
             <th>채용직종</th>
             <td>
                 <input class="form-control bg-white" type="radio" name="jobType" value="정규직"><label>정규직</label>
                 <input class="form-control bg-white" type="radio" name="jobType" value="계약직"><label>계약직</label>
                 <input class="form-control bg-white" type="radio" name="jobType" value="기타"><label>기타</label>
             </td>
             <th>경력구분</th>
             <td>
                 <input class="form-control bg-white" type="radio" name="experienceType" value="신입"><label>신입</label>
                 <input class="form-control bg-white" type="radio" name="experienceType" value="경력"><label>경력</label>
             </td>
         </tr>
         <tr>
             <th>채용직급/직책</th>
             <td><input class="form-control bg-white" type="text"></td>
             <th>요청기한</th>
             <td><input class="form-control bg-white" type="text"></td>
         </tr>
         <tr>
             <th rowspan="2">채용사유</th>
             <th>사유구분</th>
             <td colspan="2">구체적 내용</td>
         </tr>
         <tr>
             <th>사유구분</th>
             <td colspan="2">
                 <input class="form-control bg-white" type="checkbox" name="reason" value="인력증원(T/O증가)"><label>인력증원(T/O증가)</label>
                 <input class="form-control bg-white" type="checkbox" name="reason" value="퇴직으로 인한 대체인력충원"><label>퇴직으로 인한 대체인력충원</label>
                 <input class="form-control bg-white" type="checkbox" name="reason" value="일시적 결원에 의한 충원(출산 등)"><label>일시적 결원에 의한 충원(출산 등)</label>
                 <input class="form-control bg-white" type="checkbox" name="reason" value="기타"><label>기타</label>
             </td>
         </tr>
         <tr>
             <th colspan="4">1. 업무내용</th>
         </tr>
         <tr>
             <td colspan="4"><textarea class="form-control"></textarea></td>
         </tr>
         <tr>
             <th colspan="4">2. 필요경력</th>
         </tr>
         <tr>
             <td colspan="4"><textarea class="form-control"></textarea></td>
         </tr>
         <tr>
             <th colspan="4">3. 필요자격증</th>
         </tr>
         <tr>
             <td colspan="4"><textarea class="form-control"></textarea></td>
         </tr>
         <tr>
             <th colspan="4">4. 기본자격</th>
         </tr>
         <tr>
             <th>연령대</th>
             <td colspan="3"><input class="form-control bg-white" type="text"></td>
         </tr>
         <tr>
             <th>학력/전공</th>
             <td colspan="3"><input class="form-control bg-white" type="text"></td>
         </tr>
         <tr>
             <th colspan="4">5. 필요역량</th>
         </tr>
         <tr>
             <td colspan="4"><textarea class="form-control"></textarea></td>
         </tr>
         <tr>
             <th colspan="4">6. 기타의견</th>
         </tr>
         <tr>
             <td colspan="4"><textarea class="form-control"></textarea></td>
         </tr>
     </tbody>
 </table>

