package mvc.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class JoinProcessAction2  implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("addMember_id");
		String pass = request.getParameter("addMember_pass");
		String name = request.getParameter("addMember_name");
		int age = Integer.parseInt(request.getParameter("addMember_age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setAge(age);
		m.setEmail(email);
		m.setId(id);
		m.setGender(gender);
		m.setName(name);
		m.setPassword(pass);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.insert(m);
		System.out.println(result + "를 반환");
		if(result==1) {
			forward.setPath("login.net");
			forward.setRedirect(true);
		} else if(result == -1) {
			response.setContentType("text/html); charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 중복되었습니다. 다시 입력하세요')");
			//out.println("location.href ='./join.net';");새로고침되어 이전에 입력한 데이터가 나타나지 않는다.
			out.println("history.back()");   // 비밀번호를 제외한 다른 데이터는 유지 되어 있다.
			out.println("<script>");
			out.close();
			return null;
		} 
		
		
		
		return forward;
		
	}
}
