<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#viewAppliedAdminParent{
width:1200px;
margin:0 auto;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #fff9f9;
 
}

th, td {
  text-align: center;
  padding: 12px;
  border: 1px solid #ddd;
  
}
th{
background-image: linear-gradient(-60deg, #ff5858 0%, #f09819 100%);

}

tr:nth-child(even) {
  background-color: #d6dadd;
}
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 10px 16px;
  font-size: 10px;
  cursor: pointer;
}
tr:hover {
  background-color: #cfd8dc; 
}
.danger {
  border-color: #f44336;
  cursor:pointer;
   background: #f44336;
}

</style>
</head>
<body>
<div id="viewAppliedAdminParent">
  <jsp:include page="Navbar.jsp"></jsp:include>
  <h1></h1>
  
   <table border='1' cellpadding='4' width='80%' align="center">
        <tr>
            
            <th>User FirstName</th>
            <th>User LastName</th>
            <th>User Email</th>
            <th>Company Name</th>
            <th>Job Role</th>
             <th>Education</th>
              <th>Job Location</th>         
            <th>Status</th>
        </tr>
        
        <% 
      
        List appliedJobDetails = (List) session.getAttribute("AllAppliedJobAdmin");

            	if (appliedJobDetails != null) {
                    Iterator iterator = appliedJobDetails.iterator();
                    while (iterator.hasNext()) {
                        HashMap job = (HashMap) iterator.next();
            	
        %>
        <tr>
           
            <td><%= job.get("firstName") %></td>
            <td><%= job.get("lastName") %></td>
            <td><%= job.get("emailId") %></td>
             <td><%= job.get("companyName")%></td>
            <td><%= job.get("role") %></td>
            <td><%= job.get("education") %></td>
            <td><%= job.get("location") %></td>
            <td><%= job.get("status") %></td>
        </tr>
        <% 
            }
        } else {
        %>
        <tr>
            <td colspan="5">No applied jobs found.</td>
        </tr>
        <% } %>
        
    </table>
    <br>
    <div>
      <a href="index.jsp" style="color:red">&larr; Home</a>
    </div>
  <h1></h1>
  <jsp:include page="Footer.jsp"></jsp:include>
</div>
</body>
</html>