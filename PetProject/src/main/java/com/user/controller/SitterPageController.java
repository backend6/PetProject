package com.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sitter.model.SitterVO;
import com.sitter.service.SitterService;
import com.user.model.UserVO;
import com.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sitter")
@Log4j
public class SitterPageController {
	
	@Inject
	private SitterService sitterService;
	
	@Inject
	private UserService userService;
	
		
	@GetMapping("/schedule")
	public String SitterSchedule() {
		
		return "sitter/schedule";
	}
	
	@GetMapping("/page")
	public String SitterPage(Model m, HttpServletRequest request) {
		
		//로그인 유저 정보 들어오면 변경할 곳
		String nickname=sitterService.getUserNickname();
	
		List<SitterVO> svo=sitterService.getSitterIntroduce(nickname);
		List<SitterVO> svo2=sitterService.getSitterSchedule(nickname);
		
		
		
		System.out.println(nickname);
		
		request.setAttribute("sittervo", svo2);
		m.addAttribute("svo",svo);
		m.addAttribute("svo2",svo2);
		m.addAttribute("nickname",nickname);
		
		return "sitter/myPagePetSitter";
	}
	
	@GetMapping("/introduce")
	public String SitterIntroduce() {
		
		return "sitter/petSitterIntroduce";
	}
	
	@GetMapping("/record")
	public String SitterRecord() {
		
		return "sitter/record";
	}
		
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public String joinProcess(Model m, @ModelAttribute SitterVO sitter,
			@RequestParam("ufile") MultipartFile mfilename, HttpServletRequest req) {
		System.out.println("==========info==========");
		
		//로그인 유저 정보 들어오면 변경할 곳
		String nickname=sitterService.getUserNickname();
		sitter.setNickname(nickname);
		
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("resources/upload");
		File dir=new File(upDir);
		if(!dir.exists())
			dir.mkdirs();
		
		System.out.println("mfilename : "+mfilename);
		System.out.println("upDir : "+upDir);
		//1. 파일정보(파일명, 파일크기, 첨부 여부) 알아내기 (DB에 저장하기 위해)
		if(!mfilename.isEmpty()) {
		String filename=mfilename.getOriginalFilename();//���ϸ�
			sitter.setIfile(filename);
			
			//2. 파일업로드 처리
			try {
				mfilename.transferTo(new File(upDir, filename));
			} catch (IOException e) {				
				log.info("업로드 실패 : "+e);
				log.error(e);
			}
		}
		
		
		int n=sitterService.sitterIntroduce(sitter);
		String str=(n>0)?"정보 수정/등록 완료":"정보 수정/등록 실패";
		String loc=(n>0)?"page":"javascript:history.back()";
		
		m.addAttribute("msg",str);
		m.addAttribute("loc",loc);
		return "message";
	}
	
	
	@RequestMapping(value="/editS", method=RequestMethod.GET)
	public String sitterEditForm(Model model, @RequestParam(defaultValue="19") int idx) {
		
		if (idx == 0) {
			return "redirect:page";
		}
		
		UserVO user = sitterService.getUserInfo(idx);
		
		model.addAttribute("user", user);
		
		return "sitter/smember_edit";
	}
	
	
	@RequestMapping(value="/editS", method=RequestMethod.POST)
	public String editProcess(Model m, @ModelAttribute UserVO user) {
		
		int n = sitterService.editUserInfo(user);
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
