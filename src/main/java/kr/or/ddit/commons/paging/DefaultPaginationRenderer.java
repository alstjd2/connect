package kr.or.ddit.commons.paging;

public class DefaultPaginationRenderer implements PaginationRenderer {

	@Override
	public String renderPagination(PaginationInfo paging, String funcName) {
		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int pageSize = paging.getPageSize();
		int totalPage = paging.getTotalPage();
		int nowPage = paging.getPage();
		
		
		StringBuffer pagingHTML = new StringBuffer();
		String active = "";
		String pattern ="<li class='page-item'><a class='page-link %s' href='javascript:;' data-page='%d' %s>%s</a></li>";
		
		pagingHTML.append(
			"<nav aria-label=\"Page navigation example\">\n<ul class=\"pagination\">"
		);
//		if(firstPage > pageSize) {
//			pagingHTML.append(
//				String.format(pattern,"", firstPage-pageSize , "aria-label='Previous'","<span aria-hidden=\"true\">«</span>")
//			);
//		}
		pagingHTML.append(
	            String.format(pattern, "", firstPage, "aria-label='Previous'", "<i class=\"tf-icon bx bx-chevrons-left bx-sm\"></i>")
	        );
		// Previous 버튼 (1페이지가 아닐 때만 활성화)
        if (nowPage > 1) {
            pagingHTML.append(
                String.format(pattern, "", nowPage - 1, "aria-label='Previous'", "<i class=\"tf-icon bx bx-chevron-left bx-sm\"></i>")
            );
        } else {
            pagingHTML.append(
                String.format(pattern, "disabled", nowPage - 1, "aria-label='Previous'", "<i class=\"tf-icon bx bx-chevron-left bx-sm\"></i>")
            );
        }
		
		for(int page = firstPage; page <= lastPage; page++) {
			if(page==nowPage) active = "active";
			else active = "";
			pagingHTML.append(
				String.format(pattern, active, page, "", page)
			);
		}
		// Next 버튼 (마지막 페이지가 아닐 때만 활성화)
        if (nowPage < totalPage) {
            pagingHTML.append(
                String.format(pattern, "", nowPage + 1, "aria-label='Next'", "<i class=\"tf-icon bx bx-chevron-right bx-sm\"></i>")
            );
        } else {
            pagingHTML.append(
                String.format(pattern, "disabled", nowPage + 1, "aria-label='Next'", "<i class=\"tf-icon bx bx-chevron-right bx-sm\"></i>")
            );
        }
//		if(lastPage < totalPage) {
//			pagingHTML.append(
//				String.format(pattern,"", lastPage+1 , "aria-label='Next'", "<span aria-hidden=\"true\">»</span>")
//			);
//		}
		pagingHTML.append(
		            String.format(pattern, "", lastPage, "aria-label='Next'", "<i class=\"tf-icon bx bx-chevrons-right bx-sm\"></i>")
		        );
		pagingHTML.append(
				"</ul>\n</nav>"
		);
		return pagingHTML.toString();
	}

}
