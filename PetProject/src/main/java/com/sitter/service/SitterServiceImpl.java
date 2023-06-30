package com.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sitter.mapper.SitterMapper;
import com.sitter.model.SitterVO;

@Service("sitterService")
public class SitterServiceImpl implements SitterService {
	
	@Autowired
	private SitterMapper sitterMapper;
	
	
	@Override
	public int sitterIntroduce(SitterVO sitter) {
		
		return sitterMapper.sitterIntroduce(sitter);
	}


	@Override
	public List<SitterVO> getSitterIntroduce() {
		
		return sitterMapper.getSitterIntroduce();
	}


	@Override
	public List<SitterVO> getSitterSchedule() {
		
		return sitterMapper.getSitterSchedule();
	}

}
