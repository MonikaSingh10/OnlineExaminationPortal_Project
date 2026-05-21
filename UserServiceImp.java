package com.idbi.ServiceImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Hashtable;

import javax.naming.CompositeName;
import javax.naming.Context;
import javax.naming.Name;
import javax.naming.NameParser;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.servlet.RequestDispatcher;

import com.idbi.Beans.ErrorBean;
import com.idbi.Beans.LoginBean;
import com.idbi.Beans.UserBean;
import com.idbi.Connection.DB_Connection;
import com.idbi.Connection.DataSourceFactory;
import com.idbi.Services.UserServices;


public class UserServiceImp implements UserServices {

	ErrorBean err;
	String query;
	DB_Connection conn = new DB_Connection();
	UserServiceImp	useImp = null;
	RequestDispatcher rd;
	ResultSet rs;
	Statement st=null;
	PreparedStatement ps=null;
	Connection con = null;

	public void ADLogin(String username, String connectionPassword) {
		try {

			if (username.equalsIgnoreCase("7000")||username.equalsIgnoreCase("9370") ) {
				username = "int" + username;
			}
			System.out.println("---------" + username);
			System.out.println("---------" + connectionPassword);
			final String contextFactory = "com.sun.jndi.ldap.LdapCtxFactory";
			// final String connectionURL = "ldap://IDBIBANK.ad:389";
			final String connectionURL = "ldap://10.144.18.75";
			final String connectionName = "CN=UID,CN=Users,DC=IDBIBANK,DC=ad";
			//System.out.println("usr--cc-vv--+++++");
			final String authentication = null;
			final String protocol = null;
			// System.out.println("usr--cc---+++++");

			final String MEMBER_OF = "memberOf";
			final String[] attrIdsToSearch = new String[]{MEMBER_OF};
			final String SEARCH_BY_SAM_ACCOUNT_NAME = "(sAMAccountName=%s)";
			final String SEARCH_GROUP_BY_GROUP_CN = "(&(objectCategory=group)(cn={0}))";
			String userBase = "DC=IDBIBANK,DC=ad";
			String email = "";
			int cnt;
			System.out.println("usr-----+++++" + username);

			Hashtable<String, String> env = new Hashtable<String, String>();
			env.put(Context.INITIAL_CONTEXT_FACTORY, contextFactory);
			env.put(Context.PROVIDER_URL, connectionURL);
			env.put(Context.SECURITY_PRINCIPAL, username + "@IDBIBANK.ad");
			env.put(Context.SECURITY_CREDENTIALS, connectionPassword);

			if (authentication != null) {
				env.put(Context.SECURITY_AUTHENTICATION, authentication);
			}
			if (protocol != null) {
				env.put(Context.SECURITY_PROTOCOL, protocol);
			}

			try {

				InitialDirContext context = new InitialDirContext(env);
				String filter = String.format(SEARCH_BY_SAM_ACCOUNT_NAME, username);
				SearchControls constraints = new SearchControls();
				constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
				constraints.setReturningAttributes(attrIdsToSearch);
				NamingEnumeration results = context.search(userBase, filter, constraints);
				// Fail if no entries found
				//System.out.println("No result found" + results.hasMore());
				if (results == null || !results.hasMore()) {
					err.setErrorMsg("Invalid User Details Provided");
				}

				SearchResult result = (SearchResult) results.next();
				NameParser parser = context.getNameParser("");
				Name contextName = parser.parse(context.getNameInNamespace());
				Name baseName = parser.parse(userBase);
				System.out.println("------------");
				Name entryName = parser.parse(new CompositeName(result.getName()).get(0));
				//System.out.println("Name====" + entryName);
				Attributes attrs = result.getAttributes();
				Attribute attr = attrs.get(attrIdsToSearch[0]);

				NamingEnumeration e = attr.getAll();

				if (!e.hasMore()) {
					//System.out.println("---ffff---------");

					err.setErrorMsg("Employee details not available");
				} else {
					System.out.println("login OK " + entryName);////you can print entryName for exact value or just get true false.

				}
			}
			catch (NamingException e) {
				e.printStackTrace();

				err.setErrorMsg("Invalid Username/Password or Account doesnt exist");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			//System.out.println("Error in Authenticate " + ex.getMessage());

			err.setErrorMsg("Invalid Username/Password or Account doesnt exist");
		} finally {
			setErr(err);
		}

	}

	public ErrorBean getErr() {
		return err;
	}

	private void setErr(ErrorBean err2) {
		if (this.err.getErrorMsg() != null) {
			this.err = err;
		}

	}

	@Override
	public int isValidAdmin(String ein) {		
		int status=0;
		try 
		{
			//query=" Select count(*) as cnt from QUIZ_ADMIN_LOGIN where  login_type like 'Admin%' and user_status='A' and user_id='"+ein+"' ";	
			query=" Select count(*) as cnt from QUIZ_ADMIN_LOGIN where  login_type like 'Admin%' and user_status='A' and user_id='"+ein+"' ";

			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			System.out.println("IS adminQuery>>>"+query);

			while(rs.next())
			{
				status = rs.getInt("cnt");	
			}

		}
		catch (Exception e) {

			err.setErrorMsg("Exception Occured in isValidAdmin : " + e.getMessage());

		} 
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return status;
	}


	@Override
	public boolean isLoginTrue(int ein, String password) {        
		boolean data=false;
		
		try {
			query = "SELECT COUNT(*) AS COUNT FROM EMPLOYEE_DETAILS WHERE EIN=? AND  USER_PASSWORD = ?"; 
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			PreparedStatement ps = con.prepareStatement(query);            
			ps.setString(1, String.valueOf(ein)); 
			ps.setString(2, password);
			rs = ps.executeQuery();
			System.out.println("getEINquery===" + query);
			if (rs.next()) {            	            	
				if( rs.getString("COUNT").equalsIgnoreCase("1")) {
					data=true;
				}				
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return data;
	}


	

	@Override
	public boolean isUserAlreadyLogin(String ein) {        
		boolean data=false;		
		try {
			query = "SELECT COUNT(*) AS COUNT FROM LOGIN_USER WHERE EIN=? "; 
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);            
			ps.setString(1, String.valueOf(ein)); 
			rs = ps.executeQuery();
			System.out.println("getEINquery===" + query);
			if (rs.next()) {            	            	
				if( Integer.parseInt(rs.getString("COUNT")) >=1) {
					data=true;
				}				
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return data;
	}
	
	
	
	@Override
	public boolean deleteUserEntry(String ein) {        
		boolean data=false;
		try {
			query = "DELETE FROM LOGIN_USER WHERE EIN=? "; 
			
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);            
			ps.setInt(1, Integer.parseInt(ein)); 			
			int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
            	data=true;
                System.out.println("User Already Logedin Now User Has deleted successfully!");
            }
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return data;
	}
	
	@Override
	public String getEINOracle(int ein) {
		String data="0";
		try {
			query = "SELECT LOGIN_TYPE, EIN, USER_STATUS, USER_NAME, USER_PASSWORD, DESIGNATION,MOBILE_NO FROM EMPLOYEE_DETAILS WHERE EIN=? ";                   
			LoginBean loginBean=null;
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);            
			ps.setString(1, String.valueOf(ein));            
			rs = ps.executeQuery();
			    
			System.out.println("getEINquery===" + query);
			 while(rs.next()) {
				loginBean = new LoginBean();            	
				loginBean.setLogintype((rs.getString("LOGIN_TYPE")!=null ? rs.getString("LOGIN_TYPE") : ""));    ;
				loginBean.setEin(rs.getString("EIN"));
				loginBean.setUserstatus(rs.getString("USER_STATUS"));
				loginBean.setUsername(rs.getString("USER_NAME"));
				loginBean.setUserpassword(rs.getString("USER_PASSWORD"));
				loginBean.setDesignation(rs.getString("DESIGNATION"));
				//System.out.println("mobile no..." + MOBILE_NO);
				loginBean.setMOBILE_NO(rs.getString("MOBILE_NO"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return data;
	}


	@Override
	public UserBean getUserDetails(String oracleEin) {

		UserBean emplDetailsBeans = new UserBean();
		
		//	System.out.println("Einn in details"+oracleEin);

		try
		{
			query = "SELECT EIN, USER_NAME, EMAIL_ADDRESS, DESIGNATION, MOBILE_NO,CITY,PINCODE,STATE FROM EMPLOYEE_DETAILS WHERE EIN = '"+oracleEin+"' ";

			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			ps = con.prepareStatement(query);

			rs = ps.executeQuery(query);
			//      System.out.println("EmployeeDetails query::>"+query);

			while(rs.next()) {
				emplDetailsBeans.setEin(rs.getInt("EIN"));
				emplDetailsBeans.setName(rs.getString("USER_NAME"));
				emplDetailsBeans.setEmail(rs.getString("EMAIL_ADDRESS"));
				System.out.println("MOBILE_NO:::::::::::"+rs.getString("MOBILE_NO"));
				emplDetailsBeans.setDesignation(rs.getString("DESIGNATION"));
				emplDetailsBeans.setMobile_no(rs.getString("MOBILE_NO"));
				emplDetailsBeans.setCity(rs.getString("CITY"));
				emplDetailsBeans.setDepartment(rs.getString("PINCODE"));
				emplDetailsBeans.setState(rs.getString("STATE"));
				emplDetailsBeans.setRegion(rs.getString("STATE"));
				//    System.out.println("1.) "+emplDetailsBeans.getEin()+" : "+emplDetailsBeans.getVertical()+", "+emplDetailsBeans.getSolid());
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
		return emplDetailsBeans;
	}

	
	
	public void LoginEntery(String ein) {		
		int result=1;
		try
		{				
			do {
				//con = conn.getConnection();
				 con = DataSourceFactory.getDataSource().getConnection();
			}
			while (con==null);
			String	query = "INSERT INTO Login_User (EIN, Name,Login_Time) SELECT  EIN,USER_NAME,CURRENT_DATE FROM EMPLOYEE_DETAILS WHERE EIN=?";			 
			ps =  con.prepareStatement(query);			
			ps.setInt(1, Integer.parseInt(ein));						
			result = ps.executeUpdate();
			System.out.println("Result ANS status:::>>"+result);
		}
		catch (Exception e) {
			err.setErrorMsg("Exception Occured in INSERTION IN QUIZ DATA: "+ e.getMessage());
			result=0;
		}	
		finally{
			DataSourceFactory.closed(rs, ps, st, con);
		}
	}

}
