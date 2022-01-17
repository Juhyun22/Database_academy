package com.example.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/ex01")
@RestController  // @Controller + @Responsebody 
public class Ex01RestController {  // Spring Bean
	
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
	
	// http://localhost:8080/lesson01/ex01/5
	@RequestMapping("/5")
	public Data printData() {
		Data data = new Data();  // 일반 자바 bean 
		
		data.setId(1);
		data.setName("박보라");
		
		return data;  // 일반 bean 객체도 JSON으로 내려간다.	
	}
	
	// http://localhost:8080/lesson01/ex01/6
	@RequestMapping("/6")
	public ResponseEntity<Data> printEntity() {
		Data data = new Data();
		data.setId(2);
		data.setName("보라해");
		
		// return new ResponseEntity<>(data, HttpStatus.OK);
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}







