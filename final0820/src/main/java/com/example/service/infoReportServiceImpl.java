package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.infoReportVO;
import com.example.mapper.infoReportMapper;

@Service
public class infoReportServiceImpl implements infoReportService{
   @Autowired
   infoReportMapper mapper;
   
   @Transactional
   @Override
   public void insert(infoReportVO vo) {
      
      mapper.insert(vo);
      List<String> dogImages = vo.getDogImages();
      for (String image : dogImages) {
         mapper.addAttach(image, vo.getFoundNo() );
         
      }

   }

   
   
   @Transactional
   @Override
   public void update(infoReportVO vo) {
      System.out.println(vo.toString());
      mapper.update(vo);
      List<String> dogImages = vo.getDogImages();
      if (dogImages.size() > 0) {
         mapper.delAttach(vo.getFoundNo());
         for (String image : dogImages) {
            mapper.addAttach(image, vo.getFoundNo());
         }
      }
   }

   @Transactional
   @Override
   public void delete(int foundNo) {
      mapper.delAttach(foundNo);
      mapper.delete(foundNo);

   }
}