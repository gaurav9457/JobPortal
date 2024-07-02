<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.jobPortal.beans.UserRegister"%>
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
#getUserParent {
	width: 1200px;
	margin: 0 auto;
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

th {
	background-color: #b8daff;
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

.success {
	padding: 10px 8px;
	border: none;
	border-color: #ff9800;
	color: white;
	background: #ff9800;
	cursor: pointer;
}

.success:hover {
	background: white;
	color: #ff9800;
}

.danger {
	border-color: #f44336;
	background: #f44336;
}

.danger:hover {
	background: white;
	color: red;
}

a {
	text-decoration: none;
	color: black;
	padding: 0px;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

	<div id="getUserParent">
		<h2 style="text-align: center">All Applied User</h2>

		<table border='1' cellpadding='4' width='80%' align="center">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Mobile No</th>
        <th>Email</th>
        <th>Education</th>
        <th>Skills</th>
        <th>State</th>
        <th>City</th>
        <th>Contact</th>
    </tr>
    <%
        ArrayList users = (ArrayList) session.getAttribute("viewAppliedUsers");
        
        if (users != null) {
            Iterator iterator = users.iterator();
            while (iterator.hasNext()) {
                UserRegister user = (UserRegister) iterator.next();
                
           
                List appliedJobDetails = (List) session.getAttribute("AllAppliedJobAdmin");
                
                boolean contacted = false; 
                
                if (appliedJobDetails != null) {
                    Iterator iterator2 = appliedJobDetails.iterator();
                    while (iterator2.hasNext()) {
                        HashMap job = (HashMap)iterator2.next();
                        String userId = job.get("userId").toString();
                        String jobId = job.get("jobId").toString();
                        String status = job.get("status").toString();
                        
                        if (userId.equals(user.getUserId().toString()) && jobId.equals(request.getParameter("jobId")) && status.equals("Contacted")) {
                            contacted = true; 
                            break; 
                        }
                    }
                }
    %>
    <tr>
        <td><%= user.getFirstName() %></td>
        <td><%= user.getLastName() %></td>
        <td><%= user.getMobileNo() %></td>
        <td><%= user.getEmailId() %></td>
        <td><%= user.getEducation() %></td>
        <td><%= user.getSkills() %></td>
        <td><%= user.getState() %></td>
        <td><%= user.getCity() %></td>
        
        <% if (contacted) { %>
        <td><a href="#"><button disabled onclick="contactUser('<%= user.getUserId() %>','<%= request.getParameter("jobId") %>')" class="" id="activeBtn<%= user.getUserId() %>">Contacted</button></a></td>
        <% } else { %>
        <td><a href="#"><button onclick="contactUser('<%= user.getUserId() %>','<%= request.getParameter("jobId") %>')" class="success" id="activeBtn<%= user.getUserId() %>">Contact</button></a></td>
        <% } %>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="9">No users found.</td>
    </tr>
    <% } %>
</table>

		<br>
		<div>
			<a href="ViewPostedJob.jsp" style="color: red">&larr; BACK</a>
		</div>
		<jsp:include page="Footer.jsp"></jsp:include>
</body>
<script src="./js/scriptMain.js"></script>
</html>