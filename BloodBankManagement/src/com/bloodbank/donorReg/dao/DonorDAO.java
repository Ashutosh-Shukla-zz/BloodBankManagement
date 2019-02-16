package com.bloodbank.donorReg.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bloodbank.donorReg.vo.DonorRegVO;
import com.bloodbank.jdbc.ConnectionManager;

public class DonorDAO {
	static Connection connection = null;
	static ResultSet rs = null;

	public static String registerDonor(DonorRegVO donorReg) {

		// preparing some objects for connection
		Statement stmt = null;
		String returnValue = "inserted";

		String donorRegQuery = "insert into tbl_donor_registration values ((select (max(donor_id)+1) from tbl_donor_registration),' "
				+ donorReg.getDonorName() + "', '" + donorReg.getDonorGroup() + "', " + donorReg.getContact() + " , '"
				+ donorReg.getAddress() + "')";

		try {
			// connect to DB
			connection = ConnectionManager.getConnection();
			stmt = connection.createStatement();
			stmt.executeUpdate(donorRegQuery);

		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
			returnValue = "failed";
		}

		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
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

		return returnValue;

	}
	
	public ArrayList<DonorRegVO> getDonorsByGroup(String group){
		 ArrayList<DonorRegVO> donorList = new ArrayList<DonorRegVO>();
		   
		   Statement stmt = null;    		
		   String query = " select * from tbl_donor_registration where blood_group='"+group+"'";
		   
		   System.out.println("Query: "+query);
			  
			  try 
			   {
			      //connect to DB 
				  connection = ConnectionManager.getConnection();
			      stmt=connection.createStatement();
			      rs = stmt.executeQuery(query);	        
			      
			      while(rs.next()){
			    	  DonorRegVO donor = new DonorRegVO();
			    	  donor.setDonorName(rs.getString("donor_name"));
			    	  donor.setDonorGroup(rs.getString("blood_group"));
			    	  donor.setContact(rs.getString("contact"));
			    	  donor.setAddress(rs.getString("address"));
			    	  donorList.add(donor);
			      }
			   }
		      catch (Exception ex) 
		      {
		    	  ex.printStackTrace();
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
		      
		      
		  return donorList;
		   
	   
		
	}
}
