<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<div style="text-align: right; padding: 5px 5px 0px 0px;">
	<i class="bx bx-x bx-lg cursor-pointer close-sidebar" data-bs-toggle="sidebar" data-overlay data-target="#app-addr-sidebar-left"></i>
</div>
<div class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
	


	<div class="avatar avatar-xl avatar-online chat-sidebar-avatar">
		<c:choose>
			<c:when test="${not empty employee.empProfile}">
				<!-- 프로필 사진이 있을 경우 -->
				<div class="avatar avatar-xl avatar-online chat-sidebar-avatar">
				
					 <c:url value='/files/${employee.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
																					
					<img src="${fileUrl }"
						alt="Avatar"
						class="rounded-circle"
					/>
					
				</div>
				
				
			</c:when>
			<c:otherwise>
				<!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
				<div class="avatar-wrapper emp-info" data-emp-no="${employee.empNo}" data-target='#app-addr-contacts'>
					<div class="me-2">
						<span class="avatar-initial rounded-circle"></span>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
		
		

		<h5 class="mt-4 mb-0 emp_name">${employee.empNm}</h5>
		<span> <b> <c:forEach var="organization"
					items="${employee.company.organizationList}">
	${organization.orgDep}
	</c:forEach>
		</b> / <b> <c:forEach var="position"
					items="${employee.company.positionList}">
		${position.posNm}
	</c:forEach>
		</b>
		</span>
	</div>
	<div class="sidebar-body p-6 pt-0">
		<div class="my-6">
			<p class="text-uppercase mb-1 text-muted">개인정보</p>
			<ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
				<li class="d-flex align-items-center"><i class="bx bx-envelope"></i>
					<span class="align-middle ms-2">${employee.empMail}</span></li>
				<li class="d-flex align-items-center"><i
					class="bx bx-phone-call"></i> <span class="align-middle ms-2">${employee.empTel}</span>
				</li>
				<li class="d-flex align-items-center"><i
					class="bx bx-time-five"></i> 
					<span class="badge bg-label-primary me-1 ms-2">${employee.empState}</span></li>
			</ul>
		</div>
		<div class="my-6">
			<p class="text-uppercase text-muted mb-1">정보확인</p>
			<div class="demo-inline-spacing">
				<a href="#" class="btn btn-icon btn-label-secondary"> <span
					class="tf-icons bx bx-envelope bx-22px"></span>
				</a> <a href="#" class="btn btn-icon btn-label-secondary"> <span
					class="tf-icons bx bx-calendar bx-22px"></span>
				</a> <a href="#" class="btn btn-icon btn-label-secondary"> <span
					class="tf-icons bx bx-chat bx-22px"></span>
				</a>
			</div>
		</div>
	</div>
	


	<script defer type="text/javascript"
		src="${cPath}/resources/js/app/hjadr/orgdetail.js"></script>