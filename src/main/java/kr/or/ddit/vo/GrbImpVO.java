package kr.or.ddit.vo;

import java.io.Serializable;

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
@EqualsAndHashCode(of="grbImpNo")
@Data
public class GrbImpVO implements Serializable {
    private int grbImpNo;

    private int grbNo;

    private int empNo;

    private static final long serialVersionUID = 1L;
    
    private GrBoardVO grBoard;
}