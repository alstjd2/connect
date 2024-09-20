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
@EqualsAndHashCode(of="errAdminNo")
@Data
public class ErrAdminVO implements Serializable {
    private int errAdminNo;

    private int errNo;

    private String errContent;

    private static final long serialVersionUID = 1L;
    
    private ErrBoardVO errBoard;
}