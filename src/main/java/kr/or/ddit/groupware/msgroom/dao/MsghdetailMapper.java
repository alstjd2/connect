package kr.or.ddit.groupware.msgroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MsghdetailVO;

@Mapper
public interface MsghdetailMapper {
    int deleteMsghdetail(int msghdNo);

    int insertMsghdetail(MsghdetailVO row);

    MsghdetailVO selectMsghdetail(int msghdNo);

    List<MsghdetailVO> selectAll();

    int updateMsghdetail(MsghdetailVO row);
}