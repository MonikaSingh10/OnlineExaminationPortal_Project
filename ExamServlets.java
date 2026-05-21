package com.idbi.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.idbi.Beans.AnswerBean;
import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.QuestionBean;
import com.idbi.Beans.UserBean;
import com.idbi.ServiceImp.TestServiceImp;
import com.idbi.Services.TestServices;

/**
 * Servlet implementation class TestServlet  GMIPFeedBack
 */
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExamServlet() {
		super();

	}

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
		PrintWriter out = response.getWriter();
		ErrorBean err = new ErrorBean();
		RequestDispatcher rd = null;
		AnswerBean bean = new AnswerBean();
		TestServices service = new TestServiceImp();
		int quesCount = request.getParameter("finalCount")!=null ? Integer.parseInt(request.getParameter("finalCount")) : 0;
		System.out.println("Count" + quesCount);		
		
		        
    	UserBean empDetail = (UserBean) session.getAttribute("empDetails");
		int uid = empDetail.getEin();
		String uname = empDetail.getName();
		String mail = empDetail.getEmail();
		try {
			
			 List<QuestionBean> questions = (List<QuestionBean>) session.getAttribute("questions");
		        if (questions == null) {
		        	response.sendRedirect("selStream.jsp");
		            return;
		        }
		        String stream = "";
		        StringBuffer sb=new StringBuffer();
		        int total = questions.size();
		        int correct = 0;
		        int notattempt=0;
		        int wrong=0;
		        // store per-question correctness if you want to display details
		        boolean[] correctArr = new boolean[total];
		        System.out.println("total::::"+total);    
		        ArrayList<QuestionBean> qlist = new ArrayList<QuestionBean>();
		        TreeMap<Integer, String> selectQuestOption = new TreeMap<Integer, String>();
		        for (int i = 0; i < total; i++) {		        		            
		        	QuestionBean q = questions.get(i);
		        	
		        	System.out.println("loop from session quesId::::"+q.getQuestion_id()+"  selans::"+q.getCorrectOption()+"   stream:::"+q.getStream());
		        	 String quesId = "question_id"+q.getQuestion_id();   
		        	 String selans = "answer"+q.getQuestion_id();
		        	 stream = request.getParameter("stream");
		        	 System.out.println("loop from request quesId::::"+quesId+"  selans::"+selans+"   stream:::"+stream);
		        	 
		        	 String getquesId = request.getParameter(quesId);
		        	 String getselectedanswer = request.getParameter(selans);// will be "A"/"B"/"C"/"D" or null		        	 		        	
		        	 System.out.println("loop getquesId::::"+getquesId+"  getselectedanswer::"+getselectedanswer);	
		        	 Optional<String> optionalValue = Optional.ofNullable(getselectedanswer);
		        	 System.out.println("optionalValue::::"+optionalValue.isPresent()+" empty::::::"+!optionalValue.isPresent());
		           if(getselectedanswer == null || !optionalValue.isPresent() || getselectedanswer.equals(null)) {
		        	   notattempt++;
		           }
		           else if (getselectedanswer != null && getselectedanswer.equalsIgnoreCase(q.getCorrectOption())) {
		                correct++;
		                correctArr[i] = true;
		            } else {
		            	wrong++;
		                correctArr[i] = false;
		            }
		            QuestionBean qb = new QuestionBean();
					qb.setQuestion_id(getquesId!=null ? Integer.parseInt(getquesId) : 0);
					qb.setStream(stream);
					qb.setSelectedOption(getselectedanswer);
					qb.setCorrectOption(q.getCorrectOption());					
					sb.append(getquesId+"-"+getselectedanswer+"  ");
					selectQuestOption.put(Integer.parseInt(getquesId),getselectedanswer);
					//qb.setResult(resmap);
					qlist.add(qb);		            
		        }
		       
		        int wrongques = total - (correct+notattempt);
		        System.out.println("total:::"+total+"   ,correct::::"+correct+"  ,notattempt:::"+notattempt+"  ,, wrongques::"+wrongques);
		        double percent = (correct * 100.0) / total;
                System.out.println("total:::"+total+"   ,correct::::"+correct+"  ,wrong:::"+wrongques);
		        request.setAttribute("total", total);
		        request.setAttribute("correct", correct);
		        request.setAttribute("wrong", wrongques);
		        request.setAttribute("percent", percent);
		        request.setAttribute("questions", questions);
		        request.setAttribute("correctArr", correctArr);
		        // invalidate session questions if you want to prevent resubmission
		        session.removeAttribute("questions");
		        AnswerBean answerbean = null;
		     	
		        int stat = service.insertintoQuizData(uid, uname, selectQuestOption,wrongques,notattempt,correct,sb, stream);
		        System.out.println("uid>" + uid + "uname>>>" + uname+" stat:::"+stat);
			
				int status = service.insertResult(notattempt, correct, wrong,uid);
				System.out.println("inserted"+status);	
												
				RequestDispatcher rd1 = request.getRequestDispatcher("/Success.jsp");
				rd1.forward(request, response);			
		} catch (Exception e) {
			e.printStackTrace();
			err.setErrorMsg("Exception in Exam Servlet :" + e.getMessage());
			request.setAttribute("err", err);
			rd = request.getRequestDispatcher("/Home.jsp");
		}
	}

	public String getValue(String input) {
		String val = "";

		val = input != null ? input : "";

		return val;
	}
}
