package com.idbi.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idbi.Beans.ParticipantsResultBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

public class ParticipantsResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("From PARTICIPATS SCORE REPORT Servlet!");
        TestServices service = new TestServiceImp();
        List<ParticipantsResultBean> ParticepentsResult = service.getParticepentsResult();
        System.out.println("uid>" + ParticepentsResult );
        RequestDispatcher rd = null;
        request.setAttribute("ParticepentsResult",ParticepentsResult );	
		rd = request.getRequestDispatcher("/ParticipantsResult_report.jsp");
		rd.forward(request, response);	
		System.out.println("inserted");
    }
}