package kr.or.ddit.groupware.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.vo.AddressVO;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 외부연락처 영구삭제, 복구기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address")
@RequiredArgsConstructor
public class TrashDeleteController {
	
	@Autowired
	private AddressService service;

	
	@GetMapping("trashDelete.do")
	public String deleteTrash(@RequestParam("what") int adrNo, 
			RedirectAttributes redirectAttributes) {
        try {
            AddressVO addressVO = new AddressVO();
            addressVO.setAdrNo(adrNo);
            service.removeTrash(addressVO);
            redirectAttributes.addFlashAttribute("message", "성공적으로 영구삭제되었습니다");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "영구삭제되지 않았습니다");
        }
        return "redirect:/gw/address/trashList.do"; 
    }
	
	@GetMapping("trashRestore.do")
	public String restoreTrash(@RequestParam("what") int adrNo, 
			RedirectAttributes redirectAttributes) {
		try {
			AddressVO addressVO = new AddressVO();
			addressVO.setAdrNo(adrNo);
			service.restoreTrash(addressVO);
			redirectAttributes.addFlashAttribute("message", "성공적으로 복구되었습니다");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "복구되지 않았습니다");
		}
		return "redirect:/gw/address/addressList.do"; 
	}
	

}
