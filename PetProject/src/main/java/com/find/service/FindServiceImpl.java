package com.find.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.find.mapper.FindMapper;
import com.find.model.IntroduceVO;

@Service("FindService")
public class FindServiceImpl implements FindService{

	@Autowired
	private FindMapper findMapper;

	@Override
	public String selectNickname() {
		return this.findMapper.selectNickname();
	}

	@Override
	public String selectTitle() {
		return this.findMapper.selectTitle();
	}

	@Override
	public String selectAddr() {
		return this.findMapper.selectAddr();
	}

	@Override
	public String selectContent() {
		return this.findMapper.selectContent();
	}

	@Override
	public String selectShortContent() {
		return this.findMapper.selectShortContent();
	}

	@Override
	public int selectSPetDayPrice() {
		return this.findMapper.selectSPetDayPrice();
	}

	@Override
	public int selectSPetAllPrice() {
		return this.findMapper.selectSPetAllPrice();
	}

	@Override
	public int selectMPetDayPrice() {
		return this.findMapper.selectMPetDayPrice();
	}

	@Override
	public int selectMPetAllPrice() {
		return this.findMapper.selectMPetAllPrice();
	}

	@Override
	public int selectLPetDayPrice() {
		return this.findMapper.selectLPetDayPrice();
	}

	@Override
	public int selectLPetAllPrice() {
		return this.findMapper.selectLPetAllPrice();
	}

	@Override
	public int getSumStar() {
		return this.getSumStar();
	}

	@Override
	public int getCntStar() {
		return this.getCntStar();
	}
	
	
}
