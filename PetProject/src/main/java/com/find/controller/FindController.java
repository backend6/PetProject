package com.find.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.find.model.PagingVO;
<<<<<<< Updated upstream
import com.find.model.SitterVO;
=======
import com.find.model.WishVO;
import com.find.service.FindService;
>>>>>>> Stashed changes
import com.find.service.SitterFindService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop")
@Log4j
public class FindController {
	
	@Resource(name="sitterFindService")
	private SitterFindService sitterFindService;
	
	
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
			List<SitterVO> sitter = sitterFindService.selectPaging(paging);
			String myctx = req.getContextPath();
			String loc = "shop/find";
			
			// 3. 페이지 네비게이션 문자열 받아오기
			String pageNavi = paging.pageNavi(myctx, loc);
			
			m.addAttribute("paging", paging);
			m.addAttribute("sitter", sitter);
			m.addAttribute("pageNavi", pageNavi);
			
			return "shop/find";
			
		}
	
<<<<<<< Updated upstream
	@GetMapping("/info")
	public String sitterInfo() {
		
		return "shop/detail";
	}
=======
		@GetMapping("/info")
		public String sitterInfo(Model model, @ModelAttribute IntroduceVO introVO,
						@RequestParam(defaultValue="1")String nickname,
						@RequestParam(defaultValue="1")String title,
						@RequestParam(defaultValue="1")String addr,
						@RequestParam(defaultValue="1")String content,
						@RequestParam(defaultValue="1")String short_content,
						@RequestParam(defaultValue="1")String license,
						@RequestParam(defaultValue="0")int sPDP, @RequestParam(defaultValue="0")int sPAP,
						@RequestParam(defaultValue="0")int mPDP, @RequestParam(defaultValue="0")int mPAP,
						@RequestParam(defaultValue="0")int lPDP, @RequestParam(defaultValue="0")int lPAP,
						@RequestParam(defaultValue="1")int sumStar,@RequestParam(defaultValue="1")int cntStar,
						@RequestParam(defaultValue="0")int wish
						) {
			
			nickname = this.fService.selectNickname();
			title = this.fService.selectTitle();
			addr = this.fService.selectAddr();
			content = this.fService.selectContent();
			short_content = this.fService.selectShortContent();
			license = this.fService.selectLicense();
			
			sPDP = this.fService.selectSPetDayPrice();
			sPAP = this.fService.selectSPetAllPrice();
			mPDP = this.fService.selectMPetDayPrice();
			mPAP = this.fService.selectMPetAllPrice();
			lPDP = this.fService.selectLPetDayPrice();
			lPAP = this.fService.selectLPetAllPrice();
			
			sumStar = this.fService.getSumStar();
			cntStar = this.fService.getCntStar();
			
			try {
				wish = this.fService.getWish();
			}catch(Exception e) {
				wish = 0;
			}
			
			model.addAttribute("selectNickname", nickname);
			model.addAttribute("selectTitle", title);
			model.addAttribute("selectAddr", addr);
			model.addAttribute("selectContent",content);
			model.addAttribute("selectShortContent",short_content);
			model.addAttribute("license",license);
			
			model.addAttribute("sPetDayPrice",sPDP);
			model.addAttribute("sPetAllPrice",sPAP);
			model.addAttribute("mPetDayPrice",mPDP);
			model.addAttribute("mPetAllPrice",mPAP);
			model.addAttribute("lPetDayPrice",lPDP);
			model.addAttribute("lPetAllPrice",lPAP);

			model.addAttribute("SumStar",sumStar);
			model.addAttribute("CntStar",cntStar);
			
			model.addAttribute("getWish",wish);
			
			return "shop/detail";
		}
		
		
		@GetMapping("/insertHeart")
		public String insertHeart() {
			
			WishVO wvo = new WishVO();
			
			wvo.setUnickname("홍길동");
			wvo.setIno(2);
			wvo.setSnickname("김펫");
			wvo.setSaddr("서울특별시 강남구");
			wvo.setTitle("따뜻한 펫시터");
			
			fService.insertHeart(wvo);
			
			return "redirect:/shop/info";
		}
		
		
		@GetMapping("/deleteHeart")
		public String deleteHeart(@RequestParam(defaultValue="0")int num) {
			
			num=2;
			
			fService.deleteHeart(num);
			
			return "redirect:/shop/info";
		}
>>>>>>> Stashed changes

}
