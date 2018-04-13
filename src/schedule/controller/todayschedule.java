package schedule.controller;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import schedule.model.service.ScheduleService;
import schedule.model.vo.Schedule;

/**
 * Servlet implementation class todayschedule
 */
@WebServlet("/todayschedule")
public class todayschedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public todayschedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usergrade = request.getParameter("grade");

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		ArrayList<Schedule> list = new ScheduleService().todayschedule(usergrade, sqlDate);

		response.setContentType("text/html; charset=utf-8");

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("html/ij/exerciseschedule.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		} else {
			System.out.println("안옴");
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
