package poll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poll.model.service.PollService;

/**
 * Servlet implementation class pollServlet
 */
@WebServlet("/poll")
public class pollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pollServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String yes = request.getParameter("yes");
		String no = request.getParameter("no");

		int yescount = 0;
		int nocount = 0;

		String Rating = null;

		if (yes.equals("1")) {

			yescount = 10;
		}
		if (yes.equals("2")) {

			yescount = 20;
		}
		if (yes.equals("3")) {

			yescount = 30;
		}
		if (yes.equals("4")) {

			yescount = 40;
		}
		if (yes.equals("5")) {

			yescount = 50;
		}
		if (yes.equals("6")) {

			yescount = 60;
		}
		if (yes.equals("7")) {

			yescount = 70;
		}
		if (yes.equals("8")) {

			yescount = 80;
		}
		if (yes.equals("9")) {

			yescount = 90;
		}

		if (no.equals("1")) {

			nocount = 5;
		}
		if (no.equals("2")) {

			nocount = 10;
		}
		if (no.equals("3")) {

			nocount = 15;
		}
		if (no.equals("4")) {

			nocount = 20;
		}
		if (no.equals("5")) {

			nocount = 25;
		}
		if (no.equals("6")) {

			nocount = 30;
		}
		if (no.equals("7")) {

			nocount = 40;
		}
		if (no.equals("8")) {

			nocount = 45;
		}
		if (no.equals("9")) {

			nocount = 50;
		}

		int result = yescount + nocount;

		if (0 <= result && result <= 25) {

			Rating = "D";

		}
		if (26 <= result && result <= 49) {

			Rating = "C";

		}
		if (50 <= result && result <= 74) {

			Rating = "B";

		}
		if (75 <= result && result <= 100) {

			Rating = "A";

		}
		System.out.println(result);
		System.out.println(Rating);
		int poll = new PollService().pollrating(Rating);

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
