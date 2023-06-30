package com.sitter.service;

import java.util.List;

import com.sitter.model.SitterVO;


public interface SitterService {
	
	int sitterIntroduce(SitterVO sitter);
	List<SitterVO> getSitterIntroduce();
	List<SitterVO> getSitterSchedule();
}
