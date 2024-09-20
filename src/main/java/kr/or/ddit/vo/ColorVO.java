package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ColorVO implements Serializable {
	private Integer corNo;
	private String corNm;
	private Integer corHsla;

}
