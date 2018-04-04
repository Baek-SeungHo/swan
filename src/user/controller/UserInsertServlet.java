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
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/uinsert.me")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		User user = new User();
		user.setUserId(request.getParameter("userid"));
		user.setUserPwd(request.getParameter("userpwd"));
		user.setUserName(request.getParameter("username"));
		user.setUserGender(request.getParameter("usergender"));
		user.setUserAge(Integer.parseInt(request.getParameter("userage")));
		user.setUserEmail(request.getParameter("useremail"));
		user.setUserPhone(request.getParameter("userphone"));
		//user.setAdministrator(request.getParameter("administrator"));
		
		System.out.println(user);
		
		int result = new UserService().insertUser(user);
		
		response.setContentType("text/html; charset=utf-8");
		if(result > 0) {
			response.sendRedirect("index.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("html/yn/loginFail.html");
			request.setAttribute("message", "회원가입 실패");
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
