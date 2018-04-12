package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QNAService;

/**
 * Servlet implementation class QNADeleteServlet
 */
@WebServlet("/qnadelete")
public class QNADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNADeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("QNADeleteServlet 들어옴");
		System.out.println("selectqnanum:"+request.getParameter("selectqnanum"));	
		
		int result = new QNAService().deleteQuestion(request.getParameter("selectqnanum"));

		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {			
			response.sendRedirect("/semi/qnalist?page=1");
		} else {
			//뷰 파일 지정시 절대경로 사용 못하는 메소드임
			//상대 경로만 사용 가능함.
			/*RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("message", "회원 가입 실패");
			view.forward(request, response);*/
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			/* request.setAttribute("message", currentPage + "에 대한 목록 조회 실패!"); */
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
