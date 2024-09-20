package kr.or.ddit.groupware.grboard.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.GrBoardVO;

@Controller
public class GrbUpdateController {

    @Autowired
    private GrbService grbService;
    
    @PostMapping("/gw/board/updatePost.do")
    public String updatePost(@ModelAttribute GrBoardVO grBoardVO, 
                             @RequestParam(value = "atchFile.fileDetails[0].uploadFile", required = false) MultipartFile uploadFile,
                             RedirectAttributes redirectAttributes) {
    	  grbService.modifyGr(grBoardVO);
            // 수정 성공 후 메시지   // 수정된 게시글 번호를 flashAttribute로 전달
            redirectAttributes.addFlashAttribute("grbNo", grBoardVO.getGrbNo());
        // 수정 후 목록 페이지로 리다이렉트
        return "redirect:/gw/board/board.do";
    }
}

