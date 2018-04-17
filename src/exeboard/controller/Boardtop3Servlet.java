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
 * Servlet implementation class Boardtop3Servlet
 */
@WebServlet("/top3")
public class Boardtop3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Boardtop3Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<ExeBoard> list = new ExeBoardService().top3();

		// 전송할 최종 json 객체
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (ExeBoard b : list) {

			JSONObject job = new JSONObject();
			job.put("body", b.getSportbody());
			job.put("name", b.getSportname());
			job.put("date", b.getSportdate().toString());
			job.put("look", b.getSportlook());

			jarr.add(job);
		}

		json.put("list", jarr);
		System.out.println("json : " + json.toJSONString());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(json.toJSONString());
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
