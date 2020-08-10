package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.infoReportVO;

public interface infoReportMapper {
   public List<infoReportVO> list(Criteria cri);
   public List<infoReportVO> myList(String id);
   public int totalCount(Criteria cri);
   public void insert(infoReportVO vo);
   public void update(infoReportVO vo);
   public void delete(int foundNo);
   public infoReportVO read(int foundNo);
   public void addAttach(@Param("image") String image, @Param("foundNo") int foundNo);
   public void delAttach(int foundNo);
   public List<String> getAttach(int foundNo);
}