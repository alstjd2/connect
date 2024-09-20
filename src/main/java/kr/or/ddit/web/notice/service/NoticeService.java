package kr.or.ddit.web.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.dao.BoardMapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {

	@Autowired
	BoardMapper boardMapper;

	public List<BoardVO> NoticeTypeList(String tabs){
		if ("notice".equals(tabs)) tabs = "DA01110";
		else if("update".equals(tabs)) tabs = "DA01180";

		log.info("파라미터 춫ㄹ력 {}",tabs);

		return boardMapper.selectNoticeTypeList(tabs);
	}



	public Map<String, Integer> headerInfo(){
		Map<String, Integer> headerList = new HashedMap<>();

		int update = boardMapper.selectBoardTypeCnt("DA01110");
		int notice = boardMapper.selectBoardTypeCnt("DA01180");

		if(update <0) update=0;
		if(notice <0) notice=0;

		headerList.put("update",update );
		headerList.put("notice",notice );
		headerList.put("total",notice+update );

		return headerList;

	}

}
