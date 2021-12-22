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

import com.google.gson.Gson;

import model.BoardDTO;
import model.CommentDTO;
import service.BoardDAO;
import service.CommentDAO;


@WebServlet("/CommemtView")
public class CommemtView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CommemtView() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		
		String result = request.getParameter("bnum");
		CommentDAO dao = new CommentDAO();		

		List<CommentDTO> Select = dao.commentList(result);
		System.out.println(Select);
		String cm_list = new Gson().toJson(Select);
		response.getWriter().println(cm_list);


	}

}
