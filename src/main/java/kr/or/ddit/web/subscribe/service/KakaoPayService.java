package kr.or.ddit.web.subscribe.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import kr.or.ddit.web.subscribe.vo.AproveResponse;
import kr.or.ddit.web.subscribe.vo.ReadyResponse;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class KakaoPayService {

	@Autowired
	public BuyListMapper buyMapper;
	@Autowired
	public ProdListMapper prodMapper;
	@Autowired
	public CompanyMapper comMapper;

	public String orderId(String comNo) {
		int ran= (int) (Math.random() * 999)+100;

		// 현재 날짜 구하기
    	LocalDate now = LocalDate.now();
    	// 포맷 정의
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
    	// 포맷 적용
    	String formatedNow = now.format(formatter);
    	String orderid = formatedNow+comNo+ran;

		return orderid;
	}

    /**
     *  카카오페이 결제창 연결
     * @param data
     * @return
     * @throws ParseException
     */
//    @SuppressWarnings("static-access")
	public ReadyResponse payReady(Map<String, String> data) throws ParseException {

    	log.info("datadatadata{}",data);

    	int prodNo = Integer.parseInt( data.get("prodNo"));
    	int comNo = Integer.parseInt( data.get("comNo"));

    	//상품 정보 조회
    	ProdListVO prodVo = prodMapper.selectProd(prodNo);
    	//회사 조회
    	CompanyVO company =comMapper.selectCompany(comNo);
    	String memNo = ""+company.getMemNo();
    	String memNm = data.get("memNm");

    	//카카오페이 api에 정보 보내기위함
    	String item_code = prodVo.getProdNo()+"";
    	String total_amount = prodVo.getProdPrice()+"";

        Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", "TC0ONETIME");                                    // 가맹점 코드(테스트용)
//        parameters.put("partner_order_id", memNo+orderId(comNo+""));    // 주문번호
        parameters.put("partner_order_id", "1");    // 주문번호
        parameters.put("partner_user_id", memNm);            // 회원 이름
        parameters.put("item_name", prodVo.getProdNm());     // 상품명
        parameters.put("item_code", item_code);           	 // 상품 코드
        parameters.put("quantity", "1");                     // 상품 수량
        parameters.put("total_amount", total_amount);        // 상품 총액
        parameters.put("tax_free_amount", "0");               // 상품 비과세 금액
        parameters.put("approval_url", "http://localhost/connect/w/pay/completed"); // 결제 성공 시 URL
        parameters.put("cancel_url", "http://localhost/connect/w/subscribeView.do?msg=cancel");      // 결제 취소 시 URL
        parameters.put("fail_url", "http://localhost/connect/w/subscribeView.do?msg=fail");          // 결제 실패 시 URL

        // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // RestTemplate
        // : Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        //   REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
//        String url = "https://kapi.kakao.com/v1/payment/ready";
        String url = "https://open-api.kakaopay.com/online/v1/payment/ready";

//         RestTemplate의 postForEntity : POST 요청을 보내고 ResponseEntity로 결과를 반환받는 메소드
        ResponseEntity<ReadyResponse> responseEntity = template.postForEntity(url, requestEntity, ReadyResponse.class);
        log.info("결제준비 응답객체: " + responseEntity.getBody().getTid());

        //사용중인 상품이 존재 여부 체크 및
        //그룹웨어 사용 시작날짜 세팅
        BuyListVO buyVo = selectBuyUse(comNo);
        buyVo.setComNo(comNo);
        log.info("사용중인 상품 존재 여부 체크및 시작날짜 세팅\n{} ",buyVo);
        //사용 기간 확인 후 구매날짜 +사용기간 구해서
        buyVo.setProdNo(prodNo);
        buyVo.setBuyTid(responseEntity.getBody().getTid());

        buyMapper.insertBuyList(buyVo);
        log.info("=======buyVo insert 완료했움  {}", buyVo);

        return responseEntity.getBody();
    }


    /**
     * 카카오페이 결제 승인
     	사용자가 결제 수단을 선택하고 비밀번호를 입력해 결제 인증을 완료한 뒤,
     	최종적으로 결제 완료 처리를 하는 단계
     * @param tid
     * @param pgToken
     * @return
     */
    public AproveResponse payApprove(Map<String, String> payList) {
    	String tid= payList.get("tid");
    	String memNo= payList.get("memNo");
    	String memNm= payList.get("memNm");
    	String pgToken= payList.get("pgToken");
    	String comNo= payList.get("comNo");

        Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", "TC0ONETIME");              // 가맹점 코드(테스트용)
        parameters.put("tid", tid);                       // 결제 고유번호
//        parameters.put("partner_order_id", memNo+orderId(comNo+"") );
        parameters.put("partner_order_id","1" );
        parameters.put("partner_user_id",memNm );
        parameters.put("pg_token", pgToken);              // 결제승인 요청을 인증하는 토큰
        log.info("파라미터 {}",parameters);

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
        log.info("url {}",url);
        log.info("requestEntity {}",requestEntity);
        log.info("AproveResponse.class {}",AproveResponse.class);
        AproveResponse approveResponse = template.postForObject(url, requestEntity, AproveResponse.class);
        log.info("결제승인 응답객체: " + approveResponse);

        buyMapper.updateBuyListTS(payList.get("tid"));

        return approveResponse;
    }


    /**
     * 카카오페이 측에 요청 시 헤더부에  필요한 값
    	Key 노출 XXX 안됨 ㄱ절대 개인정보임
     * @return
     */
    private HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "SECRET_KEY DEVF69D241AC03C55BC3EAA61C3465F877650035");
        headers.set("Content-type", "application/json");

        return headers;
    }


    /**
     * 사용중인 그룹웨어건이 있는지 확인하는 절차
     * @param comNo
     * @return
     */
	public BuyListVO selectBuyUse(int comNo) {

    	//그룹웨어 사용 시작날짜 세팅
		String lastUseDate="";
    	lastUseDate = buyMapper.selectBuyUse(comNo);
    	log.info("lastUseDate 시작날짜 세팅 데이터 있음-> {}", lastUseDate);
    	BuyListVO buyVo = new BuyListVO();

    	if(lastUseDate == null) {
    		//사용중인 상품이 존재하지 않을 경우
    		LocalDate now = LocalDate.now();
    		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
    		String date = now.format(formatter);
    		log.info("-->date {}",date);
    		//그룹웨어 시작날짜와 구매날짜 일치
    		buyVo.setBuyDate(date);
    		buyVo.setBuyUseStartDate(date);

    	}else {
    		buyVo = new BuyListVO();
    		//SQL에서 계산하여 그룹웨어 사용 시작날짜 가져옴
    		log.info("lastUseDate ---{}",lastUseDate);
    		buyVo.setBuyUseStartDate(lastUseDate);
    		log.info("사용중 상품 존재");

    	}
    	log.info("--selectBuyUse결과 {}",buyVo);

        return buyVo;

    }

}