/**
 * 
 */
const textAreaId = "boContent";
const delBtnId = "delBtn";

document.addEventListener("DOMContentLoaded", ()=>{
	
	ClassicEditor
        .create( document.getElementById( textAreaId ) )
        .catch( error => {
            console.error( error );
        } );

    document.querySelectorAll("[data-atch-file-id][data-file-sn]").forEach(el=>{
    	el.addEventListener("click", e=>{
    		e.preventDefault();
    		let atchFileId = el.dataset.atchFileId;
    		let fileSn = el.dataset.fileSn;
			FetchUtils.fetchForJSON(`../atch/${atchFileId}/${fileSn}`, {
    			method:"delete"
    			, headers:{
    				"accept":"application/json"
    			}
    		}).then(json=>{
    			if(json.success){
					el.parentElement.remove();    				
    			}
    		});
    	});
    });

    document.getElementById(delBtnId).addEventListener("click", ()=>{
    	if(deleteForm.password.value = updateForm.boPass.value)
    		deleteForm.requestSubmit();
    	else{
    		alert("비밀번호 입력");
    		updateForm.boPass.focus();
    	}
    });
});