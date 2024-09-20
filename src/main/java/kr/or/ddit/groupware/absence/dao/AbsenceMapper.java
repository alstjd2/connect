package kr.or.ddit.groupware.absence.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AbsenceVO;

@Mapper
public interface AbsenceMapper {
    int deleteAbsence(int abNo);

    int insertAbsence(AbsenceVO row);

    AbsenceVO selectAbsence(int abNo);

    List<AbsenceVO> selectAll();

    int updateAbsence(AbsenceVO row);
}