package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AdoptVO;
import com.example.mapper.AdoptMapper;

@RunWith(SpringJUnit4ClassRunner.class)    
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MysqlTest {
	/*
    @Autowired
    private AdoptMapper mapper;
    @Test
    public void count() {
    	AdoptVO vo=new AdoptVO();
    	vo.setCancleCheck("1");
    	vo.setApplicant("user01");
    	mapper.cancleCount(vo);
    }
    */
}
