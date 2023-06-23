package com.reviewboard.service;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.reviewboard.model.ReviewBoardVO;

@Service
public interface ReviewBoardService {
	
	int insertReviewBoard(ReviewBoardVO rb);
	
	List<ReviewBoardVO> selectReviewBoard();

}
