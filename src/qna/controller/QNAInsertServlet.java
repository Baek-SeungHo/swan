package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QNAService;
import qna.model.vo.QNA;

/**
 * Servlet implementation class QNAInsertServlet
 */
@WebServlet("/qnainsert")
public class QNAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("QNAInsertServlet 들어옴");
		
		QNA qna = new QNA();
		qna.setQna_question(request.getParameter("qnaquestion"));
		qna.setQna_answer(request.getParameter("qnaanswer"));
		
		int result = new QNAService().insertQuestion(qna);
		
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
