/**
 * 
 */
document.addEventListener("DOMContentLoaded", () => {
    // 페이징 버튼 클릭 시
    $(".paging-area").on("click", "a[data-page]", function() {
        let page = this.dataset.page;
        // 페이지 값을 설정
        searchform.page.value = page;

        // grbGubunNo가 폼에 존재하는지 확인하고 없으면 추가
        if (!searchform.grbGubunNo) {
            let grbGubunNoInput = document.createElement("input");
            grbGubunNoInput.type = "hidden";
            grbGubunNoInput.name = "grbGubunNo";
            grbGubunNoInput.value = grbGubunNo;  // 자바스크립트 변수로 전달된 값 사용
            searchform.appendChild(grbGubunNoInput);
        }

        // 폼 제출
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