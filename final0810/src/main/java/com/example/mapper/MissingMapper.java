package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.MissingVO;

public interface MissingMapper {
    public List<MissingVO> list(Criteria cri);
    public List<MissingVO> myList(String id);
    public MissingVO read(int reportNo);
    public void insert(MissingVO vo);
    public void delete(int reportNo);
    public void update(MissingVO vo);
    public int totalCount(Criteria cri);
    public void addAttach(@Param("image") String image, @Param("reportNo") int reportNo);
   public List<String> getAttach(int reportNo);
   public void delAttach(int reportNo);
}