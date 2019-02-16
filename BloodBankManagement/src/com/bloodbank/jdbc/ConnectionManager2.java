package com.bloodbank.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionManager2 {

static Connection conn, conn1;
static String url;
    
    
    public static void main(String args[]) throws SQLException{
    	conn1 = getConnection();
    	Statement sta = conn1.createStatement();
    	sta.executeUpdate("create table user_master(user_id int,name varchar(100),email varchar(100),contact int,username varchar(50),password varchar(100))");
    	      
    	      
    	      sta.executeUpdate("insert into user_master values(1,'ashu','abc@123.com',13281213,'ashu','ashu')");
    	      sta.executeUpdate("insert into user_master values(2,'bharat','xyz@123.com',90319123,'bharat','bharat')");
    	      //System.out.println("Table created." + count);
    	      sta.close();        

    	      conn1.close();  
    	
    }
    public static Connection getConnection()
    {
      
       String dbURL1 = "jdbc:derby:bloodBank;create=true"; 
	  
	  try
	  {            	
		  conn = DriverManager.getConnection(dbURL1); 
		  System.err.println("connection created");
	       
	  }
	  
	  catch (SQLException ex)
	  {
	     ex.printStackTrace();
	  }

    return conn;
}
 }