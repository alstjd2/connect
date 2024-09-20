package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@EqualsAndHashCode(of="earlyNo")
@Data
public class EarlyVO implements Serializable {
    private int earlyNo;

    private String comNm;

    private String earlyPerinfocollection;

    private String earlyEmail;

    private String earlyPhone;
    
    private String earlyStatus;

    private static final long serialVersionUID = 1L;
    
    private List<EarlyAdminVO> earlyAdmin;
}