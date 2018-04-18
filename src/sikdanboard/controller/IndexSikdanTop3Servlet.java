package sikdanboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import exeboard.model.service.ExeBoardService;
import exeboard.model.vo.ExeBoard;
import sikdanboard.model.service.SikdanBoardService;
import sikdanboard.model.vo.SikdanBorad;


/**
 * Servlet implementation class SikdanBoradListServlet
 */
@WebServlet("/IndexSikdanTop3Servlet")
public class IndexSikdanTop3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexSikdanTop3Servlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				// 전송할 최종 json 객체
				JSONObject json = new JSONObject();
				JSONArray jarr = new JSONArray();

				SikdanBoardService sbservice = new SikdanBoardService();

				ArrayList<SikdanBorad> list = sbservice.selectTop3List();
				for (SikdanBorad b : list) {

					JSONObject job = new JSONObject();
					job.put("board_num", b.getBoard_num());
					job.put("board_write", b.getBoard_write());
					job.put("board_title", b.getBoard_title());
					job.put("board_date", b.getBoard_date().toString());
					job.put("board_look", b.getBoard_look());
					
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
