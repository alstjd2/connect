/**
 * 
 */
const textAreaId = "editor";
const delBtnId = "delBtn";

document.addEventListener("DOMContentLoaded", ()=>{
	
	if(textAreaId){
	ClassicEditor
        .create( document.getElementById( textAreaId ) )
        .catch( error => {
            console.error( error );
        } );
	}
});