package com.idbi.ServiceImp;

import com.idbi.Connection.DataSourceFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.RegestrationBean;
import com.idbi.Connection.DB_Connection;
import com.idbi.Services.RegistrationService;


public class RegistrationServiceImp implements RegistrationService  {
	ErrorBean err;
	String query;
	ResultSet rs;
	Statement st=null;
	PreparedStatement ps=null;
	Connection con = null;
	
	public int insertUsers(RegestrationBean registBean) {
		
		int status = 0;
		try {
			query = "INSERT INTO EMPLOYEE_DETAILS(LOGIN_TYPE, EIN, USER_STATUS, USER_NAME, DESIGNATION, EMAIL_ADDRESS, MOBILE_NO, CITY, PINCODE, STATE, USER_PASSWORD ) VALUES (?,?,?,?,?,?,?,?,?,?,?) ";

			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			ps.setString(1, "USER");
			ps.setInt(2, registBean.getEin());
			ps.setString(3, "A");  //A for Active User and I inactive User
			ps.setString(4, registBean.getEmpName());
			ps.setString(5, registBean.getDesination());
			ps.setString(6, registBean.getEmail());
			ps.setString(7, registBean.getMobileNo());
			ps.setString(8, registBean.getCity());
			ps.setInt(9, registBean.getPincode());
			ps.setString(10, registBean.getState());
			ps.setString(11, registBean.getPassword());			
			status = ps.executeUpdate();
		} catch (Exception e) {

			err.setErrorMsg("Exception Occured in User RegistrationServiceImp : "+ e.getMessage());

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;

	}

	@Override
	public int isUserExist(int ein) {
		int status = 0;
		try {
			query = "Select count(*) as cnt from EMPLOYEE_DETAILS where  ein='"+ ein + "' ";
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


}
