package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.MailDefaultVO;

@Mapper
public interface MailDefaultMapper {
    int deleteByPrimaryKey(Long mailNo);

    int insert(MailDefaultVO row);

    MailDefaultVO selectByPrimaryKey(Long mailNo);

    List<MailDefaultVO> selectAll();

    int updateByPrimaryKey(MailDefaultVO row);
}