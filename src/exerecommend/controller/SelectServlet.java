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

import exerecommend.model.service.ExerecommendService;
import exerecommend.model.vo.Exerecommend;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sportbody = request.getParameter("sportbody");
		System.out.println("sportbody:" + sportbody);
		
		ArrayList<Exerecommend> sportList = new ExerecommendService().search(sportbody);
		
		System.out.println("sportList = " + sportList);
	      
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();		
		
		for(Exerecommend e : sportList) {
			JSONObject job = new JSONObject();
			
			job.put("sportName", URLEncoder.encode(e.getSportName(), "utf-8"));
			job.put("sportBody", URLEncoder.encode(e.getSportBody(), "utf-8"));
			
		    jarr.add(job);
			
		}
		
		json.put("sportList", jarr);
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
