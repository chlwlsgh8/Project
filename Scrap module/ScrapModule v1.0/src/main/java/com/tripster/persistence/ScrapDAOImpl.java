package com.tripster.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;

@Repository
public class ScrapDAOImpl implements ScrapDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "ScrapMapper";
	
	@Override
	public List<ScrapVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public void insert(ScrapVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}

}
