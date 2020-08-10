package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.DogVO;

public interface DogMapper {
   public void insert(DogVO vo);

   public List<DogVO> list(Criteria cri);

   public int totalCount(Criteria cri);

   public DogVO read(String dogCode);

   public void dog_attach(@Param("dogCode") String dogCode, @Param("image") String image);

   public void adoptedDog(DogVO vo);
}