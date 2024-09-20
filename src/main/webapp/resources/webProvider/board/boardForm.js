/**
 * 
 */
const textAreaId = "boContent";
document.addEventListener("DOMContentLoaded", ()=>{
	ClassicEditor
        .create( document.getElementById( textAreaId ) )
        .catch( error => {
            console.error( error );
        } );
});