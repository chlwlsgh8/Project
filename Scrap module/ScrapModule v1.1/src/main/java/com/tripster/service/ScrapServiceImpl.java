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

	// 컨트롤러로 리스트 메서드 전달
	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return dao.listAll(memberid);
	}
	
	// 컨트롤러로 insert 메서드 전달
	@Override
	public void scrap(ScrapVO vo) throws Exception{
		dao.insert(vo);
	}

}
