package com.user.mapper;

import com.user.model.NotUserException;
import com.user.model.UserVO;

public interface UserMapper {

	int createUser(UserVO user);

	Integer idCheck(String mid);
	
	Integer nickCheck(String nickname);

	UserVO loginCheck(String mid, String pwd) throws NotUserException;

	UserVO getUser(int idx);

//	UserVO findUser(UserVO user);

}