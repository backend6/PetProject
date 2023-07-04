package com.find.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.find.model.IntroduceVO;
import com.find.model.PagingVO;
import com.find.service.FindService;
import com.find.service.SitterFindService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class FindController {
	
	@Autowired
	@Resource(name="FindService")
	private FindService fService;
	
	@Resource(name="sitterFindService")
	private SitterFindService sitterFindService;
	
	
	/*
	 * @GetMapping("/find") public String findSitter(Model m,
	 * 
	 * @RequestParam(name="addr", defaultValue="논현동") String addr) {
	 * 
	 * log.info("addr: "+addr);
	 * 
	 * List<SitterVO> sitter = this.sitterFindService.selectByAddr(addr);
	 * 
	 * log.info("sitter: "+sitter); m.addAttribute("sitter", sitter);
	 * m.addAttribute("addr", addr);
	 * 
	 * return "shop/find"; }
	 */
	
	// 페이징
		@GetMapping("/find")
		public String findSitterPaging(Model m, HttpServletRequest req,
										@ModelAttribute PagingVO paging) {
			
			HttpSession session = req.getSession();
			
			// 1. 총 게시글 수 가져오기 or 검색한 게시글 수 가져오기
			int total = sitterFindService.getTotalCount(paging);
			paging.setTotalCount(total);
			paging.setPagingBlock(5);
			
			paging.paging(session);
			
			log.info("paging: "+paging);
			
			// 2. 게시글 목록 가져오기 or 검색한 게시글 목록 가져오기
			List<IntroduceVO> introduce = sitterFindService.selectPaging(paging);
			String myctx = req.getContextPath();
			String loc = "shop/find";
			
			// 3. 페이지 네비게이션 문자열 받아오기
			String pageNavi = paging.pageNavi(myctx, loc);
			
			m.addAttribute("paging", paging);
			m.addAttribute("introduce", introduce);
			m.addAttribute("pageNavi", pageNavi);
			
			return "shop/find";
			
		}
	
		@GetMapping("/info")
		public String sitterInfo(Model model, @ModelAttribute IntroduceVO introVO,
						@RequestParam(name="nickname", defaultValue="1")String nickname,
						@RequestParam(name="title", defaultValue="1")String title,
						@RequestParam(name="addr", defaultValue="1")String addr,
						@RequestParam(name="content", defaultValue="1")String content,
						@RequestParam(name="short_content", defaultValue="1")String short_content,
						@RequestParam(name="sPetDayPrice", defaultValue="0")int sPDP,
						@RequestParam(name="sPetAllPrice", defaultValue="0")int sPAP,
						@RequestParam(name="mPetDayPrice", defaultValue="0")int mPDP,
						@RequestParam(name="mPetAllPrice", defaultValue="0")int mPAP,
						@RequestParam(name="lPetDayPrice", defaultValue="0")int lPDP,
						@RequestParam(name="lPetAllPrice", defaultValue="0")int lPAP,
						@RequestParam(name="getSumStar",defaultValue="4")int sumStar,
						@RequestParam(name="getCntStar",defaultValue="0")int cntStar
						) {
			
			nickname = this.fService.selectNickname();
			title = this.fService.selectTitle();
			addr = this.fService.selectAddr();
			content = this.fService.selectContent();
			short_content = this.fService.selectShortContent();
			
			sPDP = this.fService.selectSPetDayPrice();
			sPAP = this.fService.selectSPetAllPrice();
			mPDP = this.fService.selectMPetDayPrice();
			mPAP = this.fService.selectMPetAllPrice();
			lPDP = this.fService.selectLPetDayPrice();
			lPAP = this.fService.selectLPetAllPrice();
			
//			sumStar = this.fService.getSumStar();
//			cntStar = this.fService.getCntStar();
			
			model.addAttribute("selectNickname", nickname);
			model.addAttribute("selectTitle", title);
			model.addAttribute("selectAddr", addr);
			model.addAttribute("selectContent",content);
			model.addAttribute("selectShortContent",short_content);
			
			model.addAttribute("sPetDayPrice",sPDP);
			model.addAttribute("sPetAllPrice",sPAP);
			model.addAttribute("mPetDayPrice",mPDP);
			model.addAttribute("mPetAllPrice",mPAP);
			model.addAttribute("lPetDayPrice",lPDP);
			model.addAttribute("lPetAllPrice",lPAP);

//			model.addAttribute("SumStar",sumStar);
//			model.addAttribute("CntStar",cntStar);
			
			return "shop/detail";
		}

}
