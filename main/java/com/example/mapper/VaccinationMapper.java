package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.VaccinationVO;

public interface VaccinationMapper {
   //����Ʈ ���
   public List<VaccinationVO> list();
   //�Է�
   public void insert(VaccinationVO vo);
   //�б�
   public VaccinationVO read(String code);
   //������Ʈ
   public void update(VaccinationVO vo);
   //����
   public void delete(String code);
   //�����Ͱ���
   public int totalCount(Criteria cri);
}