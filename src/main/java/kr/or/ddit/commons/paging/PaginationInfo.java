package kr.or.ddit.commons.paging;

import java.util.HashMap;
import java.util.Map;

import lombok.Getter;

/**
 * 페이징 기능을 사용할때 기능은 유사하지만 이미지나 라벨등의 포맷만 다양하게 사용하게 되는 경우가 있다.
 *
 *  따라서 포맷별로 렌더링할 클래스를 빈설정 파일에 설정하고
 * 태그에서 입력된 정보를 기반으로 어떤 렌더링 클래스를 사용할지 결정하는 방식으로 동작한다.
 *
 * PaginationRenderer = 포맷에 따라 페이징을 렌더링하는 역활을 담당하고,
 * PaginationManager = 어떤 PaginationRenderer을 사용할지를 담당한다. 렌더링에 필요한 데이터는 PaginationInfo에 담겨 있다.
 *
 */
@Getter
public class PaginationInfo<T> {

   private int totalRecord              ;   // DB 조회 필요
   private int page                 ;  // 사용자의 요청 파라미터
   private T searchVO;



   public void setTotalRecord(int totalRecord) {
      this.totalRecord = totalRecord;
   }
   public void setPage(int page) {
      this.page = page;
   }
   //--------------------------------------------------------


   private int recordCount =7              ;   // 임의 결정, 스크린 사이즈
   private int pageSize   =5           ;   // 임의 결정, 한 구간에서 몇개의 숫자를 보여줄건지



   /**
    * 기본 생성자를 사용할시 기본 값을 사용
    *    - recordCount =10
    *    - pageSize   =5
    */
   public PaginationInfo() {
      this(7,5);
   }
   


   public T getSearchVO() {
       return searchVO;
   }

   /**
    * recordCount와 pageSize 사이즈 변경할 수 있음
    * @param recordCount
    * @param pageSize
    */
   public PaginationInfo(int recordCount, int pageSize) {
      super();
      this.recordCount = recordCount;
      this.pageSize = pageSize;
   }

   private Map<String, Object> detailCondition = new HashMap<>(); // 상세 검색용
   public void addSearchCondition(String condition, Object value) {
	   detailCondition.put(condition, value); // 검색조건 추가할 때 사용하는 용도
   }


   public void setDetailCondition(Map<String, Object> detailCondition) {
	   this.detailCondition = detailCondition;
   }

   private SimpleCondition simpleCondition; // 키워드 검색용


   public void setSimpleCondition(SimpleCondition simpleCondition) {
	   this.simpleCondition = simpleCondition;
   }

   // 연산 필요 -> setter가 있으면 안됨.

   public int getTotalPage() {
      return ((totalRecord-1)/recordCount) + 1;
   }
   public int getFirstPage() {
	   return ((page-1)/pageSize)*pageSize + 1;
   }
   public int getLastPage() {
	   int lastPageNoOnPageList =getFirstPage()+pageSize-1;
	   if(lastPageNoOnPageList>getTotalPage()){lastPageNoOnPageList=getTotalPage();}
	   return lastPageNoOnPageList;
   }
   public int getFirstRecord() {
      return getLastRecord() - (recordCount - 1);
   }
   public int getLastRecord() {
      return page * recordCount;
   }


	public void setSearchVO(T searchVO) {

		this.searchVO = searchVO;
	}
	
	public void setRecordCount(int recordCount) {
	    this.recordCount = recordCount;
	}
	


























}
