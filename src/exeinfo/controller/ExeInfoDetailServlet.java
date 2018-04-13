package exeinfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exeinfo.model.service.ExeInfoService;
import exeinfo.model.vo.ExeInfo;

/**
 * Servlet implementation class ExeInfoDetailServlet
 */
@WebServlet("/exedetail")
public class ExeInfoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExeInfoDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		ExeInfo exeinfo = new ExeInfoService().selectUserId(userId);
		System.out.println(exeinfo);
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if(exeinfo != null) {
			view = request.getRequestDispatcher("html/yn/mypage.jsp");
			request.setAttribute("exeinfo", exeinfo);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("html/yn/userError.jsp");
			/*request.setAttribute("message", "추가상세정보를 먼저 입력하세요");*/
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
