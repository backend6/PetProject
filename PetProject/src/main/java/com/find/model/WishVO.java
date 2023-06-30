package com.find.model;

import lombok.Data;

@Data
public class WishVO {
	
	private int wno;			// 찜목록 인덱스
	
	private String unickname;	// 이용자 닉네임 - members_fk
	private String snickname;	// 찜한 펫시터 닉네임 - members_fk
	
	private String ino;			// 펫시터 소개 번호? - introduce_fk
	private String saddr;		// 펫시터 지역
	private String title;		// 펫시터 소개 제목
	private int wcheck;			// 찜 여부 체크
}
