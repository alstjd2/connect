/**
 * 
 */

document.addEventListener("DOMContentLoaded", () => {
	const contextPath = document.body.dataset.contextPath;
	
	// 파일 올리기 버튼으로 파일 선택시 바로 다운로드 처리
	const uploadFile = document.querySelector("#uploadFile");
	uploadFile.addEventListener("change", ()=>{
		const uploadForm = document.querySelector("#uploadForm");
		uploadForm.requestSubmit();
	});
	
	
	// 파일 리스트 출력 UI 설계
	const listBody = document.querySelector("#list-body");
	const singleUI = (atchFile) => {
		let listBodyHtml= 	`
					        <tr>
								<td>
									<div class="d-flex justify-content-start align-items-center user-name">
										
							`;
		// 파일 확장자명이 있는경우 파일, 없는경우 폴더
		if(`${atchFile.fileExtsn}` != "folder"){
			listBodyHtml += `
										<div class="avatar-wrapper " data-target='#app-addr-contacts'>
											<div class="avatar me-2">
												<span class="avatar-initial rounded-circle bg-label-danger">
													<i class='bx bx-file'></i>
												</span>
											</div>
										</div>
										<div class="d-flex flex-column">
						
										<span class="emp_name text-truncate"> 
											<a href="${contextPath}/gw/edrive/${atchFile.atchFileId }/${atchFile.fileSn }?sfPath=${atchFile.sfPath}">${atchFile.fileExeRemoveNm }</a>
										</span>
										<small class="emp_post text-truncate text-muted">
											${atchFile.fileExtsn}
										</small>
									</div>
								</div>
							</td>
							<td>${atchFile.fileFancysize }</td>
							<td>${atchFile.fileLastModify }</td>
							<td class="emp-info">
								<button type="button" data-bs-toggle="dropdown"
									class="btn btn-icon btn-label-primary">
									<span class="tf-icons bx bx-plus bx-22px"></span>
								</button>
								<div class="dropdown-menu dropdown-menu-start"
										aria-labelledby="emailsActions">
										<a class="dropdown-item" href="${contextPath}/gw/edrive/${atchFile.atchFileId }/${atchFile.fileSn }?sfPath=${atchFile.sfPath}" >파일 다운로드</a>
										<a class="dropdown-item" data-atch-file-id="${atchFile.atchFileId }" data-file-sn="${atchFile.fileSn }" data-sf-path="${atchFile.sfPath }" href="javascript:;">파일 삭제</a>
										</form>
									</div>
							</td>
						</tr>
							`;
		}else{
			listBodyHtml += `
						<div class="avatar-wrapper " data-target='#app-addr-contacts'>
							<div class="avatar me-2">
								<span class="avatar-initial rounded-circle bg-label-info">
									<i class='bx bx-folder'></i>
								</span>
							</div>
						</div>
						<div class="d-flex flex-column">
			
						<span class="emp_name text-truncate">
							<a href="${contextPath }/gw/edrive/edrivePage.do?sfPath=${atchFile.sfPath +'/'+ atchFile.fileExeRemoveNm}">${atchFile.fileExeRemoveNm }</a>
						</span>
						<small class="emp_post text-truncate text-muted">
							폴더 
						</small>
						</div>
						</div>
							</td>
							<td>${atchFile.fileFancysize }</td>
							<td>${atchFile.fileLastModify }</td>
							<td class="emp-info">
								<button type="button" data-bs-toggle="dropdown"
									class="btn btn-icon btn-label-primary">
									<span class="tf-icons bx bx-plus bx-22px"></span>
								</button>
								<div class="dropdown-menu dropdown-menu-start"
										aria-labelledby="emailsActions">
										<a class="dropdown-item" href="${contextPath }/gw/edrive/edrivePage.do?sfPath=${atchFile.sfPath +'/'+ atchFile.fileExeRemoveNm}" >폴더로 이동</a>
										<button type="button" name="folderRenameModal" class="dropdown-item" data-folder-rename="${atchFile.orignlFileNm}" data-sf-path="${atchFile.sfPath }" data-bs-toggle="modal" data-bs-target="#folderRenameModal">
										  폴더명 수정
										</button>
										<a class="dropdown-item" data-orignl-file-nm="${atchFile.orignlFileNm}" data-sf-path="${atchFile.sfPath }" href="javascript:void(0)">폴더 삭제</a>
										</form>
									</div>
							</td>
						</tr>
						`;
		}
		
		
		return listBodyHtml;
	}

	searchform.addEventListener("submit", (e) => {
		e.preventDefault(); // 이벤트가 가지고 있는 submit 중단시켜주기.
		
		let url = e.target.action;
		let method = e.target.method;
		let formData = new FormData(e.target);
		let data = new URLSearchParams(formData).toString(); // query string
		
		fetch(`${url}?${data}`,{
			headers: {
				"accept": "application/json"
			}
		}).then(response => response.json())
			.then(({ fileList}) => {
				let trTags = null;
				if (fileList && fileList.length > 0) {
					trTags = fileList.map(singleUI).join("\n");
				} else {
					trTags = `
							<tr>
				                <td>
				                 <div class="d-flex flex-column">
				                     <span class="emp_name text-truncate">
				                         파일이 존재하지 않습니다.
				                     </span>
				                 </div>
				                </td>
			                </tr>
							`
				}
				listBody.innerHTML = trTags;
			}).finally(() => {
				// 비동기 요청이 처리 했든 못했던 무조건 마지막에 실행
				e.target.page.value=""
		});

	});

	searchform.requestSubmit();
	
	//파일과 폴더 삭제
	listBody.addEventListener('click', ()=>{
		
		//파일 삭제 이벤트 등록,실행
		listBody.querySelectorAll("[data-atch-file-id][data-file-sn]").forEach(el=>{
	    	el.addEventListener("click", e=>{
	    		e.preventDefault();
	    		let atchFileId = el.dataset.atchFileId;
	    		let fileSn = el.dataset.fileSn;
	    		let sfPath = el.dataset.sfPath;
				fetch(`${contextPath}/gw/edrive/${atchFileId}/${fileSn}?sfPath=${sfPath}`, {
	    			method:"delete"
	    			, headers:{
	    				"accept":"application/json"
	    			}
	    		}).then(resp=>resp.json())
				.then(({sfPath})=>{
					location.href = `${contextPath}/gw/edrive/edrivePage.do?sfPath=${sfPath}`;
				});
	    	});
	    });
		
		// 폴더 삭제 이벤트 등록,실행
		listBody.querySelectorAll("[data-orignl-file-nm]").forEach(el2=>{
			el2.addEventListener("click", e=>{
				e.preventDefault();
				let orignlFileNm = el2.dataset.orignlFileNm;
				let sfPath = el2.dataset.sfPath;
				
				fetch(`${contextPath}/gw/edrive/${orignlFileNm}/folderDelete.do?sfPath=${sfPath}`, {
	    			method:"delete"
	    			, headers:{
	    				"accept":"application/json"
	    			}
	    		}).then(resp=>resp.json())
				.then(({sfPath})=>{
					location.href = `${contextPath}/gw/edrive/edrivePage.do?sfPath=${sfPath}`;
				});
			});
		});
		
		// 폴더명 수정 버튼 클릭 -> 모달창 이용하여 모달에서 비동기로 변경
		document.querySelectorAll("button[name=folderRenameModal]").forEach(el3=>{
			el3.addEventListener('click', e=>{
				const target = e.target;
				let folderName = target.dataset.folderRename;
				let datasetSfPath = target.dataset.sfPath;
				
				let folderRename = document.querySelector('#folderRename');
				let folderDefaultname = document.querySelector('#folderDefaultname');
				let sfPath = document.querySelector('#folderRenameForm input[name=sfPath]');
				
				folderRename.value = folderName;
				folderDefaultname.value = folderName;
				sfPath.value = datasetSfPath;
			});
		});
		
	}, { once: true });
	
	
	
	
	
});