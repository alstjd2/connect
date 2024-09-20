package kr.or.ddit.commons.commonsCode.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.CommoncodeDetailDefaultVO;

@Mapper
public interface CommoncodeDetailMapper {

    
    List<CommoncodeDetailDefaultVO> selectSelectAll(String conmcdNo);
}