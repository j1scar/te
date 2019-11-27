package mvc.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class Member_infoAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
		 ActionForward forward = new ActionForward();
	      
	      MemberDAO mdao = new MemberDAO();
	      Member mdata = new Member();
	      
	      String id = request.getParameter("id");
	      
	      mdata = mdao.getDetail(id);
	      
	      if(mdata==null) {
	         System.out.println("상세 페이지 이동 실패");
	         forward.setRedirect(false);
	         request.setAttribute("message", "회원 상세보기 실패입니다.");
	         forward.setPath("error/error.jsp");
	         return forward;
	      }
	      System.out.println("상세보기 성공");
	      request.setAttribute("mdata", mdata);
	      forward.setRedirect(false);
	      forward.setPath("member/member_info.jsp");
	      return forward;
	   }
}
