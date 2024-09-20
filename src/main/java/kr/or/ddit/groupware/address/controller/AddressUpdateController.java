package kr.or.ddit.groupware.address.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.AddressVO;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 외부연락처 수정기능
 * @author 이희진
 *
 */
@RequestMapping("/gw/address/addressUpdate.do")
@RequiredArgsConstructor
@Controller
public class AddressUpdateController {
   
   @Autowired
   private AddressService service;
   
   
   
   @GetMapping
   public String formUI(@RequestParam Integer what, Model model) {
      AddressVO address = service.retrieveAddress(what);
      model.addAttribute("address", address);
      return "tiles:groupware-member/addressBook/addressBook-out-Update";
   }
   
   @PostMapping
   public String formDataProcess(
         @Validated(UpdateGroup.class) @ModelAttribute("address") AddressVO address
         , Errors errors
 		, RedirectAttributes redirectAttributes
         ) {
	   
	   redirectAttributes.addFlashAttribute("address","address");
      if (!errors.hasErrors()) {
         service.modifyAddress(address);
         redirectAttributes.addFlashAttribute("success", true);
         return "redirect:/gw/address/addressList.do";
      } else {
    	  
    	  redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"address", errors);
    	  return "tiles:groupware-member/addressBook/addressBook-out-Update";
      }
   }
   
   

}
