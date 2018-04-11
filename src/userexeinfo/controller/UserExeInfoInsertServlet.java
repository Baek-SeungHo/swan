package userexeinfo.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userexeinfo.model.service.UserExeInfoService;
import userexeinfo.model.vo.UserExeInfo;

/**
 * Servlet implementation class UserExeInfoInsertServlet
 */
@WebServlet("/ueinsert")
public class UserExeInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserExeInfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		UserExeInfo userexeinfo = new UserExeInfo();
		userexeinfo.setUserId(request.getParameter("userid"));
		userexeinfo.setSportCode(request.getParameter("sportname"));
		userexeinfo.setSportNum(request.getParameter("sportnum"));
		userexeinfo.setSportDate(Date.valueOf(request.getParameter("sportdate")));
		
		System.out.println(userexeinfo);
		
		int result = new UserExeInfoService().insertUserExeInfo(userexeinfo);
		
		response.setContentType("text/html; charset=utf-8");
		if(result > 0) {
			response.sendRedirect("index.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("html/yn/userExeInfoError.jsp");
			request.setAttribute("message", "운동기록실패");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
