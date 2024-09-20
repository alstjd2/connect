package kr.or.ddit.web.early.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.EarlyAdminVO;

@Mapper
public interface EarlyAdminMapper {

   public Integer insertEarlyAdmin(EarlyAdminVO earlyAdmin);
   public EarlyAdminVO selectEarlyAdmin(int earlyAdminNo);
   public List<EarlyAdminVO> selectEarlyAdminList();
   public int updateEarlyAdmin(EarlyAdminVO earlyAdmin);
   public int deleteEarlyAdmin(int earlyAdminNo);
   
}