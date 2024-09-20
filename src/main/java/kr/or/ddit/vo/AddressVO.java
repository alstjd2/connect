package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

@Data
public class AddressVO implements Serializable {
	private int rnum;
	@NotNull(groups = UpdateGroup.class)
	private Integer adrNo;
	@NotNull(groups = UpdateGroup.class)
	private Integer empNo;
	@NotBlank
	private String adrNm;
	private String adrOnepos;
	private String adrPos;
	private String adrDep;
	private String adrAff;
	private String adrMail;
	@NotBlank
	private String adrTel;
	private String adrDelyn;
	private String adrMarkyn;

	private EmployeeVO employee;


}
