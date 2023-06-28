package com.user.service;

import org.springframework.stereotype.Service;

import com.user.model.NotUserException;
import com.user.model.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Override
	public int createUser(UserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean idCheck(String nickname) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserVO loginCheck(String mid, String pwd) throws NotUserException {
		// TODO Auto-generated method stub
		return null;
	}

}
