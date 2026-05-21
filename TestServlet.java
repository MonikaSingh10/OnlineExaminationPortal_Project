package com.idbi.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.QuestionBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

/**
 * Servlet implementation class TestServlet
 */

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TestServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", 0); // Proxies

		HttpSession session = request.getSession(false); // don't create new session
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
			return;
		}

		TestServices service = new TestServiceImp();
		PrintWriter out = response.getWriter();
		ErrorBean err = new ErrorBean();
		RequestDispatcher rd = null;	
		String stream = null;

		try {			
			String hlsuser = request.getParameter("hlsuser");
			System.out.println("user:::"+hlsuser+" ,hluser:::"+hlsuser);
			session.setAttribute("user" ,session.getAttribute("user"));
			stream = request.getParameter("stream");
			String name = ""+session.getAttribute("lname");
			if (stream == null || stream.trim().isEmpty()) {
				response.sendRedirect("selStream.jsp");
				return;
			}

			int count=0;
			System.out.println("stream::::::"+stream+" ,hiddenlsuser:::::::"+hlsuser);
			//int add=  service.insertintoTest(""+uid,uname,mail,"Survey");
			count = service.hasappliedtest(hlsuser);  //You have already attempted the Survey
			System.out.println("applied>>"+count);	        
			if (count !=0){
				System.out.println("You have already attempted the Test..." ); 
				request.setAttribute("msg", "You have already attempted the Test....." );            
				request.getRequestDispatcher("selStream.jsp").forward(request, response);
			}	        
			else
			{
				 
				List<QuestionBean> questionslist = service.getQuestions(stream);	        	
				Collections.shuffle(questionslist);

				if (questionslist.isEmpty()) {
					request.setAttribute("msg", "No questions found for stream: " + stream);
					request.getRequestDispatcher("selStream.jsp").forward(request, response);
					return;
				}
				session.setAttribute("questions", questionslist);
				session.setAttribute("stream", stream);
				request.setAttribute("Questionlist",questionslist );
				count = service.insertintoTest(hlsuser,name,"",stream);//You have already attempted the Survey.....Here Value Ensert
				rd = request.getRequestDispatcher("/StartTest.jsp");
				rd.forward(request, response);	        	
			}	        	
		}catch (Exception e) {
			e.printStackTrace();	            
			err.setErrorMsg("Exception in Test Servlet :" + e.getMessage());
			request.setAttribute("err", err);
			rd = request.getRequestDispatcher("Test.jsp");
		}
	}

}
