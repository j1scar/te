package mvc.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import mvc.book.db.BookBean;
import mvc.book.db.BookDAO;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		BookDAO bookdao = new BookDAO();
		List<BookBean> booklist = new ArrayList<BookBean>();
		
		int page = 1;
		int limit = 10; //한 page에 10개의 글
		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지  = " + page);
		
		int listcount = bookdao.getListCount();
		
		booklist = bookdao.getBookList(page,limit);
		
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지수 = " + maxpage);
		
		int startpage = ((page-1) / 10) * 10 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 =" + startpage);
		
		int endpage = startpage + 10 -1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 =" + endpage);
		
		if(endpage > maxpage) endpage = maxpage;
		
		request.setAttribute("page", page); //현재 페이지 수
		request.setAttribute("maxpage", maxpage); //최대 페이지 수
		
		//현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("startpage", startpage);
		
		//현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("endpage", endpage);
		
		request.setAttribute("listcount",listcount); //총 글의 수
		
		//해당 페이지의 글 목록을 갖고 있는 리스트
		request.setAttribute("booklist", booklist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		//글 목록 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("mypage/booklist.jsp");
		return forward; //BoardFrontController.java로 리턴됩니다.
	}

}
