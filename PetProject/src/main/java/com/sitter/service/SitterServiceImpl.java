package com.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sitter.mapper.SitterMapper;
import com.sitter.model.SitterVO;
import com.user.model.UserVO;

@Service("sitterService")
public class SitterServiceImpl implements SitterService {
	
	@Autowired
	private SitterMapper sitterMapper;
	
	
	@Override
	public int sitterIntroduce(SitterVO sitter) {
		
		return sitterMapper.sitterIntroduce(sitter);
	}


	@Override
	public List<SitterVO> getSitterIntroduce(String nickname) {
		
		return sitterMapper.getSitterIntroduce(nickname);
	}


	@Override
	public List<SitterVO> getSitterSchedule(String nickname) {
		
		return sitterMapper.getSitterSchedule(nickname);
	}


	@Override
	public String getUserNickname() {
		
		return sitterMapper.getUserNickname();
	}


	@Override
	public UserVO getUserInfo(int idx) {
		
		return sitterMapper.getUserInfo(idx);
	}


	@Override
	public int editUserInfo(UserVO user) {
		
		return sitterMapper.editUserInfo(user);
	}

}
