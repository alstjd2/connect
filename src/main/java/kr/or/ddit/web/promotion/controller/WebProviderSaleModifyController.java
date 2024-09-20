package kr.or.ddit.web.promotion.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.PromotionVO;
import kr.or.ddit.web.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/w/eventWrite/saleForm.do")
public class WebProviderSaleModifyController {

   @Autowired
   BoardService boardService;

   @ModelAttribute("saleBoard")
   public BoardVO board() {
      return new BoardVO();
   }

   @GetMapping
   public String saleForm( ){

      return "tiles:web-provider/reference/event-sale-write";
   }

   @PostMapping
   public String insert(
      @Validated @ModelAttribute("saleBoard") BoardVO saleBoard
      , BindingResult errors
      , RedirectAttributes redirectAttributes
      ) {
      String lvn = null;

      log.info("***** saleBoard 츨력{}",saleBoard);

      if(!errors.hasErrors()) {
         //제목,내용,게시글 타입 다 작성하였을 시
         //로그인 멤버 아이디 SET하기
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         //로그인한 memNo vo에 세팅
         MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
         int memNo = memberAuth.getRealUser().getMemNo();
         saleBoard.setMemNo(memNo);
         //DB에 내용 작성
         boardService.createBoard(saleBoard , memNo);

         lvn = "redirect:/w/promotion/list.do";
      }else {
         redirectAttributes.addFlashAttribute("newBoard", saleBoard);
         redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+saleBoard, errors);
         redirectAttributes.addFlashAttribute("massage", "fail");

         log.info("에리 있얻 saleBoard{}",saleBoard.getBoardContent());
         lvn = "redirect:/w/eventWrite/saleForm.do";
      }
//      newBoard.setAtchFile(null);
      return lvn;
   }

}
