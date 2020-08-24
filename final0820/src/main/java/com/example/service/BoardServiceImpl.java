package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
   @Autowired
   BoardMapper mapper;
   
   @Transactional
   @Override
   public void insert(BoardVO vo) {
      
      mapper.insert(vo);
      System.out.println(vo.toString());
      List<String> images = vo.getImages();
      for (String image : images) {
         mapper.addAttach(image, vo.getPostingNo() );
         
      }

   }

   
   
   @Transactional
   @Override
   public void update(BoardVO vo) {
      System.out.println(vo.toString());
      mapper.update(vo);
      List<String> images = vo.getImages();
      if (images.size() > 0) {
         mapper.delAttach(vo.getPostingNo());
         for (String image : images) {
            mapper.addAttach(image, vo.getPostingNo());
         }
      }
   }

   @Transactional
   @Override
   public void delete(int postingNo) {
      mapper.delAttach(postingNo);
      mapper.delete(postingNo);

   }
}