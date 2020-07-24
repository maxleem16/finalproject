package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.DonationVO;

public interface DonationMapper {
    public List<DonationVO> list(Criteria cri);
    public List<DonationVO> applyList(@Param("donationMethod") String donationMethod,
    									@Param("cri") Criteria cri);
    public void insert(DonationVO vo);
    public int totalCount(Criteria cri);
    public int totalCount2(@Param("donationMethod") String donationMethod,
							@Param("cri") Criteria cri);
    public int totalPrice(String donationMethod);
}
