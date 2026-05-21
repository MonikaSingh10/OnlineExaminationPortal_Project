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
import com.idbi.Beans.QuestionBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

/**
 * Servlet implementation class AddQues
 */
public class AddQues extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public AddQues() {
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
		QuestionBean bean=new QuestionBean();

		String ques = request.getParameter("ques")!=null ? request.getParameter("ques").trim() : "";
		String optA = request.getParameter("optA")!=null ? request.getParameter("optA").trim() : "";
		String optB = request.getParameter("optB")!=null ? request.getParameter("optB").trim() : "";
		String optC = request.getParameter("optC")!=null ? request.getParameter("optC").trim() : "";
		String optD = request.getParameter("optD")!=null ? request.getParameter("optD").trim() : "";
		String ans = request.getParameter("ans")!=null ? request.getParameter("ans").trim().toUpperCase() : "";		
		String streamtype = request.getParameter("stream")!=null ? request.getParameter("stream").trim().toUpperCase() : "";	
		TestServices service = new TestServiceImp();
		int subQuesAns = 0;
		if( !ques.isEmpty() && !optA.isEmpty() && !optB.isEmpty() && !optC.isEmpty() && !optD.isEmpty() && !ans.isEmpty() ) {
			bean.setQuestion(ques);
			bean.setOptionA(optA);
			bean.setOptionB(optB);
			bean.setOptionC(optC);
			bean.setOptionD(optD);
			bean.setStream(streamtype);
			bean.setCorrectOption(ans);
			System.out.println("ques="+ques+",optA="+optA+",optB="+optB+"optC="+optC+"optD="+optD);
			subQuesAns = service.insertQuestion( ans,  optA,  bean);
			System.out.println("before>>"+subQuesAns);
			if(subQuesAns==1) {
				request.setAttribute("mesg", "Question Added successfully");
			}else {
				request.setAttribute("fail", "Question Not Added");
			}
			System.out.println("after>>"+subQuesAns);
		}else {
			request.setAttribute("fail", "Question and Answer can not be blank");
		}	

		

		rd = request.getRequestDispatcher("/addQues.jsp");
		rd.forward(request, response);
	}		

}


