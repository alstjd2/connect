package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="grbGubunNo")
@Data

public class GrbGubunVO implements Serializable {
    private int grbGubunNo;

    private int comNo;
    private int empNo;
    private int grbCount;  // 게시글 수를 위한 필드 추가
    private String grbGubunTitle;

    private String grbDelyn;
    private String gubunDate;
    private static final long serialVersionUID = 1L;
    
    private List<GrBoardVO> grBoardList;
    
//    private CompanyVO companyVO;
}