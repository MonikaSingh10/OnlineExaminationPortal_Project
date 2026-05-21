package com.idbi.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idbi.Beans.UserBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

public class ExamParticipantsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("FROM EXAM PARTICIPATION REPORT servlet!");
        TestServices service = new TestServiceImp();
        List<UserBean> appliedlist = service.getParticepents();
        System.out.println("uid>" + appliedlist );
        RequestDispatcher rd = null;
        request.setAttribute("appliedlist",appliedlist );	
		rd = request.getRequestDispatcher("/applied_quiz_report.jsp");
		rd.forward(request, response);	
		System.out.println("inserted");
    }
}