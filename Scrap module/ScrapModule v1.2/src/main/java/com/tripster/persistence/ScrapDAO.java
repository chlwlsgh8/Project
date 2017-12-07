package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	// 스크랩 관련 전체 리스트를 불러오는 메서드
	public List<ScrapVO> listAll(Integer memberid) throws Exception;
	
	// scrap 객체를 받아 스크랩 리스트에 추가하는 메서드 
	public void insert(ScrapVO vo) throws Exception;
	
	public void delete(Integer scrapID) throws Exception;
	
}
