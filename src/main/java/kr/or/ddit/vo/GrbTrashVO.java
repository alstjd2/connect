package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="trashNo")
@Data
public class GrbTrashVO implements Serializable {
    private int trashNo;
    private int grbNo;
    private int empNo;
    
    private static final long serialVersionUID = 1L;
    private GrBoardVO grBoard;
    private EmployeeVO employee;
}