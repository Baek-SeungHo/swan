package schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import exeboard.model.vo.ExeBoard;
import schedule.model.service.ScheduleService;
import schedule.model.vo.Schedule;

/**
 * Servlet implementation class Dateserach
 */
@WebServlet("/dateserach")
public class Dateserach extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Dateserach() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String grade = request.getParameter("grade");
		String selectdate = request.getParameter("date");

		ArrayList<Schedule> list = new ScheduleService().dateselet(grade, selectdate);

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Schedule s : list) {

		JSONObject job = new JSONObject();

		job.put("grade", s.getGrade());
		job.put("schedulename", s.getSchedulename());
		job.put("schedulenum", s.getSchedulenum());
		job.put("schedulenurl", s.getScheduleurl());

		jarr.add(job);
		}

		json.put("list", jarr);
		System.out.println("json :" + json.toJSONString());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();

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
