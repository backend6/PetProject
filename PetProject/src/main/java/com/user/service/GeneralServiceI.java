package com.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.user.mapper.GeneralMapper;
import com.user.model.UserModelVO;
import com.user.model.UserVO;

/* 일반회원 마이페이지 관련 서비스 임플 */

@Service("GeneralService")
@Repository
public class GeneralServiceI implements GeneralService {
	
	@Autowired
	private GeneralMapper generalmapper;
	
	@Override
	public int insertGeneral(UserModelVO um) {
		return this.generalmapper.insertGeneral(um);
	}

	@Override
	public UserModelVO selectOnePet(int pno) {
		return this.generalmapper.selectOnePet(pno);
	}

	@Override
	public List<UserModelVO> selectAllPet() {
		return this.generalmapper.selectAllPet();
	}

	@Override
	public UserVO getUserInfo(int idx) {
		
		return this.generalmapper.getUserInfo(idx);
	}

	@Override
	public int editUserInfo(UserVO user) {
	
		int n=this.generalmapper.editUserInfo(user);
		System.out.println("N: "+n);
		return n;
	}

	


	
}
