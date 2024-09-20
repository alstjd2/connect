<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Sidebar Right -->
<div style="text-align: right; padding: 5px 5px 0px 0px;">
	<i class="bx bx-x bx-lg cursor-pointer close-sidebar" data-bs-toggle="sidebar" data-overlay data-target="#app-addr-sidebar-left"></i>
</div>
<div class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12" style="
    background-color: #fff;
    z-index: 10;
    padding-bottom: 20px;
">
	<div class="avatar avatar-xl avatar-online chat-sidebar-avatar">

		<!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
		<div class="avatar-wrapper emp-info" data-emp-no="${group.grpNo}"
			data-target='#app-addr-contacts'>
			<div class="me-2">
				<span class="avatar-initial rounded-circle"></span>
			</div>
		</div>
	</div>

	<h5 class="emp_name mt-4 mb-0">${group.grpNm}</h5>
	<span>${group.grpCm}</span>
</div>
<div class="sidebar-body p-6 pt-0">
	<div class="my-6">
		<p class="text-uppercase mb-1 text-muted">그룹마스터</p>
		<ul
			class="list-unstyled d-grid gap-4 mb-0 ms-2 pt-2 pb-5 text-heading">
			<li class="d-flex align-items-center">
				<div
					class="d-flex justify-content-start align-items-center user-name">


					<div class="avatar avatar-md me-6">
						<c:choose>
							<c:when test="${not empty group.employee.empProfile}">
								<!-- 프로필 사진이 있을 경우 -->
								<div class="avatar avatar-md me-4">
									 <c:url value='/files/${group.employee.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
																					
									<img src="${fileUrl }"
										alt="Avatar" class="rounded-circle"
									/>
								</div>


							</c:when>
							<c:otherwise>
								<!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
								<div class="avatar-wrapper emp-info"
									data-emp-no="${group.employee.empNo}"
									data-target='#app-addr-contacts'>
									<div class="me-2">
										<span class="avatar-initial  avatar-initial2 rounded-circle"></span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>



					<div class="d-flex flex-column">
						<a href="#" class="text-heading text-truncate"> 
						<span class="master_name fw-medium"> ${group.employee.empNm} </span>
						</a> <small> <c:forEach var="organization"
								items="${group.employee.company.organizationList}">
							${organization.orgDep}
							</c:forEach> / <c:forEach var="position"
								items="${group.employee.company.positionList}">
								${position.posNm}
							</c:forEach>

						</small>
					</div>
				</div>
			</li>
		</ul>
		<p class="text-uppercase mb-1 text-muted">그룹멤버</p>
		<ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
			<c:choose>
				<c:when test="${not empty groupempList}">
					<c:forEach items="${groupempList}" var="groupemp">
						<li class="d-flex align-items-center">
							<div
								class="d-flex justify-content-start align-items-center user-name">
								<div class="avatar avatar-md me-6">
									<c:choose>
										<c:when test="${not empty groupemp.group.employee.empProfile}">
											<!-- 프로필 사진이 있을 경우 -->
											<div class="avatar avatar-md me-4">
												 <c:url value='/files/${groupemp.group.employee.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/>
																					
													<img src="${fileUrl }"
														  alt="Avatar" class="rounded-circle"
													/>
											</div>
										</c:when>
										<c:otherwise>
											<!-- 프로필 사진이 없을 경우 기본 동그라미 아바타 -->
											<div class="avatar-wrapper emp-info"
												data-emp-no="${groupemp.group.employee.empNo}"
												data-target='#app-addr-contacts'>
												<div class="me-2">
													<span
														class="avatar-initial  avatar-initial3 rounded-circle"></span>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="d-flex flex-column">
									<a href="#"
										class="text-heading text-truncate"> <span
										class="member_name fw-medium">
											${groupemp.group.employee.empNm}</span>
									</a> <small> <c:forEach var="organization"
											items="${groupemp.group.employee.company.organizationList}">
																${organization.orgDep}
																</c:forEach> / <c:forEach var="position"
											items="${groupemp.group.employee.company.positionList}">
																	${position.posNm}
																</c:forEach>
									</small>
								</div>
							</div>
						</li>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>소속된 멤버가 없습니다.</p>

				</c:otherwise>
			</c:choose>

		</ul>
	</div>

	<security:authorize access="isAuthenticated()">
		<security:authentication property="principal" var="principal" />
		<security:authentication property="authorities" var="authorities" />
	</security:authorize>

	<c:choose>
		<c:when test="${ principal.realUser.empNo eq group.empNo }">

			<div class="my-6">
				<p class="text-uppercase text-muted mb-1">정보확인</p>
				<div class="demo-inline-spacing text-center">
					<c:url value="/gw/address/addressGroupUpdate.do" var="updateUrl">
					    <c:param name="what" value="${group.grpNo }" />
					</c:url>
					<button type="button" class="btn btn-label-secondary"
						onclick="window.location.href='${updateUrl}'">
						<i class='bx bxs-edit-alt'></i> 수정
					</button>
					<button type="button" class="btn btn-label-danger" data-bs-toggle="modal"
						data-bs-target="#delModal">
						<i class='bx bxs-trash'></i> 삭제
					</button>
					<!-- Modal -->
					<div class="modal fade" id="delModal" tabindex="-1"
						style="display: none;" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="delModalTitle">정말로 삭제하시겠습니까?</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form action='<c:url value="/gw/address/groupDelete.do" />'
									id="deleteForm" method="get">
									<input type="hidden" name="what" value="${group.grpNo}">
									<div class="modal-footer">
										<button type="submit" id="delete" class="btn btn-danger">삭제하기</button>
										<button type="button" class="btn btn-label-secondary"
											data-bs-dismiss="modal">취소</button>
									</div>
								</form>
							
							</div>
						</div>
					</div>
					
					
			

				</div>
			</div>
			

		</c:when>
	</c:choose>


</div>

