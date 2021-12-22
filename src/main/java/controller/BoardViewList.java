package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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


@WebServlet("/BoardViewList")
public class BoardViewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardViewList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO dao = new BoardDAO();

		List<BoardDTO> list= dao.viewList();
		request.setAttribute("list", list);
		String page = "/board/select/viewList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);

		
	}
	
	



}
