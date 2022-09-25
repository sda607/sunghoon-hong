package com.spring.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class sampleTests {

	@Autowired
	private Restaurent restaurent;
	
	@Autowired
	private SampleHotel hetel;
	
	@Test
	public void testHotel() {
		
		log.info(hetel);
		
	}
	
	@Test
	public void test1() {
		
		
		System.out.println("tesete,,,,,");
		log.info("test121231231");
		log.info(restaurent);
	}
}
