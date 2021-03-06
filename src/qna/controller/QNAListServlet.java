package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QNAService;
import qna.model.vo.QNA;

/**
 * Servlet implementation class QNAListServlet
 */
@WebServlet("/qnalist")
public class QNAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QNAListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 페이지별로 출력되는 게시글 전체 조회 처리용 컨트롤러
		// 페이지 기본값 지정
		System.out.println("QNAListServlet 들어옴");
		int currentPage = 1;
		// 전달된 페이지값 추출
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 10;

		QNAService qservice = new QNAService();
		// 전체 목록 갯수 조회
		
		int listCount = qservice.getListCount();
		System.out.println("listCount = "+listCount);
		// System.out.println("총 게시글 수 : " + listCount);
		// 현재 페이지에 출력할 목록 조회
		ArrayList<QNA> list = qservice.selectList(currentPage, limit);
		ArrayList<QNA> listAll = qservice.selectListAll();
		
		// System.out.println("list : " + list);
		// 총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
		// 현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("/html/sh/contact2.jsp");
			request.setAttribute("listAll", listAll);
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("index.jsp");
			/* request.setAttribute("message", currentPage + "에 대한 목록 조회 실패!"); */
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
