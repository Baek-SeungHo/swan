package userexeinfo.controller;

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

import userexeinfo.model.service.UserExeInfoService;
import userexeinfo.model.vo.UserExeInfo;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/uesearch")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String sportdate = request.getParameter("sportdate");
		
		System.out.println("userid:" + userid + "sportdate:" + sportdate);
		
		ArrayList<UserExeInfo> sportTable = new UserExeInfoService().searchTable(userid, sportdate);
		
		System.out.println("sportTabe = " + sportTable);
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(UserExeInfo e : sportTable) {
			JSONObject job = new JSONObject();
			
			job.put("sportName", URLEncoder.encode(e.getSportCode(), "utf-8"));
			job.put("sportNum", URLEncoder.encode(e.getSportNum(), "utf-8"));
			job.put("sportBody", URLEncoder.encode(e.getSportBody(), "utf-8"));
			
			jarr.add(job);
		}
		
		json.put("sportTable", jarr);
		System.out.println("json : " + json.toJSONString());
		
		response.setContentType("application/json charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
