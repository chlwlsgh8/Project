package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO dao;

	
	@Override
	public List<ScrapVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	@Override
	public void scrap(ScrapVO vo) throws Exception{
		dao.insert(vo);
	}

}
