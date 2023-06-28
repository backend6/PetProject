package com.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@GetMapping("/check")
	public String userCheck() {
		
		return "login/userCheck";
	}
	
//	@RequestMapping(value="/joinG",method=RequestMethod.GET)
//	public String joinForm() {
//		
//		return "/member/register";
//	}
//	
//	@RequestMapping(value="/joinG",method=RequestMethod.POST)
//	public String joinProcess(Model m,@ModelAttribute  UserVO user) {
//		log.info("user=="+user);
//		
//		System.out.println("user=="+user.uname());
//		
//		m.addAttribute("msg","가입테스트");
//		m.addAttribute("log","index");
//		return "message";
//		
//	}
//		
		
		
	@GetMapping("/joinG")
	public String generalJoin() {
		
		return "member/register";
	}
	
	@GetMapping("/joinS")
	public String sitterJoin() {
		
		return "member/registerSitter";
	}


}
