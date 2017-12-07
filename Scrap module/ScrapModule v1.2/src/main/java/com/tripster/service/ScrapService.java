package com.tripster.service;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapService {
	
	// memberID값을 받아 객체리스트를 불러오는 메소드
	public List<ScrapVO> listAll(Integer memberid) throws Exception;
	
	// 스크랩 객체를 받아 db에 저장하는 메소드
	public void scrap(ScrapVO vo) throws Exception;
	
	// 스크랩 아이디를 받아 삭제
	public void delete(Integer scrapID) throws Exception;
}
