package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.service.ScrapService;

@RestController
public class ScrapModuleController {
	
	@Inject
	private ScrapService scrapService;
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapModuleController.class);

	// 스크랩 추가
	@RequestMapping(value="/scrap/{id}",method=RequestMethod.POST)
	public ResponseEntity<String> scrap(@PathVariable("id") int id,Model model) {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// id 값을 받아서 스크랩 추가
			scrapService.scrap(id);
			loger.info("scrap success");
			entity = new ResponseEntity<>("success",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 제거
	@RequestMapping(value="/scrapremove/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<String> scrapremove(@PathVariable("contentsID") int contentsID) {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// 스크랩 제거
			loger.info("scrap remove");
			// 스크랩 제거
			scrapService.contentsScrapDelete(contentsID);
			entity = new ResponseEntity<>("remove",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}

}
