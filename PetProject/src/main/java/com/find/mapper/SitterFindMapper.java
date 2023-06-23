package com.find.mapper;

import java.util.List;
import java.util.Map;

import com.find.model.SitterVO;

public interface SitterFindMapper {
	
	int getTotalCount();
	
	// 펫시터 목록 보여주기
	List<SitterVO> selectByAll(Map<String, Integer> map);
	
	// 지역 별로 펫시터 보여주기
	List<SitterVO> selectByAddr(String addr);
	

}
