
$(".buyDiv").click(function(e){

   var btn = e.target.id;

   console.log(btn);
   console.log(memNm);
   console.log(comNo);

	 function errorSwal(msg, link){
	        	swal({
					title : msg,
					icon  : "error",
					closeOnClickOutside : false
					}).then(function(){
						location.href =link;
					});
	      }


   if(  comNo==null ||  !comNo ){
	   if(!memNm || memNm ==null){
		  errorSwal("로그인 후 구독 가능합니다.","/connect/w/login/loginForm.do");
	   }else{
		  errorSwal("기업등록 후 구독 가능합니다.", "/connect/w/member/companyJoinForm.do");

	}
   }

	// 아래 데이터 외에도 필요한 데이터를 원하는 대로 담고, Controller에서 @RequestBody로 받으면 됨
	let data = {
		prodNo: btn   // 카카오페이에 보낼 대표 상품번호 전송
		, memNm: memNm
	};

	$.ajax({
		type: 'POST',
		url: '/connect/w/pay/ready',
		data: JSON.stringify(data),
		contentType: 'application/json',
		success: function(response) {
			location.href = response.next_redirect_pc_url;
			opener.location.reload();
			window.close();
		},
		// 요청이 실패했을 때 실행되는 부분
		/*error: function(err) {
			errorSwal("왜 에러임 partner order id 같은데;", "/connect/w/subscribeView.do");
		},*/
	});
})
