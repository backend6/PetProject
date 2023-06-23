package com.find.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.find.model.SitterVO;
import com.find.service.SitterFindService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class FindController {
	
	@Resource(name="sitterFindService")
	private SitterFindService sitterFindService;
	
	
	@GetMapping("/find")
	public String findSitter(Model m,
							@RequestParam(name="addr", defaultValue="논현동") String addr) {

		log.info("addr: "+addr);
		
		List<SitterVO> sitter = this.sitterFindService.selectByAddr(addr);
		
		log.info("sitter: "+sitter);
		m.addAttribute("sitter", sitter);
		m.addAttribute("addr", addr);
		
		return "shop/find";
	}
	
	@GetMapping("/info")
	public String sitterInfo() {
		
		return "shop/detail";
	}

}
