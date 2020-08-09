package com.example.service;

import com.example.domain.BoardVO;

public interface BoardService {
   public void insert(BoardVO vo);
   public void update(BoardVO vo);
   public void delete(int postingNo);
}