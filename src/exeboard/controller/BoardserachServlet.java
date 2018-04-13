package exeboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import exeboard.model.service.ExeBoardService;
import exeboard.model.vo.ExeBoard;

/**
 * Servlet implementation class BoardserachServlet
 */
@WebServlet("/esearch")
public class BoardserachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardserachServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String body = request.getParameter("body");

		ArrayList<ExeBoard> list = new ExeBoardService().search(body);

		// 운동부위로 검색하는 ajax
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (ExeBoard b : list) {

			JSONObject job = new JSONObject();

			job.put("sportcode", b.getSportcode());
			job.put("sportbody", b.getSportbody());
			job.put("sportname", b.getSportname());
			job.put("sportdate", b.getSportdate().toString());
			job.put("sportlook", b.getSportlook());

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
