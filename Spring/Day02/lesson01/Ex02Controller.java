package com.example.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  // @Rescontroller가 아님에 주의, 뷰는 @ResponseBody가 없다. 
public class Ex02Controller {
	
	@RequestMapping("/lesson01/ex02/1")
	public String view() {
		// @ResponseBody가 아닌 형태로 String을 return하면,
		// ViewResolver에 의해 리턴된 String의 경로에 해당하는 view를 찾고 view 화면이 구성된다. 
		
		// application.properties에서 경로가 있어서,
		// 그 경로상의 앞 뒤를 제외한 중간 나머지 부분만 작성해주면 된다. 
		return "lesson01/ex02";
	}
}
