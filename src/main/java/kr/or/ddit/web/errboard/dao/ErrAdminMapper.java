package kr.or.ddit.web.errboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.ErrAdminVO;
import kr.or.ddit.vo.ErrBoardVO;

@Mapper
public interface ErrAdminMapper {

    public Integer insertErrAdmin(Map<String, Object> params);
    public ErrAdminVO selectErrAdmin(int errAdminNo);
    public List<ErrAdminVO> selectErrAdminList();
    public int updateErrAdmin(ErrAdminVO errAdmin);
    public int deleteErrAdmin(int errAdminNo);
    public AtchFileDetailVO download(int atchFileId, int fileSn);

}