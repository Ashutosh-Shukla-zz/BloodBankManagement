package com.bloodbank.donorReg.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bloodbank.donorReg.dao.DonorDAO;
import com.bloodbank.donorReg.vo.DonorRegVO;

/**
 * Servlet implementation class LoginServlet
 */
public class DonorServlet extends HttpServlet {


/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {
	
	try
	{	    

		DonorRegVO donorReg = new DonorRegVO();
	     
	     
	     donorReg.setDonorName(request.getParameter("donorName"));
	     donorReg.setDonorGroup(request.getParameter("donorGroup"));
	     donorReg.setContact(request.getParameter("contact"));
	     donorReg.setAddress(request.getParameter("address"));

	     String submitFlag =  DonorDAO.registerDonor(donorReg);
		   		    
	        
	          HttpSession session = request.getSession(true);	    
	          session.setAttribute("submitFlag",submitFlag); 
	          response.sendRedirect("donorReg.jsp");	
	   
	} 
			
			
	catch (Throwable theException) 	    
	{
	     System.out.println(theException); 
	}


       }

public void doGet(HttpServletRequest request, HttpServletResponse response) {}
	}