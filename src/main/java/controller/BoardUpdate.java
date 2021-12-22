package controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardDAO;

@WebServlet("/BoardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardUpdate>>>>>>>>>>>>>>>");
		
		String bnum = request.getParameter("bnum");
		String btitle = request.getParameter("btitle");
		String bwriter = request.getParameter("bwriter");
		String bpassword = request.getParameter("bpassword");
		
		String bcontent = request.getParameter("bcontent");
		String bpw = request.getParameter("bpw");

		
		System.out.println(bnum+bpw+btitle+bwriter+bpassword+bcontent);
		
		BoardDAO dao = new BoardDAO();
		

		int result = dao.boardUpdate(btitle, bpassword, bpw, bcontent, bwriter, bnum);
		response.getWriter().print(result);

		
		



		

		

	}

}
