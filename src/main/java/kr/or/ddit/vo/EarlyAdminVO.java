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
@EqualsAndHashCode(of="earlyAdminNo")
@Data
public class EarlyAdminVO implements Serializable {
    /**
     * 관리자번호
     */
    private int earlyAdminNo;

    /**
     * 초기문의게시판 번호
     */
    private int earlyNo;

    /**
     *  답변완료면 Y 답변전이면 n
     * 
     */
    private String earlyYn;

    private static final long serialVersionUID = 1L;
    
    private EarlyVO early;
}