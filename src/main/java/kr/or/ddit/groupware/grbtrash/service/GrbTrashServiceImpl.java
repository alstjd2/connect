package kr.or.ddit.groupware.grbtrash.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.grboard.dao.GrbReplyMapper;
import kr.or.ddit.groupware.grbtrash.dao.GrbTrashMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GrbTrashServiceImpl implements GrbTrashService {
	@Autowired
	GrbTrashMapper trashMapper;
	
	@Autowired
	GrbReplyMapper replyMapper;

	    @Transactional
		@Override
		public void restoreFromTrash(Map<String, Object> params) {
	    	trashMapper.restoreFromTrash(params);
	    	trashMapper.updateGrbDelynToN(params);
		}
	    
		@Override
		public void permanentDelete(Map<String, Object> params) {
	    	replyMapper.deleteReply(params);
	    	trashMapper.permanentDeleteGrboard(params);
	    	trashMapper.permanentDelete(params);
	    	
		}
		
	    @Transactional
		@Override
		public void insertGrbTrash(Map<String, Object> params) {
	
		    	trashMapper.insertGrbTrash(params);
		    	trashMapper.updateGrbDelynToY(params);
			
		}
	    
		 public boolean isTrashMarked(Map<String, Object> params) {
		        // grbNo와 empNo를 기반으로 데이터베이스에서 존재 여부를 확인
		        return trashMapper.TrashCount(params) > 0;
		    }
		 
		@Override
		public void permanentDeleteGrboard(Map<String, Object> params) {
			// TODO Auto-generated method stub
			
		}
		@Override
		public void permanentDeleteReply(Map<String, Object> params) {
			// TODO Auto-generated method stub
			
		}

}

