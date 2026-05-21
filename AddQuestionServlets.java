package com.idbi.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.idbi.Beans.AnswerBean;
import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.UserBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddQuestion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		request.setCharacterEncoding("UTF-8");		
		  response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		ErrorBean err = new ErrorBean();
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();

		try
		{
			UserBean empDetail = (UserBean) session.getAttribute("empDetails");
			int uid = empDetail.getEin();
			String uname = empDetail.getName();
			
			TestServices service = new TestServiceImp();
			List<AnswerBean> submittedanswers = service.SubmittedAnswerlist(uid);
			int cnt=0;
			int right=0;
			int wrong =0;
			
			for(AnswerBean a :submittedanswers){
			
			if(	a.getA1().contains("-")){
				cnt++;
			}
			else if(a.getA1().contentEquals("A")){
				right++;
			}
			else{
				wrong++;
			}
				
			System.out.println("cnt>>"+cnt+"right>>"+right+"wrong>>"+wrong);
			}
			
			/*List<AnswerBean> actualanswers = service.ActualAnswerlist(uid);
			
			
		for(AnswerBean b : actualanswers){
    			System.out.println("id"+b.getQuestionid()+"answ"+b.getAnswer());
        	}*/
			
	    	rd = request.getRequestDispatcher("/NewFile.jsp");
        	rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
			err.setErrorMsg("Exception in ADD Question Servlet :" + e.getMessage());
			request.setAttribute("err", err);
			rd = request.getRequestDispatcher("/adminHome.jsp");
		}

	}

}
