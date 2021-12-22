package controller;

import java.io.IOException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDTO;
import service.MemberDAO;


@WebServlet("/MemberSearch")
public class MemberSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectwt = request.getParameter("selectwt");
		String msearch = request.getParameter("msearch");
		System.out.printf(selectwt,msearch);
		MemberDAO dao = new MemberDAO();

		List<MemberDTO> list =  dao.searchView(selectwt, msearch);		
		request.setAttribute("list", list);
		String page = "/manage/memberList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);	

		System.out.println(selectwt+msearch);
		doGet(request, response);
	}

}
