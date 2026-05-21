package com.idbi.Connection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;


public class DB_Connection 
{
	public static Connection getConnection() {
		
			Connection con = null;
			 
			try
			{
				//Class.forName("oracle.jdbc.driver.OracleDriver");
				//con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "GMIP_FEED","GMIP_FEED");
				
				Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/test?rewriteBatchedStatements=true", "root", "root");
	            
				 System.out.println( "con "+con);
			}
			
			catch (Exception e) 
			{
				System.out.println("error"+e);
			}
			
			return con;

		}
	
	
	 public static void main(String args[]) {
	        try {
	            DB_Connection conn = new DB_Connection();
	            //conn.getConnection();//.createConnection();
	            System.out.println(" Connection is made  Succcessfuly " + conn);
	        

	        } catch (Exception ex) {
	            System.out.println("Exception in Main--> " + ex.getMessage());
	        }

	 }
	private static InputStream getResourceAsStream(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}