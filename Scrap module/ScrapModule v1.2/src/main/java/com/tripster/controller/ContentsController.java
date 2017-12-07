package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;
import com.tripster.service.ContentsService;
import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/contents/*")
public class ContentsController {
	
private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	// 서비스 객체 생성
	@Inject
	private ContentsService service;
	@Inject
	private ScrapService scrapService;
	
	// 맛점 컨텐츠페이지 맵핑 
	@RequestMapping(value="/foody",method=RequestMethod.GET)
	public void foody(@RequestParam("Restaurant_ID") int Restaurant_ID,Model model) throws Exception {
		
		loger.info("foody page");
		// 컨텐츠 테이블 객체 생성
		ContentsVO vo = new ContentsVO();
		// url에서 받아온값으로 db에서 맛집관련 데이터 불러와 저장
		vo = service.read(Restaurant_ID);
		loger.info(vo.toString());
		// 불러온 데이터를 모델객체에 넣어 뷰에 전달
		model.addAttribute(vo);
		
	}
	
	// scrap 기능 맵핑
	@RequestMapping(value="/foody",method=RequestMethod.POST)
	public String scrap(@RequestParam("Restaurant_ID") int Restaurant_ID,Model model) throws Exception {
		
		ContentsVO cont = new ContentsVO();
		ScrapVO vo = new ScrapVO();
		// 받아온 Restaurant_ID값인 컨텐츠 테이블을 객체에저장
		cont = service.read(Restaurant_ID);
		vo.setScrapID(7);
		// 가져온 contents값을 scrap 테이블에 저장
		vo.setCodeID(cont.getCodeID());
		vo.setContentsID(cont.getID());
		vo.setContentsTitle(cont.getTitle());
		vo.setContentsPhoto(cont.getContents());
		// scrap객체 db에 저장
		scrapService.scrap(vo);
		
		loger.info("db추가 성공");
		// 원래 페이지로 redirect
		return "redirect:/contents/foody?Restaurant_ID="+Restaurant_ID;
	}

}
