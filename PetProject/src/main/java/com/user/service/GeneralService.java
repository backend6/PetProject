package com.user.service;

import java.util.List;

import com.user.model.UserModelVO;
import com.user.model.UserVO;

/* 일반회원 마이페이지 관련 서비스 */
public interface GeneralService {

	int insertGeneral(UserModelVO um);
	
	UserModelVO selectOnePet(int pno);
	
	List<UserModelVO> selectAllPet();
	
	/* 회원정보 수정 */
	UserVO getUserInfo(int idx);
	int editUserInfo(UserVO user);
	
	
}