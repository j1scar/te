package mvc.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import mvc.book.db.BookBean;
import mvc.book.db.BookDAO;

public class BookAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookDAO bdao = new BookDAO();
		BookBean bdata = new BookBean();
		ActionForward forward = new ActionForward();
		
		request.setCharacterEncoding("UTF-8");
		bdata.setBook_id(Integer.parseInt(request.getParameter("book_id")));
		bdata.setConcert_id(Integer.parseInt(request.getParameter("concert_id")));
		bdata.setMember_id(request.getParameter("id"));
		
		System.out.println("book_id : " + bdata.getBook_id() + "Concert_id" + bdata.getConcert_id() +"member_id"+ bdata.getMember_id());
		
		try {
			int ok = bdao.bookInsert(bdata);
			response.getWriter().print(ok);
		}catch(Exception e) {
			System.out.println("예매내역 등록 실패");
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "예매내역 등록 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
		return null;
	}

}
