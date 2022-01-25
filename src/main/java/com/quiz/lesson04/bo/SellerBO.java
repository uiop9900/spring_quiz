package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	@Autowired
	private SellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, double temperature) { //seller 클래스를 만들어서 넘겨도 되고 그냥 파라미터로 넘겨도 된다.
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSeller() { //마지막을 출력할거라 굳이 파라미터가 필요치 않다.
		return sellerDAO.selectLastSeller();
	}
	
	//BO에서 내가 이 변수를 꼭 받을건지 말지 결정함
	public Seller getSellerById(int id) { //여기서 id가 있다면 무조건 값이 들어와야 하기때문에 Integer가 아니라 int로 내가 정의한다.
		return sellerDAO.getSellerById(id);
	}
}
