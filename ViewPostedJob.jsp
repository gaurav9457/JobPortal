<%@page import="com.jobPortal.beans.PostJob"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Naukri</title>
<link rel="stylesheet" href="css/NavStyle.css">
<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
<style>
#tableParentDiv{
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
.success {
  border-color: #f44336;
  cursor:pointer;
   background: #f44336;
   border:none;
}

.success:hover {
background: white;
  color: red;
}
</style>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<div id="tableParentDiv"  style="overflow-x:auto;">
<h2 style="text-align:center;">Job Posted By You</h2>
   <table border='1' cellpadding='4' width='80%' align="center">
        <tr>
         
        <th>Company Name</th>
        <th>Role</th>
        <th>Package</th>
        <th>Job Desc</th>
        <th>Required Skills</th>
        <th>Posted Date</th>
        <th>Inactive Job</th>
        <th>View Applied User</th>
        </tr>
        <%
            ArrayList jobs = (ArrayList) session.getAttribute("getPostedJobs");
        if (jobs == null || jobs.isEmpty()) {
        	%>
        	        <tr>
        	            <td colspan="8">No jobs posted yet</td>
        	        </tr>
        	<%
        	    } else {
            Iterator iterator = jobs.iterator();
            while(iterator.hasNext()){
                PostJob job = (PostJob) iterator.next();
        %>
        <tr>
         
            <td><%= job.getCompanyName() %></td>
            <td><%= job.getRole()%></td>        
            <td><%= job.getJobPackage()%></td>
             <td><%= job.getJobDesc()%></td>
              <td><%= job.getRequiredSkills()%></td>          
            <td><%= job.getCreatedDate() %></td>
            <% if (job.getIsActive().equals("Y")) { %>
           <td> <a href="#">
                <button onclick="inactiveJob(<%=job.getJobId()%>)" class="success" id="activeBtn<%=job.getJobId() %>">Inactive job</button>
            </a></td>
        <% } else { %>
      <td>  <a href="#">
            <button disabled class="" id="inactiveBtn<%=job.getJobId() %>">Inactivated</button>
            </a></td>
        <% } %>
            <td><a href="#">
                <button onclick="viewAppliedUsers(<%=job.getJobId() %>)" class="success" id="activeBtn<%=job.getJobId() %>">View Applied Users</button>
            </a></td>
        <% 
            }}
        %>
    </table>
    <div style="padding:15px;">
    <a href="index.jsp" style="color:red">&larr; Home</a>
    </div>
     
    <div>
    <jsp:include page="Footer.jsp"></jsp:include>
    </div>
</body>
<script src="./js/scriptMain.js"></script>
</html>