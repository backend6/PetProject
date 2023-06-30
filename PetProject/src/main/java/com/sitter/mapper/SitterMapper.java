package com.sitter.mapper;

import java.util.List;

import com.sitter.model.SitterVO;


public interface SitterMapper {
	
	int sitterIntroduce(SitterVO sitter);
	List<SitterVO> getSitterIntroduce();
	List<SitterVO> getSitterSchedule();
}
