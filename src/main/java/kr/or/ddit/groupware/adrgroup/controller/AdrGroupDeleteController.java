package kr.or.ddit.groupware.adrgroup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.adrgroup.service.AdrGroupService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.AdrGroupVO;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 그룹 삭제기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address/groupDelete.do")
@RequiredArgsConstructor
public class AdrGroupDeleteController {
	
	@Autowired
	private AdrGroupService service;

	
	@GetMapping
	public String deletegroup(@RequestParam("what") int grpNo, 
			RedirectAttributes redirectAttributes) {
        try {
            AdrGroupVO adrGroupVO = new AdrGroupVO();
            adrGroupVO.setGrpNo(grpNo);
            service.removeGroup(adrGroupVO);
            redirectAttributes.addFlashAttribute("message", "성공적으로 삭제되었습니다");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "삭제되지 않았습니다");
        }
        return "redirect:/gw/address/addressgroupList.do"; 
    }
	

}
