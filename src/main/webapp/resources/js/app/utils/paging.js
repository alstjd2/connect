/**
 * 
 */
document.addEventListener("DOMContentLoaded", () => {
	$(".paging-area").on("click", "a[data-page]", function(){
		let page = this.dataset.page;
		searchform.page.value = page;
		searchform.requestSubmit();
	}) 

   const $searchUI = $("#searchUI").on("click","#searchBtn",function(){
//      $(this).parents("#searchUI") 
      $searchUI.find(":input[name]").each(function(index, input){
         let name = this.name;
         let value = $(this).val();
         searchform[name].value = value;
      })
      searchform.requestSubmit();
   });
    // 검색 버튼 대신 Enter 키로 검색을 실행하는 이벤트
    $searchUI.on("keydown", "input[type='text']", function(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            
            // 검색 수행
            $searchUI.find(":input[name]").each(function(index, input){
                let name = this.name;
                let value = $(this).val();
                searchform[name].value = value;
            });
            searchform.requestSubmit();
        }
    });
   
});