package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AdoptFormVO;
import com.example.domain.BoardVO;
import com.example.domain.CounselingVO;
import com.example.domain.DogLikeVO;
import com.example.domain.DonationVO;
import com.example.domain.MissingVO;
import com.example.domain.UserVO;
import com.example.domain.infoReportVO;

public interface MypageMapper {

   public List<AdoptFormVO> applyList(String id);

   public AdoptFormVO applyRead(int applicationNo);
   
   public void counselInsert(CounselingVO vo);
   
   public int totalCount(String id);
   
   public List<DonationVO> donationList(HashMap<String, Object> map);
   
   public List<BoardVO> boardList(HashMap<String, Object> map);
      
   public List<infoReportVO> infoList(HashMap<String, Object> map);
      
   public List<MissingVO> missingList(HashMap<String, Object> map);
      
   public UserVO read(String id);
   
   public List<DogLikeVO> dogLikeList(HashMap<String, Object> map);
   
   public List<DogLikeVO> myDogLikeList(String id);
   
   public void dogLikeDelete(DogLikeVO vo);
   
   public void dogLikeInsert(DogLikeVO vo);
   
   public int count(DogLikeVO vo);
   
   public List<CounselingVO> counselList(String id);
   
   public void counselCancle(String reserveNo);
}