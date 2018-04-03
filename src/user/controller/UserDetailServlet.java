package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserDetailServlet
 */
@WebServlet("/udetail")
public class UserDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;           
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String userId = request.getParameter("userid");
		User user = new UserService().selectUser(userId);
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if(user != null) {
			view = request.getRequestDispatcher("html/yn/userInfoChange.jsp");
			request.setAttribute("user", user);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("html/yn/userError.jsp");
			request.setAttribute("message", "내 정보보기 요청처리 실패");
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
