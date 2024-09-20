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
 * 주소록 - 외부연락처 삭제기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address/addressDelete.do")
@RequiredArgsConstructor
public class AddressDeleteController {
	
	@Autowired
	private AddressService service;

	
	@GetMapping
	public String deleteAddress(@RequestParam("what") int adrNo, 
			RedirectAttributes redirectAttributes) {
        try {
            AddressVO addressVO = new AddressVO();
            addressVO.setAdrNo(adrNo);
            service.removeAddress(addressVO);
            redirectAttributes.addFlashAttribute("message", "성공적으로 삭제되었습니다");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "삭제되지 않았습니다");
        }
        return "redirect:/gw/address/addressList.do"; 
    }
	

}
