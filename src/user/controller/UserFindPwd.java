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
 * Servlet implementation class UserFindPwd
 */
@WebServlet("/findpwd")
public class UserFindPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userid");
		String userName = request.getParameter("username");
		String userEmail = request.getParameter("useremail");
		User user = new UserService().findPwd(userId, userName, userEmail);
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("username:" + userName + "useremail:" + userEmail);
		RequestDispatcher view = null;
		if(user != null) {
			view = request.getRequestDispatcher("html/yn/findPwd2.jsp");
			request.setAttribute("user", user);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("html/yn/userError.jsp");
			request.setAttribute("message", "해당하는 아이디 또는 이메일이 없습니다");
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
