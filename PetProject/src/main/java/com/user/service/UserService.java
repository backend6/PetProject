package com.user.service;


import com.user.model.NotUserException;
import com.user.model.UserVO;

/* 회원가입 관련 서비스 */ 
public interface UserService {
	
	int createUser(UserVO user);
	
	int createUserS(UserVO user);

	boolean idCheck(String mid);
	
	UserVO loginCheck(String mid, String pwd) throws NotUserException;

	boolean nickCheck(String nickname);

//	UserVO getUser(Integer idx);
	
	UserVO findUser(UserVO findUser) throws NotUserException;

}
