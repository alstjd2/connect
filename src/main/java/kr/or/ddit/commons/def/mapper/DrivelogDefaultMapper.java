package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.DrivelogDefaultVO;

@Mapper
public interface DrivelogDefaultMapper {
    int deleteByPrimaryKey(Long drivelogNo);

    int insert(DrivelogDefaultVO row);

    DrivelogDefaultVO selectByPrimaryKey(Long drivelogNo);

    List<DrivelogDefaultVO> selectAll();

    int updateByPrimaryKey(DrivelogDefaultVO row);
}