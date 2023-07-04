package com.user.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.model.UserModelVO;
import com.user.model.UserVO;
import com.user.service.GeneralService;
import com.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/general")
@Log4j
public class GeneralPageController {
	
	@Resource(name="GeneralService")
	private GeneralService service;

	@Resource(name="userService")
	private UserService userService;
	
	
	@GetMapping("/page")
	public String generalPage(Model m,
							@RequestParam(name="pno", defaultValue="1") int pno) {
		log.info("pno: "+pno);
		
		UserModelVO mypet = this.service.selectOnePet(pno);
		log.info("mypet: "+mypet);
		
		m.addAttribute("pno", pno);
		m.addAttribute("mypet", mypet);
		
		return "general/mypage_user";
	}
	
	
	@GetMapping("/petinfo")
	public String myPetInfo(Model m, @ModelAttribute UserModelVO pet) {
		
		List<UserModelVO> mypet = this.service.selectAllPet();
		
		log.info("mypet: "+mypet);
		
		m.addAttribute("mypet", mypet);
		
		return "general/mypage_user2";
	}
	
	@GetMapping("/petregi")
	public String myPetRegi() {
		
		return "general/pet_Info";
	}
	 
	
	@RequestMapping(value="/petregi", method=RequestMethod.POST)
	public String petregiProcess(Model m, @ModelAttribute UserModelVO um) {
		
		log.info("um=="+um);
		
		// 유효성 체크
		if (um.getPname()==null || um.getPname().trim().isEmpty()) {
			return "redirect:petinfo";
		}
		
		int n = this.service.insertGeneral(um);
		String str = (n>0)? "펫 등록 성공":"펫 등록 실패";
		String loc = (n>0)? "page":"javascript:history.back()";
		
		log.info(str+" / "+loc);
		m.addAttribute("msg",str);
		m.addAttribute("loc",loc);
		
		return "message";
	}
	
	
	
	 @GetMapping("/reviewBoardWrite") 
	 public String goReview() {
		 
		 return "review/reviewBoardWrite"; 
	 }
	 
	 
	@RequestMapping(value="/editG", method=RequestMethod.GET)
	public String sitterEditForm(Model model, @RequestParam(defaultValue="19") int idx) {
		
		if (idx == 0) {
			return "redirect:page";
		}
		
		UserVO user = service.getUserInfo(idx);
		
		model.addAttribute("user", user);
		
		return "general/gmember_edit";
	}
		
		
	@RequestMapping(value="/editG", method=RequestMethod.POST)
	public String editProcess(Model m, @ModelAttribute UserVO user) {
		
		int n = service.editUserInfo(user);
		String str = (n>0)? "회원정보 수정 완료":"회원정보 수정 실패";
		String loc = (n>0)? "page":"javascript:history.back()";
		
		log.info(str+" / "+loc);
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		
		return "message";
	}
	
	@GetMapping("/nickCheck")
	public String nickCheckForm() {
		
		return "member/nickCheck";
	}
	
	
	@PostMapping("/nickCheck")
	public String nickCheckResult(Model m, @RequestParam(defaultValue="") String nickname) {
		
		boolean isUse = userService.nickCheck(nickname);
		String result = (isUse)? "success":"fail";
	
		m.addAttribute("result", result);
		m.addAttribute("nickname", nickname);
		
		return "member/nickCheckResult";
	}

}
