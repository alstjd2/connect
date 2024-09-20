<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script>
        
        
    </script>
    
<script defer type="text/javascript">
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("comAdr").value = data.roadAddress;
        }
    }).open();
}
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var comAdrElement = document.getElementById("comAdr");
            console.log("comAdrElement:", comAdrElement); // comAdrElement가 null인지 확인
            if (comAdrElement) {
                comAdrElement.value = data.roadAddress;
            } else {
                console.error("Element with id 'comAdr' not found.");
            }
        }
    }).open();
}

    
</script>
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <div class="col-12 mb-5">
            <div class="card">
                <div class="d-flex align-items-start row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h4 class="card-title fw-bold text-primary mb-3">오류사항 문의하기</h4>
                            <p class="mb-6">
                                그룹웨어 사용 중 오류가 발생하셨나요? <br>
                                아래 버튼을 클릭하여 언제든지 문의해 주세요. 
                                신속하게 도움을 드리겠습니다.
                            </p>
                            
                            <a href="${cPath}/gw/company/companyerror.do" class="btn btn-sm btn-label-primary">바로가기</a>
                        </div>
                    </div>
                    <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-6">
                            <img src="${cPath}/resources/groupwareAdmin/assets/img/illustrations/man-with-laptop.png" height="175" class="scaleX-n1-rtl" alt="View Badge User">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card mb-6">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">기업정보</h5>
                    <small class="text-muted float-end">기업정보를 변경 할 수 있습니다.</small>
                </div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="company">
        				<form:hidden path="comNo" />
                        <div class="mb-6">
                            <label class="form-label" for="basic-icon-default-company">기업(단체)명</label>
                            <div class="input-group input-group-merge">
                                <span id="basic-icon-default-company2" class="input-group-text">
                                    <i class='bx bx-rename'></i>
                                </span>
                                <form:input type="text" path="comNm" class="form-control" maxlength="10" required="required" 
                                placeholder="기업(단체)명을 입력해주세요" aria-label="기업(단체)명을 입력해주세요" aria-describedby="basic-icon-default-company2"/>
                    			<form:errors path="comNm" cssClass="text-danger" element="span" />
                            </div>
                        </div>
                        <div class="mb-6">
                            <label class="form-label" for="basic-icon-default-company3">사업자명</label>
                            <div class="input-group input-group-merge">
                                <span id="basic-icon-default-company4" class="input-group-text">
                                    <i class="bx bx-buildings"></i>
                                </span>
                                <form:input type="text" path="comBsnm" class="form-control" maxlength="9"
                                placeholder="사업자명을 입력하세요." aria-label="사업자명을 입력하세요." aria-describedby="basic-icon-default-company4" />
                    			<form:errors path="comBsnm" cssClass="text-danger" element="span" />
                            </div>
                        </div>
                       
                        <div class="mb-6">
                            <label class="form-label" for="basic-icon-default-com-number">사업자등록번호</label>
                            <div class="input-group input-group-merge">
                                <span id="basic-icon-default-com-number2" class="input-group-text">
                                    <i class='bx bx-dialpad'></i>
                                </span>
                                 <form:input type="text" path="comBsno" class="form-control" maxlength="14" 
                                 placeholder="000-000-00000" aria-label="000-00-00000" aria-describedby="basic-icon-default-com-number2" />
                    			<form:errors path="comBsno" cssClass="text-danger" element="span" />
                            </div>
                        </div>
                        
                        <div class="mb-6">
                            <label class="form-label" for="collapsible-address">주소</label>
                            <div class="input-group input-group-merge">
                                <span id="ollapsible-address2" class="input-group-text">
                                    <i class='bx bx-map-alt' ></i>
                                </span>
                                <form:input type="text" path="comAdr" 
                                class="form-control" rows="2" aria-describedby="collapsible-address2" 
                                readonly="readonly" />
			                    <button type="button" class="btn btn-outline-primary" onclick="execDaumPostcode()">검색</button>
			                    <form:errors path="comAdr" cssClass="text-danger" element="span" />
                            </div>
                        </div>
                        <div class="mb-6">
                            <label class="form-label" for="basic-icon-default-phone">연락처</label>
                            <div class="input-group input-group-merge">
                                <span id="basic-icon-default-phone2" class="input-group-text">
                                    <i class="bx bx-phone"></i>
                                </span>
                                <form:input type="text" path="comTel" class="form-control" maxlength="14"
                                placeholder="전화번호를 입력하세요." aria-label="전화번호를 입력하세요." aria-describedby="basic-icon-default-phone2"/>
                    			<form:errors path="comTel" cssClass="text-danger" element="span" />
                            </div>
                        </div>
                        <div class="text-center">
                        <button type="submit" class="btn btn-primary ">변경하기</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card mb-6">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">브랜드관리</h5>
                    <small class="text-muted float-end" style="text-align: right;">브랜드정보를 변경할 수 있습니다. <br>해당정보는 직원의 그룹웨어 사이트에 적용됩니다.</small>
                </div>
         
                <div class="card-body">
                    <form action="<c:url value='companybrandInfo.do'/>" method="post" enctype="multipart/form-data">
                    	<input type="hidden" name="comNo" value="${company.comNo}">
                    	
						
                        <h6>symbol</h6>
                        <div class="d-flex align-items-start align-items-sm-center gap-6 pb-4">
                        		<div class="d-block w-60p h-px-62 rounded overflow-hidden upload-img">
								<c:choose>
								    <c:when test="${not empty company.comClogo and company.comClogo != '0'}">
<%-- 								        <c:url value='/files/${company.atchFile.fileDetails[0].streFileNm}' var="fileUrl"/> --%>
								        <c:url value='/files/${company.atchFile.fileDetails[0].comClogoStrefileNm}' var="fileUrl"/>
								        <img src="${fileUrl }"
								             class="d-block w-px-60 h-px-60 rounded" id="uploadedAvatar"
								             alt="프로필 사진" width="60" height="60"/>
								    </c:when>
								    <c:otherwise>
								        <img src="${cPath}/resources/groupwareMember/assets/img/branding/symbol.png" alt="user-avatar" class="img-fluid w-100" id="uploadedAvatar" />
								    </c:otherwise>
								</c:choose>
							</div>
								
								<div class="button-wrapper">
								<label for="upload" class="btn btn-primary me-3 mb-2" tabindex="0" style="cursor: pointer;">
                                    <span class="d-none d-sm-block">이미지수정</span>
                                    <i class="bx bx-upload d-block d-sm-none"></i>
                                    
                                    <input type="file" id="upload" class="account-file-input" name="atchFile.fileDetails[0].uploadFile" hidden="" accept="image/png, image/jpeg" />
                                </label>
                                <button type="button" class="btn btn-label-secondary account-image-reset mb-2">
                                    <i class="bx bx-reset d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">리셋</span>
                                </button>
                                <div>JPG, GIF 또는 PNG 허용.최대사이즈 800K</div>
                            </div>
								
                        </div>
                        <hr/>
                        
                        
                        
                        
                        
                        <h6>favicon</h6>
                        <div class="d-flex align-items-start align-items-sm-center gap-6 pb-4">
                   
                            <div class="d-block w-60p h-px-62 rounded overflow-hidden upload-img">
                        	<c:choose>
								<c:when test="${not empty company.comFavicon and company.comFavicon != '0'}">
<%-- 									 <c:url value='/files/${company.atchFile.fileDetails[0].streFileNm}' var="fileUrl2"/> --%>
									 <c:url value='/files/${company.atchFile.fileDetails[0].comFaviconStreFileNm}' var="fileUrl2"/>
																					
									<img src="${fileUrl2 }"
											class="d-block w-px-60 h-px-60 rounded" id="uploadedAvatar2"
										alt="프로필 사진" width="60" height="60"
									/>
									
								</c:when>
								<c:otherwise>
									
                                	<img src="${cPath}/resources/groupwareMember/assets/img/favicon/favicon.ico" alt="user-avatar" class="img-fluid w-100" id="uploadedAvatar2" />
									
								</c:otherwise>
							</c:choose>
                            </div>
                            <div class="button-wrapper">
                                <label for="upload2" class="btn btn-primary me-3 mb-2" tabindex="0">
                                    <span class="d-none d-sm-block">이미지수정</span>
                                    <i class="bx bx-upload d-block d-sm-none"></i>
                                    <input type="file" id="upload2" class="account-file-input" name="atchFile2.fileDetails[0].uploadFile" hidden accept=".ico" onchange="validateAndPreviewFavicon('upload2', 'uploadedAvatar2')" />
                                </label>
<!--                                 <button type="button" class="btn btn-label-secondary account-image-reset mb-2"> -->
<!--                                     <i class="bx bx-reset d-block d-sm-none"></i> -->
<!-- <!--                                    <span class="d-none d-sm-block">리셋</span> --> 
<!--                                 </button> -->
                                <div>ICO 허용.최대사이즈 800K</div>
                            </div>
                        </div>
                        <hr/>
                        <h6>Theme color</h6>
                        <ul class="product-color p-0 mb-4">
						    <li>
						        <input type="radio" name="comCorno" id="red" value="0"
						            <c:if test="${company.comCorno == 0}">checked="checked"</c:if> />
						        <label for="red" style="background-color:hsl(0, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Orange" value="25"
						            <c:if test="${company.comCorno == 25}">checked="checked"</c:if> />
						        <label for="Orange" style="background-color:hsl(25, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Yellow" value="44"
						            <c:if test="${company.comCorno == 44}">checked="checked"</c:if> />
						        <label for="Yellow" style="background-color:hsl(44, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Green" value="116"
						            <c:if test="${company.comCorno == 116}">checked="checked"</c:if> />
						        <label for="Green" style="background-color:hsl(116, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="SkyBlue" value="203"
						            <c:if test="${company.comCorno == 203}">checked="checked"</c:if> />
						        <label for="SkyBlue" style="background-color:hsl(203, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Navy" value="220"
						            <c:if test="${company.comCorno == 220}">checked="checked"</c:if> />
						        <label for="Navy" style="background-color:hsl(220, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Violet" value="248"
						            <c:if test="${company.comCorno == 248}">checked="checked"</c:if> />
						        <label for="Violet" style="background-color:hsl(248, 100%, 71%)"></label>
						    </li>
						    <li>
						        <input type="radio" name="comCorno" id="Fuchsia" value="330"
						            <c:if test="${company.comCorno == 330}">checked="checked"</c:if> />
						        <label for="Fuchsia" style="background-color:hsl(330, 100%, 71%)"></label>
						    </li>
						</ul>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">변경하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
   <div class="col-6">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">레이아웃관리</h5>
            <small class="text-muted float-end" style="text-align: right;">
                레이아웃을 변경할 수 있습니다. <br>해당정보는 직원의 그룹웨어 사이트에 적용됩니다.
            </small>
        </div>

        <div class="card-body">
            <form action="<c:url value='companyLayoutInfo.do'/>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="comNo" value="${company.comNo}">
                <div class="row text-center mt-8">
                    <!-- 첫 번째 템플릿 -->
                    <div class="col-md-6">
                        <label class="p-3">
                            <p>왼쪽 사이드바</p>
                            <img src="${cPath}/resources/groupwareMember/assets/img/branding/000.jpg" alt="Template 1" class="img-fluid mb-2">
                            <br>
                            <input type="radio" name="comOg" value="0" class="form-check-input"
                            <c:if test="${company.comOg == 0}">checked="checked"</c:if> />
                        </label>
                    </div>
                    <!-- 두 번째 템플릿 -->
                    <div class="col-md-6">
                        <label class="p-3">
                            <p>상단 네비게이션</p>
                            <img src="${cPath}/resources/groupwareMember/assets/img/branding/001.jpg" alt="Template 2" class="img-fluid mb-2">
                            <br>
                            <input type="radio" name="comOg" value="1" class="form-check-input"
                            <c:if test="${company.comOg == 1}">checked="checked"</c:if> />
                            
                        </label>
                    </div>
                 
                </div>
                <div class="text-center  mt-8">
                    <button type="submit" class="btn btn-primary">변경하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="col-6">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">테마관리</h5>
            <small class="text-muted float-end" style="text-align: right;">
                메뉴의 테마를 변경할 수 있습니다. <br>메뉴 배경이 해당 테마로 변경됩니다.
            </small>
        </div>

        <div class="card-body">
            <form action="<c:url value='companyThemeInfo.do'/>" method="post">
                <input type="hidden" name="comNo" value="${company.comNo}">
                <div class="row text-center mt-8">
                    <!-- 첫 번째 템플릿 -->
                    <div class="col-md-6">
                        <label class="p-3">
                            <p>라이트모드</p>
                            <img src="${cPath}/resources/groupwareMember/assets/img/branding/000.jpg" alt="Template 1" class="img-fluid mb-2">
                            <br>
                            <input type="radio" name="comWlogo" value="0" class="form-check-input"
                            <c:if test="${company.comWlogo == 0}">checked="checked"</c:if> />
                        </label>
                    </div>
                    <!-- 두 번째 템플릿 -->
                    <div class="col-md-6">
                        <label class="p-3">
                            <p>세미다크모드</p>
                            <img src="${cPath}/resources/groupwareMember/assets/img/branding/002.jpg" alt="Template 2" class="img-fluid mb-2">
                            <br>
                            <input type="radio" name="comWlogo" value="2" class="form-check-input"
                            <c:if test="${company.comWlogo == 2}">checked="checked"</c:if> />
                            
                        </label>
                    </div>
                 
                </div>
                <div class="text-center  mt-8">
                    <button type="submit" class="btn btn-primary">변경하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
        
        
    </div>
</div>
<script defer>
  function validateAndPreviewFavicon(inputId, previewId) {
    const input = document.getElementById(inputId);
    const preview = document.getElementById(previewId);
    const file = input.files[0];

    if (file) {
      // 파일 타입 확인
      if (file.type !== 'image/x-icon') {
        Swal.fire({
          icon: 'error',
          title: '업로드 실패',
          text: '아이콘 파일(.ico)만 업로드할 수 있습니다.',
          showConfirmButton: false,
          timer: 2000,
          timerProgressBar: true
        }).then(() => {
          input.value = ''; // 파일 입력 초기화
        });
        return;
      }

      // 미리보기 업데이트
      const reader = new FileReader();
      reader.onload = function (e) {
        preview.src = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  }
  document.addEventListener('DOMContentLoaded', function() {
	// 이벤트 리스너 추가
		document.getElementById('comNm').addEventListener('input', function() {
		    checkByteLimit(this, 29, '기업(단체명)');
		});
		
		document.getElementById('comBsnm').addEventListener('input', function() {
		    checkByteLimit(this, 29, '사업자명');
		});
		document.getElementById('comBsno').addEventListener('input', function() {
		    checkByteLimit(this, 12, '사업자등록번호');
		});
		document.getElementById('comTel').addEventListener('input', function() {
		    checkByteLimit(this, 19, '연락처');
		});
	  
	    // 페이지 로드 시 성공적으로 수정되었다면 알림을 표시
	    const urlParams = new URLSearchParams(window.location.search);
	    if (urlParams.has('success') && urlParams.get('success') === 'true') {
	        console.log("Success parameter found");
	        Swal.fire({
	            icon: 'success',
	            title: '수정이 완료되었습니다.',
	            showConfirmButton: false,
	            timer: 1500
	        }).then(() => {
	            // 알림이 표시된 후 URL 파라미터에서 success 제거
	            urlParams.delete('success');
	            window.history.replaceState({}, '', `${window.location.pathname}?${urlParams.toString()}`);
	        });
	    }
	});
  
//바이트 수 계산 함수
  function getByteLength(str) {
      return new TextEncoder().encode(str).length;
  }

  // 입력 제한 함수
  function checkByteLimit(inputField, maxBytes, warningMessage) {
      const byteLength = getByteLength(inputField.value);
      if (byteLength > maxBytes) {
    	  console.log(warningMessage);
          Swal.fire({
              icon: 'warning',
              title: '입력 초과',
              text: `글자 제한을 초과하였습니다. `,
              showConfirmButton: false, // 확인 버튼 비활성화
              timer: 1500 // 2초 후 자동 닫힘
          });
          inputField.value = inputField.value.slice(0, maxBytes);
      }
  }
</script>

<!-- Page JS -->
<script defer src="${cPath}/resources/groupwareAdmin/assets/js/pages-account-settings-account.js"></script>