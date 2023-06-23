package com.reviewboard.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.reviewboard.mapper.ReviewBoardMapper;
import com.reviewboard.model.ReviewBoardVO;

@Service("reviewBoardService")
@Repository
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private ReviewBoardMapper reviewBoardMapper;

	@Override
	public int insertReviewBoard(ReviewBoardVO rb) {

		return this.reviewBoardMapper.insertReviewBoard(rb);
	}

	@Override
	public List<ReviewBoardVO> selectReviewBoard() {

		return this.reviewBoardMapper.selectReviewBoard();
	}

}
