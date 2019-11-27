package mvc.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.concert.db.ConcertBean;
import mvc.concert.db.ConcertDAO;

public class mainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
	 	ActionForward forward = new ActionForward();
	 	
	 	ConcertDAO cdao = new ConcertDAO();
	 	ConcertBean a = new ConcertBean();
	 	List<ConcertBean> baladList = new ArrayList<ConcertBean>();
	 	
	 	baladList = cdao.getList("balad");
	 	request.setAttribute("baladList", baladList);
		
	 	forward.setRedirect(false);
	 	forward.setPath("mainActivity/main.jsp");
	 	
	 	return forward;						
	}
}
