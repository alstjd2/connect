<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal" var="principal" />
	<security:authentication property="authorities" var="authorities" />
</security:authorize>
<div class="container-xxl flex-grow-1 container-p-y pt-10">
	<div class="mb-10 mt-5">
	
		<c:choose>
			<c:when test="${principal.realUser.empRole eq 'ROLE_ADMIN'}">
				<c:url value="list.do" var="backUrl"/>
			</c:when>
			<c:when test="${principal.realUser.empRole eq 'ROLE_EMPLOYEE'}">
				<c:url value="answer/myList.do" var="backUrl"/>
			</c:when>
		</c:choose>
	
		<a href="${backUrl}" class="btn rounded-pill btn-label-primary">
         	<span class="tf-icons bx bx-arrow-back bx-18px me-2"></span>뒤로가기
       </a>
	</div>
	  <%-- ${svyInsertCont} --%>
    <div class="col-md-9 m-auto ">
        <form action="" method="post" id="surveyPage">
            <div class="card">
            	<div class="card-header border-bottom">
					<div class="d-flex gap-3 pb-3"> 
						<c:if test="${svyInsertCont[0].svyImpYn eq 'Y'}"><span class="badge bg-label-danger">중요설문</span></c:if>
						<c:if test="${svyInsertCont[0].svyAllYn eq 'Y'}"><span class="badge bg-label-info">모두투표</span></c:if>	
						<c:if test="${svyInsertCont[0].svyAnyYn eq 'Y'}"><span class="badge bg-label-secondary">익명투표</span></c:if>
				  	</div> 
	                <h5 class="mb-0 fw-bold fs-4">${svyInsertCont[0].svyNm}</h5>
            	</div>
            	
                <div class="card-body">
                   <input type="hidden" name="svyNo" value="${svyInsertCont[0].svyNo}">
                   <input type="hidden" name="svyAsk.empNo" value="${principal.realUser.empNo}">
                	<c:forEach items="${svyInsertCont[0].chiList}" var="chi" varStatus="status">
						<c:choose>
							<c:when test="${chi.chiOvlYn eq 'N'}">
								<div class="col-md p-6 border-bottom">
				                   <span class="badge bg-label-secondary mb-3">단일선택질문</span>
				                   <h6 class="fs-5">${status.index+1} ${chi.chiNm}</h6>
				                   <c:forEach items="${chi.clsList}" var="cls" varStatus="status2">
					                   <div class="form-check">
					                     <input name="chiList[${status.index}].clsList[0].clsNo" class="form-check-input" type="radio" value="${cls.clsNo}" id="radio${cls.clsNo}">
					                     <label class="form-check-label" style="font-size: 17px" for="radio${cls.clsNo}">
					                     	${cls.clsCnt} 
					                     </label>
					                   </div>
				                   </c:forEach>
				                </div>
							</c:when>
							<c:otherwise>
								<div class="col-md p-6 border-bottom">
									<span class="badge bg-label-secondary mb-3">복수선택질문</span>
									<h6 class="fs-5">${status.index+1} ${chi.chiNm}</h6>
									<c:forEach items="${chi.clsList}" var="cls" varStatus="status2">
					                   <div class="form-check mt-4">
					                     <input name="chiList[${status.index}].clsList[${status2.index}].clsNo" class="form-check-input" type="checkbox" value="${cls.clsNo}" id="check${cls.clsNo}">
					                     <label class="form-check-label" style="font-size: 17px" for="check${cls.clsNo}">
					                     	${cls.clsCnt} 
					                     </label>
					                   </div>
				                   </c:forEach>
								</div>
							</c:otherwise>
						</c:choose>    
					</c:forEach>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-primary w-100" onclick="sendForm()">설문하기</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function sendForm() {
        // 설문에서 질문들에 대한 입력 검증
        const questions = document.querySelectorAll('.col-md');
        let isValid = true;

        questions.forEach((question, index) => {
            const radios = question.querySelectorAll('input[type="radio"]');
            const checkboxes = question.querySelectorAll('input[type="checkbox"]');

            // 단일 선택 질문의 경우
            if (radios.length > 0) {
                const isChecked = Array.from(radios).some(radio => radio.checked);
                if (!isChecked) {
                    isValid = false;
                }
            }

            // 복수 선택 질문의 경우
            if (checkboxes.length > 0) {
                const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
                if (!isChecked) {
                    isValid = false;
                }
            }
        });

        if (!isValid) {
            // 선택하지 않은 경우 경고 메시지
            Swal.fire({
                icon: 'warning',
                title: '모든 질문에 답을 선택해 주세요',
                confirmButtonText: '확인'
            });
        } else {
            // 모든 질문에 답변을 한 경우 확인 메시지
            Swal.fire({
                title: '설문을 제출하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('surveyPage').submit(); // 폼 제출
                }
            });
        }
    }
</script>