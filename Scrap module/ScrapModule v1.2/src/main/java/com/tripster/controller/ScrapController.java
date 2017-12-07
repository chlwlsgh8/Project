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
	private ScrapService scrapService;
	
	// 스크랩 리스트 페이지 맵핑
	@RequestMapping(value="/scraplist",method=RequestMethod.GET)
	public void scraplist(@RequestParam("Member_ID") int Member_ID,Model model) throws Exception {
		
		loger.info("scrap list");
		
		// 받아온 memberID값의 객체리스트를 모델에 담아 뷰에 전달
		model.addAttribute("list",scrapService.listAll(Member_ID));
		
	}
	
	@RequestMapping(value="/scraplist",method=RequestMethod.POST)
	public String scraplistRemove(@RequestParam("scrapID") int scrapID) throws Exception {
		
		loger.info("scrapid:"+scrapID);
		
		scrapService.delete(scrapID);
		
		return "redirect:/mypage/scraplist?Member_ID=1";
	}
	
	
}
