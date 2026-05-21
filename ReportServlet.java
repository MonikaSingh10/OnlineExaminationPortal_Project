package com.idbi.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idbi.Beans.ErrorBean;


public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReportServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	
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
		PrintWriter out = response.getWriter();
		ErrorBean err = new ErrorBean();
		RequestDispatcher rd = null;
		
		try {
			
			String quiz = request.getParameter("quiz");
			System.out.println("quiz" + quiz);
		}
		catch (Exception e) {
			e.printStackTrace();
			err.setErrorMsg("Exception in Report Servlet :" + e.getMessage());
			request.setAttribute("err", err);
			rd = request.getRequestDispatcher("/Home.jsp");
		}


	}

}
