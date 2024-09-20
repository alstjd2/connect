package kr.or.ddit.web.non.controller;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.NonVO;
import kr.or.ddit.web.non.service.NonService;


@Controller
@RequestMapping("/w/support/non.do")
public class nonInquiryController {
	
    @Autowired
    private NonService service;
    
	
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;
    
    
    // 초기 폼 화면을 제공하는 GET 요청 핸들러
    @GetMapping
    public String nonInquiryForm(@ModelAttribute("non") NonVO non) {
        return "tiles:web-user/inquiry/inquiry-before";
    }

    
    // 폼 데이터를 처리하는 POST 요청 핸들러
    @PostMapping()
    public String processNonInquiry(
            @Validated(InsertGroup.class) @ModelAttribute("non") NonVO non, // NonVO 객체
            BindingResult errors, // 검증 결과
            RedirectAttributes redirectAttributes // 리다이렉트 시 메시지 전송
        ) {
        
        String logicalViewName = null;

        // 파일 업로드 처리
    
        // 파일 저장 폴더 확인 및 생성
        File folder = new File(saveFolderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // NonVO 검증 및 데이터베이스 처리
        if (!errors.hasErrors()) {
        	
            service.createNon(non); // NonVO를 데이터베이스에 저장
            logicalViewName = "redirect:/w/support.do"; // 성공 시 리다이렉트할 경로
        } else {
            // 검증 실패 시, 오류 메시지와 함께 폼으로 리다이렉트
            redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "non", errors);
            logicalViewName = "redirect:/w/support/non";
        }
        
        return logicalViewName;
    }
}
