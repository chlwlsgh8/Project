package com.tripster.persistence;

import com.tripster.domain.ContentsVO;


public interface ContentsDAO {
	
	// contents id 값을 받아서 조회하는 메서드
	public ContentsVO read(Integer id) throws Exception;
	

}
