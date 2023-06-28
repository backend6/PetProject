package com.user.mapper;

import com.user.model.NotUserException;
import com.user.model.UserVO;

public interface UserMapper {

	int createUser(UserVO user);

	boolean idCheck(String nickname);

	UserVO loginCheck(String mid, String pwd) throws NotUserException;

}