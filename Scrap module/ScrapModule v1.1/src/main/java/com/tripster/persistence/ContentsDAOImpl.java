package com.tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;

@Repository
public class ContentsDAOImpl implements ContentsDAO{
	
	@Inject
	private SqlSession session;
	
	// contentsMapper의 namespace
	private static String namespace = "ContentsMapper";
	
	// contents id 값을 받아서 조회하는 메서드
	@Override
	public ContentsVO read(Integer id) throws Exception{
		return session.selectOne(namespace+".read",id);
	}
	
	
	

}
