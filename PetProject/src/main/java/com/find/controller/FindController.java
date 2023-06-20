package com.find.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class FindController {
	
	@GetMapping("/find")
	public String findSitter() {
		
		return "shop/find";
	}
	
	@GetMapping("/info")
	public String sitterInfo() {
		
		return "shop/detail";
	}

}
