package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceVO;
import com.tripster.persistence.PlaceDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PlaceDAOTest {

	@Inject
	private PlaceDAO dao;
	
	Criteria cri = new Criteria();
	
	//맛집 상세 정보 검색 / 조회수 갱신 테스트
	@Test
	public void testRead() throws Exception {
		System.out.println(dao.read(1).toString());
		dao.updatePlaceViewCnt(1);
		System.out.println(dao.read(1).toString());
	}
	
	//맛집 리스트 조회 테스트
	@Test
	public void testGetPlaceList() throws Exception {
		cri.setCurPage(1);
		cri.setContentsPerPage(5);
		List<PlaceVO> list = dao.getPlaceList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
	}
	
	//총 맛집 정보 수 조회 테스트
	@Test
	public void testGetTotalPlaceNum() throws Exception {
		System.out.println(dao.getTotalPlaceNum(cri));
	}
}
