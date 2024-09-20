<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="container mb-10">
		<div class="card">
			<h5 class="card-header fw-bold pt-10 fs-4">연차 기준 관리</h5>
			<div class="card-body">
				<form action="${cPath }/gw/vacation/categoryUpdate.do" method="post" >
					<ul class="mb-4 row p-0">
						<c:forEach
								items="${vacationList }" var="vacation" varStatus="vs">
								<input type="hidden" name="vacationList[${vs.index }].vaciNo" value="${vacation.vaciNo }">
								<input type="hidden" name="vacationList[${vs.index }].vaciNm" value="${vacation.vaciNm }">
								<input type="hidden"  name="vacationList[${vs.index }].comNo" value="${vacation.comNo  }">
								<input type="hidden"  name="vacationList[${vs.index }].vaciDate" value="${vacation.vaciDate  }">
								<input type="hidden"  name="vacationList[${vs.index }].vaciType" value="${vacation.vaciType  }">
								<input type="hidden"  name="vacationList[${vs.index }].vaciDelyn" value="${vacation.vaciDelyn  }">
								<c:if test="${vacation.vaciType eq 'BB02110' }">

									<c:choose>
										<c:when test="${vacation.empYear eq 24 }">
											<li class="col-sm-2 d-block"><label for="input-year1"
												class="col-form-label" >${vacation.empYear } 년이상</label>
												<div>
													<input class="form-control" type="number" name="vacationList[${vs.index }].vaciDay"
														value="${vacation.vaciDay }" id="input-year1" >
												</div></li>
										</c:when>
										<c:otherwise>
											<li class="col-sm-2 d-block"><label for="input-year1"
												class="col-form-label">${vacation.empYear } 년</label>
												<div>
													<input class="form-control" type="number" name="vacationList[${vs.index }].vaciDay"
														value="${vacation.vaciDay }" id="input-year1" >
												</div></li>
										</c:otherwise>
									</c:choose>

								</c:if>
							</c:forEach>
					</ul>

					<div class="row">
						<div class="col-xl">
							<button type="submit" class="btn btn-primary">저장하기</button>
							<a href="javascript:;" onclick="history.back();"
								class="btn btn-secondary">뒤로가기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /Form Repeater -->
</div>

<!-- Page JS -->
<script defer
	src="${cPath}/resources/groupwareAdmin/assets/js/attendance.js"></script>