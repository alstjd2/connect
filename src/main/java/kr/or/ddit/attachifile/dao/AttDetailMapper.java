package kr.or.ddit.attachifile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttDetailVO;

@Mapper
public interface AttDetailMapper {
	
	public int insertAttDetail(AttDetailVO attDetail);

	public List<AttDetailVO> selectAttDetailList();

	public AttDetailVO selectAttDetail(int attNo);

	public int updateAttDetail(AttDetailVO attDetail);

    public int deleteAttDetail(int attNo);
}