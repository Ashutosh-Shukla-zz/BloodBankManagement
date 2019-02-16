<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bloodbank.donorReg.vo.DonorRegVO"%>
<%@page import="com.bloodbank.donorReg.dao.DonorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% response.setContentType("text/html");
   String group = request.getParameter("bloodgroup");
   ArrayList<DonorRegVO> donorList = new ArrayList<DonorRegVO>();
   DonorDAO donorDao = new DonorDAO();
  donorList =  donorDao.getDonorsByGroup(group);
   %>
<table class="table table-hover">
    <thead>
      <tr>
        <th>Donor Name</th>
        <th>Blood Group</th>
        <th>Contact No.</th>
        <th>Address</th>
        <th>Message</th>
      </tr>
    </thead>
    <tbody>
    <%
    Iterator iter = donorList.iterator();
    while(iter.hasNext()){
    DonorRegVO donor = new DonorRegVO();
    donor = (DonorRegVO) iter.next();
     %>
      <tr>
        <td><%=donor.getDonorName() %></td>
        <td><%=donor.getDonorGroup() %></td>
        <td><%=donor.getContact() %></td>
        <td><%=donor.getAddress() %></td>
        <td><a href=# data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-send" aria-hidden="true"></span></a></td>
      </tr>
      <%} %>
      
    </tbody>
  </table>