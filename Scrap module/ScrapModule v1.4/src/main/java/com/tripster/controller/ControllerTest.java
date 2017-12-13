package com.tripster.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.SampleVO;
import com.tripster.service.ScrapService;

@RestController
@RequestMapping("/test")
public class ControllerTest {
	
	@Inject
	private ScrapService scrapService;
	
	@RequestMapping("/sample")
	public SampleVO test() {
		
		SampleVO vo = new SampleVO();
		vo.setFf(10);
		vo.setStr("str");
		
		return vo;
		
	}
	
	@RequestMapping("/listTest")
	public List<SampleVO> test2(){
		
		List<SampleVO> list = new ArrayList<>();
		
		for(int i=0;i<5;i++) {
			
			SampleVO vo = new SampleVO();
			vo.setFf(i);
			vo.setStr("str");
			list.add(vo);
			
		}
		
		return list;
		
	}
	
	// responseEntity 웹페이지의 상태 (HttpStatus 상태를 전송 하기 위해 사용)
	// ResponseEntity<return 타입>
	@RequestMapping("/sendentity")
	public ResponseEntity<List<SampleVO>> entity(){
		
		List<SampleVO> list = new ArrayList<>();
		
		for(int i=0;i<5;i++) {
			
			SampleVO vo = new SampleVO();
			vo.setFf(i);
			vo.setStr("str");
			list.add(vo);
			
		}
		return new ResponseEntity<>(list,HttpStatus.NOT_FOUND);
	}
	
	@RequestMapping("/scrap")
	public ResponseEntity<String> scrap(@RequestParam("contentsId")int contentsID){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			scrapService.scrap(contentsID);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping("/scrap/{id}")
	public ResponseEntity<String> scrap2(@PathVariable("id") int id){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			scrapService.scrap(id);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping("/ajax")
	public String ajax() {
		
		
		
		return "test";
		
	}
	

}
