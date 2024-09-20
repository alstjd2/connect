package kr.or.ddit.web.errboard.controller;


import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.errboard.service.ErrService;

@Controller
@RequestMapping("/w/mypage/ErrInsert.do")
public class errInsertConteroller {

	@Autowired
	private ErrService service;
	
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;
	
	@GetMapping
	public String ErrInsertForm(@ModelAttribute("err") ErrBoardVO err) {
		return "tiles:web-user/inquiry/inquiry-error-write";
	}
	
	
	@PostMapping
    public String errInsert(
        @Validated(InsertGroup.class) @ModelAttribute("err") ErrBoardVO err,
        BindingResult errors,
        RedirectAttributes redirectAttributes
    ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    MemberVOWrapper memAuth = (MemberVOWrapper) auth.getPrincipal();
	    MemberVO mem = memAuth.getRealUser();
	    int memNo = mem.getMemNo();
		err.setMemNo(memNo);
		{
	        String logicalViewName = null;
	        // 파일 업로드 처리
	        // 파일 저장 폴더 확인 및 생성
	        File folder = new File(saveFolderPath);
	        if (!folder.exists()) {
	            folder.mkdirs();
	        }
	        
	        // NonVO 검증 및 데이터베이스 처리
	        if (!errors.hasErrors()) {
	            service.createErr(err); // NonVO를 데이터베이스에 저장
	            logicalViewName = "redirect:/w/mypage/mypageError.do"; // 성공 시 리다이렉트할 경로
	        } else {
	            // 검증 실패 시, 오류 메시지와 함께 폼으로 리다이렉트
	            redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "non", errors);
	            logicalViewName = "redirect:/w/mypage/ErrInsert.do";
	        }
	        
	        return logicalViewName;
	    }
	
	}
}
