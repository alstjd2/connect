/**
 * 
 */

document.addEventListener("DOMContentLoaded", (e) => {
	const dataListTable = document.querySelector("#dataListTable");
	const contextPath = dataListTable.dataset.cpath;
	console.log(contextPath);
	const listBody = document.querySelector("#list-body");
	const singleUI = (member) => {
		let detailUrl = `${contextPath}/w/membership/membershipDetail.do?what=${member.company.comNo}`;
		return `
            <tr id="${member.memberNo}">
                  <td>${member.rnum}</td>
                  <td>${member.memNm}</td>
                  <td></td>
                  <td>
	               <a  data-bs-toggle="offcanvas" 
	                  href="#companyDetail" role="button" 
	                  aria-controls="offcanvasExample"
	                  data-detail-url="${detailUrl}"   
	               >${member.company.comNm}</a>
                  </td>
                  <td>${member.memDate}</td>
                  <td>${member.status}</td>
                  <td></td>
               </tr>
		`
	}



	searchform.addEventListener("submit", (e) => {
		e.preventDefault(); // 이벤트가 가지고 있는 submit 중단시켜주기.
		
		let url = e.target.action;
		let method = e.target.method;
		let formData = new FormData(e.target);
		let data = new URLSearchParams(formData).toString(); // query string
		
		console.log(url);
		
		
		fetch(`${url}?${data}`,{
			headers: {
				"accept": "application/json"
			}
		}).then(response => response.json())
		.then(({ memberList, pagingHTML }) => {
			let trTags = null; // trTags -> 빈공간으로 만들어주기  null도 상관없음
			if (memberList && memberList.length > 0) {
				trTags = memberList.map(singleUI).join("\n"); // 10개의 tr태그를 하나의 문장으로 ..
			} else {
				trTags = `
				<tr>
					<td colspan="7">회원 없음</td>				
				</tr>
				`
			}
			listBody.innerHTML = trTags;
			$(".paging-area").html(pagingHTML);
			
		}).finally(()=>{
			// 비동기 요청이 처리 했든 못했던 무조건 마지막에 실행
			e.target.page.value=""
		});


	});

	searchform.requestSubmit();
	
	
//	페이징 버튼 처리
	$(".paging-area").on("click", "a[data-page]" , function(){
//		구체적으로 div안에 들어있는 atag를 클릭하면 동작하게 됨
		let page = this.dataset.page;
		searchform.page.value=page;
		searchform.requestSubmit();
	});
	

	const $searchUI = $('#searchUI').on("click", "#searchBtn", function(){
		$searchUI.find(":input[name]").each(function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchform[name].value = value;
		});
		searchform.requestSubmit();	
	});

// 오프캔버스 처리
	const myOffcanvas = document.getElementById('companyDetail');
	myOffcanvas.addEventListener('show.bs.offcanvas', event => {
		let offcanvas = event.target; //target => offcanvasExample
		let offcanvasBody = offcanvas.querySelector(".offcanvas-body");
		let aTag = event.relatedTarget;
		let url = aTag.dataset.detailUrl;

		fetch(url, {
			headers: {
				// accept, contentType 결정 
				// get방식은 body가 없으므로 contentType 생략
				"accept": "text/html"
			}
		}).then(resp=>resp.text())
		.then((html) =>
			// 1. 응답데이터 가지고 오기 (html)
			// offcanvus의 content안에 넣어줘야함
			offcanvasBody.innerHTML = html
		);

	})

});




