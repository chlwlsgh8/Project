package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/mypage/*")
public class ScrapController {
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	@Inject
	private ScrapService service;
	
	@RequestMapping(value="/scraplist",method=RequestMethod.GET)
	public void scraplist(@RequestParam("Member_ID") int Member_ID,Model model) throws Exception {
		
		loger.info("scrap list");
		
		model.addAttribute("list",service.listAll(Member_ID));
		
	}
	
	
}
