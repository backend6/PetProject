package com.user.mapper;

import java.util.List;

import com.user.model.UserModelVO;
import com.user.model.UserVO;

public interface GeneralMapper {
	
	/* 펫 정보 관련 mapper */
	int insertGeneral(UserModelVO um); // 펫 정보 등록
	
	UserModelVO selectOnePet(int pno);
	
	List<UserModelVO> selectAllPet();

	
	/* 회원 정보 수정 */
	UserVO getUserInfo(int idx);
	int editUserInfo(UserVO user);
}
