package com.mf2.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mf2.vo.MemberDAO;
@WebServlet("/idCheckServlet")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public idCheckServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		MemberDAO dao = new MemberDAO();
		int result = dao.isId(request.getParameter("id"));
		response.getWriter().append(Integer.toString(result));
	}

}
