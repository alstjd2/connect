package kr.or.ddit.web.promotion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.vo.PromotionVO;
import kr.or.ddit.web.promotion.service.PromotionService;

@RequestMapping("/w/promotion")
@Controller
public class WebProviderPromotionController {

	public static final String MODELNAME = "newEvent";

	@Autowired
	PromotionService promoService;


	/**
	 * 프로바이더 이벤트 등록폼 이동
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/eventForm.do")
	public String insertForm(Model model) {
		return "tiles:web-provider/reference/event-write";
	}

	@ModelAttribute(MODELNAME)
	public PromotionVO board() {
		return new PromotionVO();
	}

	@PostMapping("/insertEvent.do")
	public String insert(
		@ModelAttribute(MODELNAME) PromotionVO newEvent
		, BindingResult errors
		, RedirectAttributes redirectAttributes
		) {
			String lvn = null;
			if(!errors.hasErrors()) {
				promoService.InsertPromotion(newEvent);
				lvn = "redirect:/board/"+newEvent.getBoardNo();
			}else {
				redirectAttributes.addFlashAttribute(MODELNAME, newEvent);
				redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+MODELNAME, errors);
				lvn = "redirect:/board/insert";
			} return lvn;
	}


}
