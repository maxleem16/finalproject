package com.example.service;

import com.example.domain.AdoptFormVO;
import com.example.domain.AdoptVO;

public interface AdoptService {
   public void insert(AdoptFormVO vo);
   public void cancle(AdoptVO vo);
}