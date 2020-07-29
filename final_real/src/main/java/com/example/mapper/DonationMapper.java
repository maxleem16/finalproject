package com.example.mapper;

import java.util.HashMap;
import java.util.List;
import com.example.domain.Criteria;
import com.example.domain.DonationVO;

public interface DonationMapper {
    public List<DonationVO> list(Criteria cri);
    public DonationVO read(int donationNo);
    public List<DonationVO> applyList(HashMap<String, Object> map);
    public void insert(DonationVO vo);
    public int totalCount(Criteria cri);
    public int totalCount2(String donationMethod);
    public int totalPrice(String donationMethod);
}
