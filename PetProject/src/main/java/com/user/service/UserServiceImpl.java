package com.user.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.user.mapper.UserMapper;
import com.user.model.NotUserException;
import com.user.model.UserVO;

/* 회원가입 관련 서비스 임플 */

@Service("userService")
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper userMapper;
	
	@Inject
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int createUser(UserVO user) {
		user.setPwd(passwordEncoder.encode(user.getPwd()));
		return this.userMapper.createUser(user);
	}
	@Override
	public int createUserS(UserVO user) {
		user.setPwd(passwordEncoder.encode(user.getPwd()));
		return this.userMapper.createUserS(user);
	}

	@Override
	public boolean idCheck(String mid) {
		Integer idx = userMapper.idCheck(mid);
		System.out.println("idx: "+idx);
		if (idx == null) return true;
		
		return false;
	}
	@Override
	public boolean nickCheck(String nickname) {
		Integer idx = userMapper.nickCheck(nickname);
		System.out.println("idx: "+idx);
		if (idx == null) return true;
		
		return false;
	}

	
	@Override
	public UserVO findUser(UserVO findUser) throws NotUserException {
		UserVO user=userMapper.findUser(findUser);
		return user;
	}

	@Override
	public UserVO loginCheck(String mid, String pwd) throws NotUserException {
		UserVO tmpUser=new UserVO();
		tmpUser.setMid(mid);
		tmpUser.setPwd(pwd);
		UserVO dbuser=this.findUser(tmpUser);
		if(dbuser==null) throw new NotUserException("존재하지 않는 아이디 입니다.");

		boolean isMatch=passwordEncoder.matches(pwd, dbuser.getPwd());
		System.out.println("isMatch: "+isMatch);
		if(!isMatch) {
			throw new NotUserException("패스워드가 맞지 않습니다.");
		}
		
		return dbuser;
	}



}
