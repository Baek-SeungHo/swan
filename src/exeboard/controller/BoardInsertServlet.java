package exeboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exeboard.model.service.ExeBoardService;
import exeboard.model.vo.ExeBoard;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/einsert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		ExeBoard b = new ExeBoard();
		b.setSportbody(request.getParameter("select"));
		b.setSportname(request.getParameter("sportname"));
		b.setSportcode(request.getParameter("sportcode"));
		b.setSporturl(request.getParameter("sporturl"));

		int result = new ExeBoardService().insertBoard(b);
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
