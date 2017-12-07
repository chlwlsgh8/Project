package com.tripster.service;

import com.tripster.domain.ContentsVO;

public interface ContentsService {
	
	// id값을 받아 조회하는 메소드
	public ContentsVO read(Integer id) throws Exception;

}
