package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger =  LoggerFactory.getLogger(AdminController.class);
	/* 관리자 메인 페이지 이동 */
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
      log.info("관리자페이지 이동");
        
    }
}
