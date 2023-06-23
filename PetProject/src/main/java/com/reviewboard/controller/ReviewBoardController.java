package com.reviewboard.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.reviewboard.model.ReviewBoardVO;
import com.reviewboard.service.ReviewBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReviewBoardController {

	@Autowired
	@Resource(name="reviewBoardService")
	private ReviewBoardService rbService;
	
	@GetMapping("/reviewBoardWrite")
	public String reviewBoardWrite() {
		
		return "/review/reviewBoardWrite";
	}
	
	@RequestMapping(value="/insertReviewBoard" , method=RequestMethod.POST)
	public String insertReviewBoard(Model m, @ModelAttribute ReviewBoardVO rb,
									@RequestParam("mfilename") MultipartFile mf,
									@RequestParam("star") String star, HttpSession session) {
		
		rb.setIno(10);
		rb.setNickname("주인닉네임");
		rb.setStar(star);
		
		log.info("reviewBoard=="+rb);
		
		//1. 파일 업로드 처리 - [1] 업로드 디렉토리 절대경로 얻기(resources/board_upload)
		ServletContext app = session.getServletContext();
		String upDir = app.getRealPath("/resources/board_upload");
		File dir = new File(upDir);
		
		if(!dir.exists()) {
			dir.mkdirs();//업로드 디렉토리 생성
		}
		
		if(!mf.isEmpty()) {//첨부파일이 있다면
		
			//[2] 업로드한 파일명과 파일크기 알아내기==>setFilename(파일명), setFilesize(파일크기)
			String fname = mf.getOriginalFilename();//원본파일명
			long fsize=mf.getSize();//파일크기

			UUID uid=UUID.randomUUID();
			String rfile = uid.toString()+"_"+fname;
			
			rb.setRfile(rfile);

			//[3] 업로드 처리
			try {
				mf.transferTo(new File(upDir, rfile));
				log.info("upDir: "+upDir);
				
			}catch(IOException e) {
				log.error("파일업로드 에러: "+e);
			}
		
		}
			rbService.insertReviewBoard(rb);
			
			return "redirect:/general/page";
		}
	
//	@GetMapping("/")
//	public String reviewBoard(Model m) {
//	
//		List<ReviewBoardVO> rbData = rbService.selectReviewBoard();
//		m.addAttribute("reviewBoard", rbData);
//		
//		return "main";
//	}


}
