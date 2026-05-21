package com.idbi.Servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.idbi.Beans.UserBean;
import com.idbi.ServiceImp.UserServiceImp;
import com.idbi.Services.UserServices;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		final String ein = request.getParameter("ein")!=null ? request.getParameter("ein").trim() : "";
		final String password = request.getParameter("upass")!=null ? request.getParameter("upass").trim() : "";			
		System.out.println(ein+",:::::Session User ");
		UserServices userService = new UserServiceImp();
		UserBean User = new UserBean();	
		
		if ((session.getAttribute("user") != null) && (session.getAttribute("user").equals(ein) && (userService.isUserAlreadyLogin(ein)))) {
			session.setAttribute("msg", "User alredy logedin...");
			session.setAttribute("ein", ein);
			request.setAttribute("msg", "User alredy logedin . . ");
			response.sendRedirect("Login.jsp"); 
			return;
		}
		
		/*
		if (userService.isUserAlreadyLogin(ein)) {
			session.setAttribute("ein", ein);
			session.setAttribute("msg", "May be User alredy logedin from diffrent browser . . ");
			response.sendRedirect("Login.jsp"); 
			return;
		}
       */
		try {
			if(!userService.isLoginTrue(Integer.parseInt(ein),password)) {					
				request.setAttribute("msg", "Kindly provide the valid credentials");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				//response.sendRedirect("Login.jsp");
				return;					
			} 

			System.out.println("login OK entryName" );//you can print entryName for exact value or just get true false.

			//User Details
			User = userService.getUserDetails(ein);   
			System.out.println("User :::::::::::::"+User );
			// is Admin
			int count = userService.isValidAdmin(ein);  //Is admin
			System.out.println("Count>>>"+count);     
			session.setAttribute("user", ein); //Session set Details
			request.setAttribute("luser", ein); //request set Details
			session.setAttribute("lname", User.getName()); //Session set Details
			userService.LoginEntery(ein);
			if(count !=0)   //if 1 admin else 0 
			{
				RequestDispatcher rd1 = request.getRequestDispatcher("/testvirtual.jsp");
				session.setAttribute("empDetails", User); //Session set Details
				rd1.forward(request, response); 
			}
			else
			{
				RequestDispatcher rd1 = request.getRequestDispatcher("/Home.jsp");
				session.setAttribute("empDetails", User); //Session set Details
				rd1.forward(request, response);
			}


		} catch (Exception e) {
			System.out.println("Invalid Username/Password or Account doesnt exist." + e);
			request.setAttribute("head", "Error In Login Page");
			request.setAttribute("msg", "Invalid login credentials**");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}

	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		//out.println("<h3><font style='color:tomato;font-size:  larger'><b><center>Unauthorized access..!! </center></b></font></h3>");
		request.setAttribute("msg", "unauthorised access..!!!");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		return;

	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}

