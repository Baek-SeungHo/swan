package management.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import management.model.service.UserManagementService;
import management.model.vo.UserManagement;
import user.model.service.UserService;



/**
 * Servlet implementation class SikdanBoardInsertServlet
 */
@WebServlet("/UserDeleteManagementServlet")
public class UserDeleteManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   public UserDeleteManagementServlet() {
	// TODO Auto-generated constructor stub
}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("utf-8");
				
				String user_id=(request.getParameter("user_id"));

				
				response.setContentType("text/html; charset=utf-8");

				if (new UserManagementService().deleteUser(user_id) > 0) {
					//RequestDispatcher view = request.getRequestDispatcher("html/jh/sikdanboardWriteForm.jsp");
					response.sendRedirect("/semi/UserListManagementServlet?page=1");
					//view.forward(request, response);
				} else {

					PrintWriter out = response.getWriter();

					out.println("ㅇㅇ");
					out.close();
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
