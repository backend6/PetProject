package com.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@GetMapping("/check")
	public String userCheck() {
		
		return "login/userCheck";
	}
	
	@GetMapping("/joinG")
	public String generalJoin() {
		
		return "login/register";
	}
	
	@GetMapping("/joinS")
	public String sitterJoin() {
		
		return "login/registerSitter";
	}


}
