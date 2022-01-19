package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController // return값이 JSON일것이기때문에 Rest로 선언함.
public class StoreRestController { //메소드, 파일명 길어도 된다. 이해가게끔만 짓기
	
	@Autowired
	private StoreBO storeBO;//주입해준다.(DI: dependency Injection) 내가 new를 하지않았는데 나에게 주입시켜준다. , 사용법을 알고 배우면 이해하기 쉬움
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		return storeBO.getStoreList(); //json (@ResponseBody가 있어서 jackson 라이브러리 작동), 계속 사용법에만 집중하면 내부의 흐름을 잘 몰라서 세세하게 오류를 잡기힘들다.
										// 계속 공부하고 어떤식의 흐름으로 되는 건지 알아야 한다. 프레임워크가 어디까지 해주고, 
	}
	
}
