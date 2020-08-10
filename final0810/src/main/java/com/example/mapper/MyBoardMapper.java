package com.example.mapper;

import java.util.HashMap;
import java.util.List;


import com.example.domain.BoardVO;
import com.example.domain.MissingVO;
import com.example.domain.infoReportVO;

public interface MyBoardMapper {
   public int totalCount(String id);
   public List<BoardVO> boardList(HashMap<String, Object> map);
   public List<infoReportVO> infoList(HashMap<String, Object> map);
   public List<MissingVO> missingList(HashMap<String, Object> map);
}