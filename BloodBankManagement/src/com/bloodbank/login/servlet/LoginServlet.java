package com.bloodbank.login.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bloodbank.login.dao.UserDAO;
import com.bloodbank.login.vo.UserVO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {


/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

try
{	    

	 UserVO user = new UserVO();
     user.setUsername(request.getParameter("username"));
     user.setPassword(request.getParameter("password"));

     user = UserDAO.login(user);
	   		    
     if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user); 
          response.sendRedirect("index.jsp"); //logged-in page      		
     }
	        
     else {
    	 HttpSession session = request.getSession(true);	    
     	session.setAttribute("invalidUser",true); 
          response.sendRedirect("login.jsp"); //error page
     }
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }

public void doGet(HttpServletRequest request, HttpServletResponse response) {}
	}