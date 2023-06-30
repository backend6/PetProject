package com.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.model.NotUserException;
import com.user.model.UserVO;
import com.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {
	
	@Resource(name="userService")
	//@Autowired //@Inject
	private UserService userService;

	@GetMapping("/login")
	public String login() {
		
		return "login/login";
	}
	@PostMapping("/login")
	public String loginProcess(HttpSession session, 
			HttpServletResponse response,
			@ModelAttribute("user") UserVO user,
			@RequestParam(defaultValue="off") String saveId) throws NotUserException {
		
		System.out.println("Id: "+user.getMid()+",pwd:"+user.getPwd()); //
		
		System.out.println("saveId: "+saveId);
		
		if(user.getMid()==null||user.getPwd()==null||user.getMid().trim().isEmpty()||user.getPwd().trim().isEmpty()) {
			return "redirect:login";
		}
		UserVO loginUser=userService.loginCheck(user.getMid(), user.getPwd());
		if(loginUser!=null) {
			session.setAttribute("loginUser", loginUser);
			Cookie ck=new Cookie("uid", loginUser.getMid());
			if(saveId.equals("on")) {
				ck.setMaxAge(7*24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			ck.setPath("/");
			response.addCookie(ck);
		}
		
		return "redirect:home";
	}//--------------------
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}	
	@ExceptionHandler(NotUserException.class)
	public String exceptionHandler(Exception ex, Model m) {
		ex.printStackTrace();
		m.addAttribute("exception", ex);
		return "login/errorAlert";
	}
	
	
	
}
