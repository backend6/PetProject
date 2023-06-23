package com.reviewboard.mapper;

import java.util.List;
import java.util.Map;

import com.reviewboard.model.ReviewBoardVO;

public interface ReviewBoardMapper {

	int insertReviewBoard(ReviewBoardVO rb); // 넣기

 	List<ReviewBoardVO> selectReviewBoard(); // 갖고오기

}
