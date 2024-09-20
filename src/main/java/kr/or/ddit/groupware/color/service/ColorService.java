package kr.or.ddit.groupware.color.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.ColorVO;

public interface ColorService {
	/**
	 * 컬러 상세 조회
	 * @param corNo 조회할 컬러의 PK
	 * @return 존재하지 않는다면, {@link PkNotFoundException}
	 */
	public ColorVO retrieveBuyer(Integer corNo) throws PkNotFoundException;
	public List<ColorVO> retrieveBuyerList();
	public void createColor(ColorVO color);
	public void modifyColor(ColorVO color);

}
