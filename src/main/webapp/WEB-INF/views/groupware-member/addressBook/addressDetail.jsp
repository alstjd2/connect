<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
<%-- 에러 메시지를 모달에 직접 표시할 수 있도록 하기 위한 스크립트 --%>
<script defer="defer" type="text/javascript">
    $(document).ready(function(){
        <% if (request.getAttribute("updateFailed") != null && (boolean) request.getAttribute("updateFailed")) { %>
            $('#modalCenter2').modal('show');
        <% } %>
    });
</script>
<div style="text-align: right; padding: 5px 5px 0px 0px;">
	<i class="bx bx-x bx-lg cursor-pointer close-sidebar" data-bs-toggle="sidebar" data-overlay data-target="#app-addr-sidebar-left"></i>
</div>
<div
	class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
	<h5 class="mt-4 mb-0">${address.adrNm}</h5>
	<span> <b>${address.adrAff}</b> | <b>${address.adrDep}</b>
	</span>
</div>

<div class="sidebar-body p-6 pt-0">
	<div class="my-6">
		<p class="text-uppercase mb-1 text-muted">상세정보</p>
		<ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
			<li class="d-flex align-items-center"><i class="bx bxs-buildings"></i>
				<span class="align-middle ms-2">${address.adrOnepos} / ${address.adrPos}</span></li>
			<li class="d-flex align-items-center"><i class="bx bx-envelope"></i>
				<span class="align-middle ms-2">${address.adrMail}</span></li>
			<li class="d-flex align-items-center"><i
				class="bx bx-phone-call"></i> <span class="align-middle ms-2">${address.adrTel}</span>
			</li>
		</ul>
	</div>
	<div class="my-6">
		<div class="demo-inline-spacing text-center">
			<c:url value="/gw/address/addressUpdate.do" var="updateUrl">
			    <c:param name="what" value="${address.adrNo }" />
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
						<form action='<c:url value="/gw/address/addressDelete.do" />'
							id="deleteForm" method="get">
							<input type="hidden" name="what" value="${address.adrNo}">
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
</div>

<script type="text/javascript" src="${cPath}/resources/js/app/hjadr/detail.js"></script>