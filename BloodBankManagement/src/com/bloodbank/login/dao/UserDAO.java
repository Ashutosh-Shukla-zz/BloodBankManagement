package com.bloodbank.login.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bloodbank.jdbc.ConnectionManager;
import com.bloodbank.login.vo.UserVO;

public class UserDAO
{
   static Connection connection = null;
   static ResultSet rs = null;  
	
	
	
   public static UserVO login(UserVO userVO) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
	
      String username = userVO.getUsername();    
      String password = userVO.getPassword();   
	    
      String searchQuery =
            "select * from user_master where username='"
                     + username
                     + "' AND password='"
                     + password
                     + "'";
	    
   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("Your user name is " + username);          
   System.out.println("Your password is " + password);
   System.out.println("Query: "+searchQuery);
	    
   try 
   {
      //connect to DB 
	   connection = ConnectionManager.getConnection();
      stmt=connection.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         userVO.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String firstName = rs.getString("name");
         String lastName = rs.getString("email");
	     	
         System.out.println("Welcome " + firstName);
         userVO.setFirstName(firstName);
         userVO.setLastName(lastName);
         userVO.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
      userVO.setValid(false);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (connection != null) {
         try {
        	 connection.close();
         } catch (Exception e) {
         }

         connection = null;
      }
   }

return userVO;
	
   }	
}
