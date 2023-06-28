package com.user.service;


import com.user.model.NotUserException;
import com.user.model.UserVO;

public interface UserService {
	
	int createUser(UserVO user);

	boolean idCheck(String nickname);

	UserVO loginCheck(String mid, String pwd) throws NotUserException;

}
