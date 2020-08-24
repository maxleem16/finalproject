package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.DonationVO;

public interface DonationMapper {
    public List<DonationVO> list(Criteria cri);
    public List<DonationVO> myList(@Param ("id") String id,@Param ("donationMethod") String donationMethod);
    public DonationVO read(int donationNo);
    public List<DonationVO> applyList(HashMap<String, Object> map);
    public void insert(DonationVO vo);
    public int totalCount(Criteria cri);
    public int totalCount2(String donationMethod);
    public int totalPrice(String donationMethod);
    public List<DonationVO> donationByMonth();
    public List<DonationVO> donationByDonor();
    public int totalDonor();
    public int sumPrice();
    public int avgPrice();
}