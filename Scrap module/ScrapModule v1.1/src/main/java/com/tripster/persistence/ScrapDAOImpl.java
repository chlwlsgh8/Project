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
	
	// 리스트를 불러오는 메서드
	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return session.selectList(namespace + ".listAll",memberid);
	}
	
	// 스크랩 리스트에 데이터 추가하는 메서드
	@Override
	public void insert(ScrapVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}

}
