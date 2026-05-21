package com.idbi.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idbi.ServiceImp.UserServiceImp;
import com.idbi.Services.UserServices;

public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.getWriter().println("Servlet called!");
		String ein = "" ,  semsg="";
		UserServices userService = new UserServiceImp();
		HttpSession session = req.getSession(false); // don't create new session
	    ein = req.getParameter("ein")!=null ? req.getParameter("ein") : "";
	    if(ein!=null && !ein.equals("")) {
	    	session.setAttribute("user",ein);
	    }
		System.out.println(ein+"  ,Session on java "+session.getAttribute("msg"));
	    semsg = session.getAttribute("msg")!=null ? session.getAttribute("msg").toString() : "";
		if ((session == null || session.getAttribute("user") == null) && !semsg.equals("") && (ein!=null && !ein.equals("")) ) {
			session.setAttribute("msg","");
			resp.sendRedirect("Login.jsp");
			return;
		}else {
			String ein1=session.getAttribute("user")!=null ? session.getAttribute("user").toString().trim() : "";
			userService.deleteUserEntry(ein1);
			session.invalidate(); // destroy session
			resp.sendRedirect("Login.jsp");
		}
	}
}