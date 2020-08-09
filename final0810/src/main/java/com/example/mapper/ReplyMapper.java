package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ReplyVO;

public interface ReplyMapper {
   public List<ReplyVO> list(HashMap<String, Object> map);
   public void insert(ReplyVO vo);
   public void delete(int commentNo);
   public ReplyVO read(int commentNo);
}