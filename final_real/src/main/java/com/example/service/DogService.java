package com.example.service;

import com.example.domain.DogVO;

public interface DogService {
   public void insert(DogVO vo);
   public void update(DogVO vo);
   public void delete(String dogCode);
}