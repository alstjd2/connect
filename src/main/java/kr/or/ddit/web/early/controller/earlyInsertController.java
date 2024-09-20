package kr.or.ddit.web.early.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EarlyVO;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.web.early.service.WebEarlyService;


@Controller
@RequestMapping("/w/support/early.do")
public class earlyInsertController {

    @Autowired
    private WebEarlyService service;

    // 초기 폼 화면을 제공하는 GET 요청 핸들러
    @GetMapping
    public String inquiryForm(@ModelAttribute("early") EarlyVO early) {
        return "tiles:web-user/inquiry/inquiry-setting";
    }

    // 폼 데이터를 처리하는 POST 요청 핸들러
    @PostMapping
    public String processInquiry(
        @Validated(InsertGroup.class) @ModelAttribute("early") EarlyVO early,
        BindingResult errors,
        RedirectAttributes redirectAttributes
    ) {
        String logicalViewName = null;
        if (!errors.hasErrors()) {
            // 데이터베이스에 저장
            service.createWebEarly(early);
            // 성공 시 메인 페이지로 리다이렉트
            logicalViewName = "redirect:/w/support.do";
        } else {
            // 검증 실패 시, 오류 메시지와 함께 폼으로 리다이렉트
            redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "early", errors);
            logicalViewName = "redirect:/w/early.do";
        }
        return logicalViewName;
    }
}
