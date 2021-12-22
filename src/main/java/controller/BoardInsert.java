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

import model.BoardDTO;
import service.BoardDAO;


@WebServlet("/BoardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("1111111111111");
		String btitle = request.getParameter("btitle");		
		String bpassword = request.getParameter("bpassword");
		
		String bcontent = request.getParameter("bcontent");
		
		String bwriter = request.getParameter("bwriter");
		System.out.println(bwriter);
		String bpw = null;
		
		if(request.getParameter("bpw") == null){
			bpw = "0";	
		}else{
			bpw = request.getParameter("bpw");
			}

		BoardDAO dao = new BoardDAO();
		

		dao.boardInsert(btitle, bpassword, bpw, bcontent, bwriter);
					
			

		
		response.sendRedirect("/minPJ02/BoardViewList");

		

	}

}
