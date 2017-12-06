package com.tripster.service;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapService {
	
	public List<ScrapVO> listAll() throws Exception;
	
	public void scrap(ScrapVO vo) throws Exception;
		
}
