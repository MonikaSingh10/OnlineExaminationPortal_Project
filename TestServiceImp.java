package com.idbi.ServiceImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;

import com.idbi.Beans.AnswerBean;
import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.ParticipantsResultBean;
import com.idbi.Beans.QuestionBean;
import com.idbi.Beans.UserBean;
import com.idbi.Connection.DB_Connection;
import com.idbi.Connection.DataSourceFactory;
import com.idbi.Connection.TestConnection;
import com.idbi.Services.TestServices;

public class TestServiceImp implements TestServices {

	ErrorBean err;
	String query;
	DB_Connection conn = new DB_Connection();
	TestConnection testconn = new TestConnection();
	UserServiceImp useImp = null;
	TestServiceImp testImp = null;
	RequestDispatcher rd;
	ResultSet rs;
	Statement st=null;
	PreparedStatement ps=null;
	Connection con = null;

	@Override
	public int hasappliedtest(String ein) {
		int status = 0;
		
		try {
			query = " Select count(*) as cnt from Quiz_applied where  ein='"+ ein + "' ";
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			System.out.println("has applied>>>" + query);

			while (rs.next()) {
				status = rs.getInt("cnt");
			}

		} catch (Exception e) {

			err.setErrorMsg("Exception Occured in hasappliedtest  : "+ e.getMessage());

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;
	}

	
	public int insertintoTest(String ein, String name, String mail, String type) {
		
		int status = 0;
		try {
			query = " insert into Quiz_applied (ein, name, mail, type, applied_date) values (?,?,?,?,CURRENT_DATE) ";
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			ps.setString(1, ein);
			ps.setString(2, name);
			ps.setString(3, mail);
			ps.setString(4, type);
			status = ps.executeUpdate();
		} catch (Exception e) {

			err.setErrorMsg("Exception Occured in insert Detail  : "+ e.getMessage());

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;

	}

	@Override
	public List<QuestionBean> getQuestions(String stream) {
		
		ArrayList<QuestionBean> qlist = new ArrayList<QuestionBean>();
		System.out.println(":::::::stream:::::"+stream);
		try {
		//	query = "select question_id, question, option1, option2, option3, option4 from Question_set WHERE FIN_YEAR = ? ";
			query = "SELECT question_id, stream, question, option1, option2, option3, option4, correct_option " +
                    "FROM Questions WHERE stream = ? ORDER BY RAND() LIMIT 10";			
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			ps.setString(1, stream);        // department_id = 10
            
			rs = ps.executeQuery();
			while (rs.next()) {
				QuestionBean qb = new QuestionBean();
				qb.setQuestion_id(rs.getInt("question_id"));
				qb.setStream(rs.getString("stream"));
				qb.setQuestion(rs.getString("question"));
				qb.setOptionA(rs.getString("option1"));
				qb.setOptionB(rs.getString("option2"));
				qb.setOptionC(rs.getString("option3"));
				qb.setOptionD(rs.getString("option4"));
				qb.setCorrectOption(rs.getString("correct_option"));				
				qlist.add(qb);
			}

		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in Question List: "
					+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return qlist;
	}

	@Override
	public int insertintoQuizData(int uid, String uname, AnswerBean bean) {
		
		int status=0;
		try
		{
			query ="insert into Quiz_Data (EIN,NAME,ENTRY_DATE,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9, Q10)  values (?,?,CURRENT_DATE,?,?,?,?,?,?,?,?,?,?)";	
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			System.out.println(uid+"has uname>>>" + uname);
			ps.setInt(1, uid);
			ps.setString(2, uname);
			ps.setString(3, bean.getA1());
			ps.setString(4, bean.getA2());
			ps.setString(5, bean.getA3());
			ps.setString(6, bean.getA4());
			ps.setString(7, bean.getA5());
			ps.setString(8, bean.getA6());
			ps.setString(9, bean.getA7());
			ps.setString(10, bean.getA8());
			ps.setString(11, bean.getA9());
			ps.setString(12, bean.getA10());
			status = ps.executeUpdate();
		}
		catch (Exception e) {
			err.setErrorMsg("Exception Occured in INSERTION IN QUIZ DATA: "+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;
	}

	public static void main(String[] args) {
		TestServiceImp testImp = new TestServiceImp();

		List<Integer> listuid = Arrays.asList(108780,
				123160,
				127010,
				108883,
				131548,
				128531,
				131273
				);


		for (Integer uid : listuid) {

			System.out.println(":::::::UID:::::"+uid);
			List<AnswerBean> submittedanswers = testImp.SubmittedAnswerlist(uid);		
			HashMap<Integer,String> ans = testImp.getAns();

			int empty=0;
			int right=0;
			int wrong =0;

			for(AnswerBean a :submittedanswers){


				if(	a.getA1().contains("-") ){
					empty++;
				}
				else if(a.getA1().equals(ans.get(1))){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA2().contains("-") ){
					empty++;
				}
				else if(a.getA2().equals(ans.get(2)) ){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA3().contains("-") ){
					empty++;
				}
				else if(a.getA3().equals(ans.get(3)) ){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA4().contains("-") ){
					empty++;
				}
				else if(a.getA4().equals(ans.get(4)) ){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA5().contains("-") ){
					empty++;
				}
				else if(a.getA5().equals(ans.get(5)) ){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA6().contains("-") ){
					empty++;
				}
				else if(a.getA6().equals(ans.get(6)) ){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA7().contains("-") ){
					empty++;
				}
				else if(a.getA7().equals(ans.get(7))){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA8().contains("-") ){
					empty++;
				}
				else if(a.getA8().equals(ans.get(8))){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA9().contains("-") ){
					empty++;
				}
				else if(a.getA9().equals(ans.get(9))){
					right++;
				}
				else{
					wrong++;
				}


				if(	a.getA10().contains("-") ){
					empty++;
				}
				else if(a.getA10().equals(ans.get(10))){
					right++;
				}
				else{
					wrong++;
				}			

			}

			System.out.println("empty>>"+empty+"right>>"+right+"wrong>>"+wrong);

			int status = testImp.UpdResult( empty, right, wrong , uid );
			System.out.println("status>>"+status);
		}

	}

	@Override
	public List<AnswerBean> SubmittedAnswerlist(int uid) {
		
		ArrayList<AnswerBean> qlist = new ArrayList<AnswerBean>();

		try {
			query = " select IFNULL(Q1,'-') Q1, IFNULL(Q2,'-') Q2, IFNULL(Q3,'-') Q3,IFNULL(Q4,'-') Q4, IFNULL(Q5,'-') Q5 ,IFNULL(Q6,'-') Q6, "
					+ " IFNULL(Q7,'-') Q7, IFNULL(Q8,'-') Q8,IFNULL(Q9,'-') Q9, IFNULL(Q10,'-') Q10 "
					+ " from QUIZ_DATA where ein="+uid+" ";

			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				AnswerBean ab = new AnswerBean();
				ab.setA1(rs.getString("Q1"));
				ab.setA2(rs.getString("Q2"));
				ab.setA3(rs.getString("Q3"));
				ab.setA4(rs.getString("Q4"));
				ab.setA5(rs.getString("Q5"));
				ab.setA6(rs.getString("Q6"));
				ab.setA7(rs.getString("Q7"));
				ab.setA8(rs.getString("Q8"));
				ab.setA9(rs.getString("Q9"));
				ab.setA10(rs.getString("Q10"));		
				System.out.println("QUESTION ID is: "+query);

				qlist.add(ab);

			}

		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in SUbmitted answer List: "
					+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return qlist;

	}

	@Override
	public List<AnswerBean> ActualAnswerlist() {
		
		ArrayList<AnswerBean> qlist = new ArrayList<AnswerBean>();

		try {
			query = " select answer from ANSWER_SET order by question_id asc ";

			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {

				AnswerBean ans = new AnswerBean();				
				ans.setAnswer(rs.getString("answer"));
				qlist.add(ans);

			}

		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in SUbmitted answer List: "+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return qlist;

	}

	@Override
	public int insertResult(int empty, int right, int wrong , int uid ) {
		
		int status = 0;
		try {
			query = " update quiz_Data "
					+ "set not_filled=? , correct=? ,wrong=? "
					+ " where ein=?";

			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);

			ps.setInt(1, empty);
			ps.setInt(2, right);
			ps.setInt(3, wrong);
			ps.setInt(4, uid);

			status = ps.executeUpdate();
		} catch (Exception e) {

			err.setErrorMsg("Exception Occured in insert Detail  : "
					+ e.getMessage());

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;

	}




	public int insertQuestion(String answer, String uname, QuestionBean bean) {
		
		int result=1;
		try
		{
			int qestionId=0;
			String query="SELECT MAX(question_id) AS ID FROM QUESTIONS";
				
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			rs = ps.executeQuery(query); 
			System.out.println("EmployeeDetails query::>"+query);	            
			while(rs.next()) {	              
				System.out.println(rs.getInt("ID"));
				qestionId=(rs.getInt("ID")+1);
			}
			con.setAutoCommit(false);
			System.out.println("MAX Id Of qestion_Id:::::"+qestionId);
			System.out.println("answer:::::::"+answer+" uname:::::"+uname); 
			//String Query =	"INSERT INTO QUESTION_SET(question_id, question, option1, option2, option3, option4, stream, correct_option) VALUES("+qestionId+",N'"+ bean.getQuestion() + "',N'" + bean.getOptionA() + "',N'" + bean.getOptionB() + "',N'" + bean.getOptionC() + "',N'" + bean.getOptionD() + "', N'" + bean.getStream() + "',N'" + bean.getCorrectOption() + "')"; 
			String Query =	"INSERT INTO QUESTIONS(question_id, question, option1, option2, option3, option4, stream, correct_option) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(" Query:::::"+Query); 
			ps =	con.prepareStatement(Query); 
			ps.setInt(1, qestionId); 
			ps.setString(2, bean.getQuestion()); 
			ps.setString(3, bean.getOptionA());
			ps.setString(4, bean.getOptionB()); 
			ps.setString(5, bean.getOptionC()); 
			ps.setString(6, bean.getOptionD());
			ps.setString(7, bean.getStream());
			ps.setString(8, bean.getCorrectOption());
			boolean statusResult=ps.execute();
			System.out.println("statusResult>>"+statusResult);

			String	Query1 = "INSERT INTO ANSWER_SET(QUESTION_ID, ANSWER_ID, ANSWER) VALUES(?,?,?)";			 
			ps =  con.prepareStatement(Query1);			
			ps.setInt(1, qestionId); 
			ps.setInt(2, qestionId); 
			ps.setString(3, answer);			
			result = ps.executeUpdate();
			con.commit();
			System.out.println("Result ANS status:::>>"+result);
		}
		catch (Exception e) {
			err.setErrorMsg("Exception Occured in INSERTION IN QUIZ DATA: "+ e.getMessage());
			result=0;
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return result;
	}



	public HashMap<Integer, String> getAns() {
		HashMap<Integer,String> ans = new HashMap<Integer, String>() ;
		
		try {
			String query = "SELECT ANSWER_ID, ANSWER FROM ANSWER_SET";
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			PreparedStatement ps = con.prepareStatement(query);		
			rs = ps.executeQuery(query); 
			System.out.println("EmployeeDetails query::>"+query);	            
			while(rs.next()) {	              
				System.out.println(rs.getInt("ANSWER_ID")+""+rs.getString("ANSWER"));
				ans.put(rs.getInt("ANSWER_ID"), rs.getString("ANSWER"));				
			}
		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in insert Detail  : "+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return ans;
	}



	public  int UpdResult(int empty, int right, int wrong , int uid ) {
		
		int status = 0;
		try {   
			query = " update quiz_Data set  NOT_FILLED=? , CORRECT=? ,WRONG=?  where ein=?";

			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			PreparedStatement ps = con.prepareStatement(query);			
			ps.setInt(1, empty);
			ps.setInt(2, right);
			ps.setInt(3, wrong);
			ps.setInt(4, uid);		
			status = ps.executeUpdate();
		} catch (Exception e) {

			err.setErrorMsg("Exception Occured in insert Detail  : "+ e.getMessage());

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;

	}


	@Override
	public int insertintoQuizData(int uid, String uname,  TreeMap<Integer, String> selectQuestOption, int wrongques, int notattempt, int correct,StringBuffer sb, String stream) {
		System.out.println("EmployeeDetails query::>"+selectQuestOption);
		
		int status=0;
			try  
			{
				query =" insert into Quiz_Data (EIN,NAME,ENTRY_DATE,NOT_FILLED,CORRECT,WRONG,answer, stream)  values (?, ?, CURRENT_DATE, ?, ?, ?, ?, ?)";	
								
				do {
					//con = conn.getConnection();
					 con = DataSourceFactory.getDataSource().getConnection();
				}
				while (con==null);
				PreparedStatement ps = con.prepareStatement(query);
				System.out.println("UID::"+uid+"has uname>>>" + uname);				
				System.out.println(correct+"has 2>>>" +sb.toString());
				ps.setInt(1, uid);
				ps.setString(2, uname);
				ps.setInt(3, notattempt);
				ps.setInt(4, correct);
				ps.setInt(5, wrongques);
				ps.setString(6, sb.toString());	
				ps.setString(7, stream);
				status = ps.executeUpdate();
				
				AnswerBean answerbean = new AnswerBean();
				int count=0;
				   for (Map.Entry<Integer, String> entry : selectQuestOption.entrySet()) {
					   ++count;
					   
					   if(count==1) {
						   answerbean.setA1(entry.getValue()); 
					   }else if(count==2) {
						   answerbean.setA2(entry.getValue());
					   }else if(count==3) {
						   answerbean.setA3(entry.getValue());
					   }else if(count==4) {
						   answerbean.setA4(entry.getValue());
					   }else if(count==5) {
						   answerbean.setA5(entry.getValue());
					   }else if(count==6) {
						   answerbean.setA6(entry.getValue());
					   }else if(count==7) {
						   answerbean.setA7(entry.getValue());
					   }else if(count==8) {
						   answerbean.setA8(entry.getValue());
					   }else if(count==9) {
						   answerbean.setA9(entry.getValue());
					   }else if(count==10) {
						   answerbean.setA10(entry.getValue());
					   }
			           System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			        }
				   String sql = "UPDATE Quiz_Data SET Q1 = ?, Q2 = ?, Q3 = ?, Q4 = ?, Q5 = ?, Q6 = ?, Q7 = ?, Q8 = ?, Q9 = ?, Q10 = ? WHERE EIN = ?";
				   ps = con.prepareStatement(sql);
				   ps.setString(1, answerbean.getA1());
		            ps.setString(2, answerbean.getA2());
		            ps.setString(3, answerbean.getA3());
		            ps.setString(4, answerbean.getA4());
		            ps.setString(5, answerbean.getA5());
		            ps.setString(6, answerbean.getA6());
		            ps.setString(7, answerbean.getA7());
		            ps.setString(8, answerbean.getA8());
		            ps.setString(9, answerbean.getA9());
		            ps.setString(10, answerbean.getA10());
		            ps.setInt(11, uid);
		            int rows = ps.executeUpdate();
		            System.out.println(rows + " row(s) updated.");					            
			}
			catch (Exception e) {
				err.setErrorMsg("Exception Occured in INSERTION IN QUIZ DATA: "+ e.getMessage());
			}
			finally{
				DataSourceFactory.closed(rs, ps, st, con);
			}
			return status;
	}

	
	@Override
	public List<UserBean> getParticepents() {
		System.out.println("EmployeeDetails query::>");
		
		ResultSet rs = null;
		PreparedStatement pstatement=null;		
		ArrayList<UserBean> qappliedlist = new ArrayList<UserBean>();
		try  
		{				
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			String query = "select q.ein, q.name, e.email_address as mail, DATE_FORMAT(q.applied_date, '%d-%b-%Y') as applied_date, q.type from QUIZ_APPLIED q,employee_details e where q.ein=e.ein";

			PreparedStatement ps = con.prepareStatement(query);						
			rs = ps.executeQuery();
			while (rs.next()) {
				UserBean userbean = new UserBean();
				userbean.setEin(rs.getInt("ein"));
				userbean.setName(rs.getString("name"));
				userbean.setEmail(rs.getString("mail"));
				userbean.setAppliedDate(rs.getString("applied_date"));
				userbean.setExamtype(rs.getString("type"));										
				qappliedlist.add(userbean);
			}

		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in Question List: "+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return qappliedlist;			
	}
	
	
	
	@Override
	public List<ParticipantsResultBean> getParticepentsResult() {
		System.out.println("EmployeeDetails query::>");
		
		ResultSet rs = null;
		PreparedStatement pstatement=null;		
		ArrayList<ParticipantsResultBean> qappliedlist = new ArrayList<ParticipantsResultBean>();
		try  
		{				
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			String query = "select a.EIN ,a.NAME ,a.TYPE ,a.APPLIED_DATE as start_time , b.ENTRY_DATE as end_time, b.NOT_FILLED as not_applied ,b.CORRECT,b.WRONG,\r\n"
					+ "   IFNULL(Q1,'-') Q1, IFNULL(Q2,'-') Q2, IFNULL(Q3,'-') Q3,IFNULL(Q4,'-') Q4, IFNULL(Q5,'-') Q5 ,IFNULL(Q6,'-') Q6, \r\n"
					+ "   IFNULL(Q7,'-') Q7, IFNULL(Q8,'-') Q8,IFNULL(Q9,'-') Q9, IFNULL(Q10,'-') Q10 \r\n"
					+ "  from  quiz_applied  a,  quiz_data b where a.EIN= b.EIN ";
System.out.println("query"+query);
			PreparedStatement ps = con.prepareStatement(query);						
			rs = ps.executeQuery();
			while (rs.next()) {
				ParticipantsResultBean userbean = new ParticipantsResultBean();
				userbean.setEin(rs.getString("EIN"));
				userbean.setName(rs.getString("NAME"));
				userbean.setExamtype(rs.getString("TYPE"));	
				//userbean.setEmail(rs.getString("mail"));
				userbean.setStarttime(rs.getString("start_time"));
				userbean.setEndtime(rs.getString("end_time"));
				userbean.setNotapplied(rs.getString("not_applied"));
				userbean.setCorrect(rs.getString("CORRECT"));
				userbean.setWrong(rs.getString("WRONG"));				
				userbean.setA1(rs.getString("Q1"));
				userbean.setA2(rs.getString("Q2"));
				userbean.setA3(rs.getString("Q3"));
				userbean.setA4(rs.getString("Q4"));
				userbean.setA5(rs.getString("Q5"));
				userbean.setA6(rs.getString("Q6"));
				userbean.setA7(rs.getString("Q7"));
				userbean.setA8(rs.getString("Q8"));
				userbean.setA9(rs.getString("Q9"));
				userbean.setA10(rs.getString("Q10"));
								
				qappliedlist.add(userbean);
			}

		} catch (Exception e) {
			err.setErrorMsg("Exception Occured in Question List: "+ e.getMessage());
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return qappliedlist;			
	}
	
	
}