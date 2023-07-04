package com.sitter.service;

import java.util.List;

import com.sitter.model.SitterVO;
import com.user.model.UserVO;


public interface SitterService {
	
	int sitterIntroduce(SitterVO sitter);
	List<SitterVO> getSitterIntroduce(String nickname);
	List<SitterVO> getSitterSchedule(String nickname);
	String getUserNickname();
	
	UserVO getUserInfo(int idx);
	int editUserInfo(UserVO user);
}
