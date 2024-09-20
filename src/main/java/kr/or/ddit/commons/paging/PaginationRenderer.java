package kr.or.ddit.commons.paging;

public interface PaginationRenderer {
	public String renderPagination(PaginationInfo paginationInfo,String jsFunction);
	public default String renderPagination(PaginationInfo paginationInfo) {
		return renderPagination(paginationInfo, null);
	}
}
