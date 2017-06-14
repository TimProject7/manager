package com.parker.paging;

import com.parker.vo.FAQVO;

public class FAQPaging {
	public static void set(FAQVO fvo) {
		int page = Util.nvl(fvo.getPage(), 1);
		int pageSize = Util.nvl(fvo.getPageSize(), 10);

		if (fvo.getPage() == null) {
			fvo.setPage(page + "");
		}
		if (fvo.getPageSize() == null) {
			fvo.setPageSize(pageSize + "");
		}

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		fvo.setStart_row(start_row + "");
		fvo.setEnd_row(end_row + "");
	}
}
