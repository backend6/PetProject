package com.find.service;

import java.util.List;
import java.util.Map;

import com.find.model.SitterVO;
import com.find.model.WishVO;

public interface SitterFindService {
	
	int getTotalCount();

	// 펫시터 소개번호 순으로 목록 보여주기
	public List<SitterVO> selectByAll(Map<String, Integer> map);
		
	// 지역 별로 펫시터 보여주기
	public List<SitterVO> selectByAddr(String addr);
	
	
	// 찜 목록 관련 메소드
	int addWish(WishVO wish);	// 찜목록에 추가
	int delWish(int wno);	// 찜목록에서 삭제
	List<WishVO> selectWishList(String mid);	// 특정회원의 찜 목록 보기
	
	
}
