<%@page import="com.jobPortal.beans.AppliedJob"%>
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
#checkStatusParent{
width:1200px;
margin:0 auto;
}
 .status-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            width: 80%;
            max-width: 600px;
        }
        
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .status {
            font-size: 2em;
            color: #4CAF50;
            margin-top: 10px;
        }
        
        .status-failed {
            color: #FF5722;
        }
        
        .status-pending {
            color: #FF9800;
        }
        
        .status-text {
            font-size: 1.2em;
            margin-top: 20px;
            color: #666;
        }
</style>
</head>
<body>
<div id="checkStatusParent">
 <jsp:include page="Navbar.jsp"></jsp:include>
 
 <div>
 
 <%--  <h2>Your Job Status is</h2>
  
  <%if(session.getAttribute("AppliedJobStatus")!= null){ 
          appliedJob=(AppliedJob) session.getAttribute("AppliedJobStatus");%>
  <h1><%= appliedJob.getStatus() %></h1>
  <%} %> --%>
  
   <div class="status-container">
        <h2>Your Job Status is</h2>
        <%AppliedJob appliedJob; %>
        <% if(session.getAttribute("AppliedJobStatus") != null) { 
               appliedJob = (AppliedJob) session.getAttribute("AppliedJobStatus");
               String status = appliedJob.getStatus();
               
        %>
        
        <h1 class="status "><%= appliedJob.getStatus()%></h1>
        <% if ("Applied".equalsIgnoreCase(status)) { %>
        <p class="status-message">Application Sent to the company ,The company will let you know soon.</p>
       <% } %>
        <% } else { %>
        
        <h1 class="status status-pending">Status not available</h1>
        
        <% } %>
        
        <p class="status-text">Thank you for checking your job status with us.</p>
    </div>
  
  <div style="padding:15px;">
    <a href="ViewUser.jsp" style="color:red">&larr; Home</a>
    </div>
 </div>
 <jsp:include page="Footer.jsp"></jsp:include>
</div>
<script src="./js/scriptMain.js"></script>
</body>
</html>