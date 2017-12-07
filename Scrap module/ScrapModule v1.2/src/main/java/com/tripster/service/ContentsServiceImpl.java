package com.tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ContentsVO;
import com.tripster.persistence.ContentsDAO;

@Service
public class ContentsServiceImpl implements ContentsService{
	
	@Inject 
	private ContentsDAO dao;
	
	// 컨트롤러로 read 메서드 전달
	public ContentsVO read(Integer id) throws Exception{
		return dao.read(id);
	}

}
