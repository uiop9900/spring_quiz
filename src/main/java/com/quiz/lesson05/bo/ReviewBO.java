package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.ReviewDAO;
import com.quiz.lesson05.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<Review> getReviewListByStoreId(int storeId) {
		return reviewDAO.selectReviewListByStoreId(storeId);
	}
}
