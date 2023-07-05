package com.find.service;

import com.find.model.WishVO;

public interface FindService {

	String selectNickname();
	String selectTitle();
	String selectAddr();
	String selectContent();
	String selectShortContent();
	
	String selectLicense();
	
	int selectSPetDayPrice();
	int selectSPetAllPrice();
	int selectMPetDayPrice();
	int selectMPetAllPrice();
	int selectLPetDayPrice();
	int selectLPetAllPrice();
	
	int getSumStar();
	int getCntStar();
	
	int insertHeart(WishVO wishvo);
	int deleteHeart(int num);
	
	int getWish();

}
