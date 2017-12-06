package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	public List<ScrapVO> listAll() throws Exception;
	
	public void insert(ScrapVO vo) throws Exception;
	
}
