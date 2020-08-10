package com.example.service;

import com.example.domain.MissingVO;

public interface MissingService {

	public void insert(MissingVO vo);
    public void delete(int reportNo);
    public void update(MissingVO vo);
}
