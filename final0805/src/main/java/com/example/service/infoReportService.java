package com.example.service;

import com.example.domain.infoReportVO;

public interface infoReportService {
   public void insert(infoReportVO vo);
   public void update(infoReportVO vo);
   public void delete(int foundNo);
}