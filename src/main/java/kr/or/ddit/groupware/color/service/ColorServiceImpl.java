package kr.or.ddit.groupware.color.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.color.dao.ColorMapper;
import kr.or.ddit.vo.ColorVO;

@Service
public class ColorServiceImpl implements ColorService {
	@Autowired
	private ColorMapper mapper;

	@Override
	public ColorVO retrieveBuyer(Integer corNo) throws PkNotFoundException {
		ColorVO color = mapper.selectColor(corNo);
		if(color==null)
			throw new PkNotFoundException(corNo);
		return color;
	}

	@Override
	public List<ColorVO> retrieveBuyerList() {
		return mapper.selectColorList();
	}

	@Override
	public void createColor(ColorVO color) {
		mapper.insertColor(color);

	}

	@Override
	public void modifyColor(ColorVO color) {
		mapper.updateColor(color);

	}

}
