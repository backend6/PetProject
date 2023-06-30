package com.user.service;


import com.user.model.NotUserException;
import com.user.model.UserVO;

public interface UserService {
	
	int createUser(UserVO user);

	boolean idCheck(String mid);
	
	UserVO loginCheck(String mid, String pwd) throws NotUserException;

	boolean nickCheck(String nickname);

	//UserVO getUser(Integer midx);
	
//	UserVO findUser(UserVO findUser) throws NotUserException;

}
