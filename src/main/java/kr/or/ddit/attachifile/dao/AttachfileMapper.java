package kr.or.ddit.attachifile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachfileVO;

@Mapper
public interface AttachfileMapper {
	
	public int insertAttachfile(AttachfileVO attachfile);

	public List<AttachfileVO> selectAttachfileList();

	public AttachfileVO selectAttachfile(int attNo);

	public int updateAttachfile(AttachfileVO attachfile);

    public int deleteAttachfile(int attNo);
}