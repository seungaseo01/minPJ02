package controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentDAO;


@WebServlet("/CommentInsert")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentInsert>>>>>>>>>>>>");
		int bnum =Integer.parseInt(request.getParameter("bnum"));
		String cwriter = request.getParameter("cwriter");
		String ccontent = request.getParameter("ccontent");
		
		CommentDAO dao = new CommentDAO();

		dao.commentInsert(bnum, cwriter, ccontent);
		response.sendRedirect("/minPJ02/BoardSelectView?bnum="+bnum);
		System.out.println("CommentInsert>>>>>>>>>>>>end");

		

	}

}
