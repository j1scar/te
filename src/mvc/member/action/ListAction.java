package mvc.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class ListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		List<Member> list = new ArrayList<Member>();
		
		int page = 1;
		int limit = 5;
		
		if(request.getParameter("page")!=null) {
			page =Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘오온 페이지" + page);
		
		int listcount = mdao.getListCount();
		
		list = mdao.getList(page, limit);
		
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지 수 = " +maxpage);
		
		int startpage = ((page-1) /10) * 10 +1;
		
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) endpage = maxpage;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("totallist", list);
		
		
		forward.setRedirect(false);
		forward.setPath("member/member_list.jsp");
		return forward;
	}
}
