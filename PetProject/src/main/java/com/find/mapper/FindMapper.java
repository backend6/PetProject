package com.find.mapper;

public interface FindMapper {
	
	String selectNickname();
	String selectTitle();
	String selectAddr();
	String selectContent();
	String selectShortContent();
	
	int selectSPetDayPrice();
	int selectSPetAllPrice();
	int selectMPetDayPrice();
	int selectMPetAllPrice();
	int selectLPetDayPrice();
	int selectLPetAllPrice();
	
	int getSumStar();
	int getCntStar();
}
