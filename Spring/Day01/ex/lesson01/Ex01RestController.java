package com.example.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/ex01")
@RestController  // @Controller + @Responsebody 
public class Ex01RestController {
	
	// http://localhost:8080/lesson01/ex01/3 
	@RequestMapping("/3")
	public String printString() {
		return "@RestController를 사용해서 String을 return해본다.";
	}
	
	// http://localhost:8080/lesson01/ex01/4
	@RequestMapping("/4")
	public Map<String, String> printMap() {
		Map<String, String> map = new HashMap<>();
		map.put("aaa", "zzz");
		map.put("bbb", "qqq");
		map.put("ccc", "www");
		return map;
	}
}
