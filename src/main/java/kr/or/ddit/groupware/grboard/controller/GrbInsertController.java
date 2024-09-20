package kr.or.ddit.groupware.grboard.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.grboard.service.GrbGubunService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.NonVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/board")
public class GrbInsertController {
	
	@Value("#{appInfo.atchSavePath}")
	private String atchSavePath;
	
	@Autowired
	private GrbGubunService service;
	@Autowired GrbService gservice;
	@GetMapping("grbGubunInsertForm.do")
	public String errDetail(
			Model model ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		GrbGubunVO grb = new GrbGubunVO();
		int comNo = emp.getComNo();
		grb.setComNo(emp.getComNo());
		
		List<GrbGubunVO> grbInsertList = service.getGubunListByComNo(comNo);
		model.addAttribute("grbInsertList", grbInsertList);
		model.addAttribute("comNo", comNo);
		return "tiles:groupware-member/board/insertBoard";
	}
	
	@PostMapping("insertPost.do")
	public String insertBoard(GrBoardVO board, Model model, RedirectAttributes redirectAttributes) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    int empNo = emp.getEmpNo();
	    board.setComNo(comNo);
	    board.setEmpNo(empNo);
	    // 체크박스 처리: 체크되지 않았을 경우 기본값 설정
	    if (board.getGrbAttentionYN() == null) {
	        board.setGrbAttentionYN("N");  // 기본값 설정
	    }
	    
	    log.info("insertBoard->board : " + board);
	    
	    // 파일 저장 폴더 확인 및 생성
        File folder = new File(atchSavePath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        
	    try {
	        gservice.createGr(board);
	        System.out.println(board+"이게뭘까");
	        redirectAttributes.addFlashAttribute("grbNo", board.getGrbNo());
	        return "redirect:/gw/board/board.do"; // 성공 시 리디렉션할 페이지
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "게시판 추가에 실패했습니다.");
	        return "redirect:/gw/board/errorPage"; // 실패 시 리디렉션할 페이지
	    }
	}
	
	@PostMapping()
    public String processNonInquiry(
            @Validated(InsertGroup.class) @ModelAttribute("non") NonVO non, // NonVO 객체
            BindingResult errors, // 검증 결과
            RedirectAttributes redirectAttributes // 리다이렉트 시 메시지 전송
        ) {
        
        String logicalViewName = null;

        // 파일 업로드 처리
    
        // 파일 저장 폴더 확인 및 생성
        File folder = new File(atchSavePath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        
        return logicalViewName;
    }
}
