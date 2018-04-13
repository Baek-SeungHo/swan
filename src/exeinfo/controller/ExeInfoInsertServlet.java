package exeinfo.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exeinfo.model.service.ExeInfoService;
import exeinfo.model.vo.ExeInfo;
import oracle.sql.DATE;

/**
 * Servlet implementation class ExeInfoInsertServlet
 */
@WebServlet("/exeinsert")
public class ExeInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExeInfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ExeInfo exeinfo = new ExeInfo();
		exeinfo.setUserId(request.getParameter("userid"));
		//exeinfo.setUserGrade(request.getParameter("usergrade"));
		exeinfo.setUserHeight(Integer.parseInt(request.getParameter("userheight")));
		exeinfo.setUserWeight(Integer.parseInt(request.getParameter("userweight")));
		exeinfo.setUserBmi(Integer.parseInt(request.getParameter("userbmi")));
		exeinfo.setUserGoal(Integer.parseInt(request.getParameter("usergoal")));
		exeinfo.setUserStartdate(Date.valueOf(request.getParameter("userstartdate")));
		exeinfo.setUserEnddate(Date.valueOf(request.getParameter("userenddate")));
		
		System.out.println(exeinfo);
		
		int result = new ExeInfoService().insertExeInfo(exeinfo);
		
		response.setContentType("text/html; charset=utf-8");
		if(result > 0) {
			response.sendRedirect("index.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("html/yn/exeInfoError.jsp");
			request.setAttribute("message", "추가정보 입력 실패");
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
