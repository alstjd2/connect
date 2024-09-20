package kr.or.ddit.web.subscribe.controller;


import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.management.BadAttributeValueExpException;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException.BadRequest;
import org.springframework.web.server.ResponseStatusException;

import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import kr.or.ddit.web.subscribe.service.KakaoPayService;
import kr.or.ddit.web.subscribe.util.SessionUtils;
import kr.or.ddit.web.subscribe.vo.AproveResponse;
import kr.or.ddit.web.subscribe.vo.ReadyResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/w")
public class OrderController {

    private final KakaoPayService kakaoPayService;

    @Autowired
    private CompanyMapper commapper;

    /**
     *
     * @param req json데이터
     * @return
     * @throws ParseException
     */
    @PostMapping("/pay/ready")
    public @ResponseBody ReadyResponse payReady(
          @RequestBody Map<String, String> jsonData
       ) throws ParseException{

    	//유저 프린시퍼 ㄹ받아서 null이면 그냥  return 시킬것
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 	MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();

		int memNo = memberAuth.getRealUser().getMemNo();

		//기업을 방금 등록시키고 접근했을 수 있으니 한번더 조회
		int comNo = commapper.selectComNo(memNo);

		if(comNo <=0 ) {
			ReadyResponse readyResponse = new ReadyResponse();
			readyResponse.setNext_redirect_pc_url("/connect/w/member/companyJoinForm.do");
			return readyResponse ;
		};

    	//post로 넘어온 json 데이터 값
       String prodNo = jsonData.get("prodNo");
       String memNm = jsonData.get("memNm");

       Map<String, String> data = new HashMap<>();
       data.put("prodNo", prodNo);
       data.put("comNo", ""+comNo);
       data.put("memNm", memNm);

       log.info("data가 들어가야해 ", data);
        // 카카오 결제 준비하기
       ReadyResponse readyResponse = kakaoPayService.payReady(data);
       // 세션에 결제 고유번호(tid) 저장
       SessionUtils.addAttribute("tid", readyResponse.getTid());
        log.info("요청 고유번호: " + readyResponse.getTid());
        log.info("readyResponse : " + readyResponse);

        return readyResponse;
    }


    @GetMapping("/pay/completed")
    public String payCompleted(@RequestParam("pg_token") String pgToken ) {

        String tid = SessionUtils.getStringAttributeValue("tid");
        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
        log.info("결제 고유번호: " + tid);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();


		String memNm = memberAuth.getRealUser().getMemNm();
		int memNo = memberAuth.getRealUser().getMemNo();
		int comNo = commapper.selectComNo(memNo);


		Map<String, String> payList = new HashMap<>();
		payList.put("tid", tid);
		payList.put("pgToken", pgToken);
		payList.put("memNm", memNm);
		payList.put("memNo", memNo+"");
		payList.put("comNo", comNo+"");

        // 카카오 결제 요청하기
        AproveResponse approveResponse = kakaoPayService.payApprove(payList);
        return "redirect:/w/mypage/mypageForm.do";
    }
}