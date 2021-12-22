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
import model.CommentDTO;
import service.BoardDAO;
import service.CommentDAO;


@WebServlet("/BoardSelectView")
public class BoardSelectView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardSelectView() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = request.getParameter("bnum");

		System.out.println("BoardSelectView");

		BoardDAO dao = new BoardDAO();
		
		dao.updateViews(result);
	

		List<BoardDTO> select = dao.selectView(result);
		System.out.println(select);
		request.setAttribute("list", select);
		
		if(request.getParameter("modify")!=null) {
			String page = "/board/update/updateBoard.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}else {
			String page = "/board/select/selectBoardView.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		System.out.println("BoardSelectView>>>>>>>>>END");
		

		
	}


}
