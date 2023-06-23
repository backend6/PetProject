package com.find.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.find.mapper.SitterFindMapper;
import com.find.mapper.WishMapper;
import com.find.model.SitterVO;
import com.find.model.WishVO;

@Service("sitterFindService")
public class SitterFindServiceImpl implements SitterFindService {

	@Inject
	private SitterFindMapper sitterFindMapper;
	
	@Inject
	private WishMapper wishMapper;
	
	
	@Override
	public int getTotalCount() {

		return this.sitterFindMapper.getTotalCount();
	}
	
	
	@Override
	public List<SitterVO> selectByAll(Map<String, Integer> map) {
		
		return this.sitterFindMapper.selectByAll(map);
	}

	@Override
	public List<SitterVO> selectByAddr(String addr) {
		
		return this.sitterFindMapper.selectByAddr(addr);
	}

	
	// wish ----------------------------------------------
	
	@Override
	public int addWish(WishVO wish) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delWish(int wno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<WishVO> selectWishList(String mid) {
		// TODO Auto-generated method stub
		return null;
	}



}
