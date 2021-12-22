package controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardDAO;

@WebServlet("/BoardPWCheck")
public class BoardPWCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bnum = request.getParameter("bnum");

		int pwCheck = Integer.parseInt(request.getParameter("bpassword"));

		
		BoardDAO dao = new BoardDAO();
		int pk = 0;
		

		pk =dao.pwCheck(bnum, pwCheck);
		System.out.println(pk);

		
		 response.getWriter().println(pk);
	}

}
