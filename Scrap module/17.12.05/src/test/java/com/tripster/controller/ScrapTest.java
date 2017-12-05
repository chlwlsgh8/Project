package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ScrapTest {

	@Inject
	private ScrapDAO dao;
	
	@Test
	public void testCreate() throws Exception {
	
		ScrapVO scrap = new ScrapVO();
		scrap.setCodeID(1);
		scrap.setContentsID(1);
		scrap.setContentsPhoto("str");
		scrap.setContentsTitle("t");
		scrap.setMemberID(3);
		scrap.setScrapID(1);
		dao.create(scrap);
		
	}
	
}
