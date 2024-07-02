<%@page import="com.jobPortal.beans.AppliedJob"%>
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
<link rel="stylesheet" href="css/loginRegister.css">
<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
<style>
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
.danger {
  border-color: #f44336;
  cursor:pointer;
   background: #f44336;
}

.danger:hover {
background: white;
  color: red;
}
#ViewAppliedParent{
width:1200px;
margin:0 auto;
}
.modal {
        display: none; 
        position: fixed; 
        z-index: 1000; 
        left: 0;
        top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4);
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */
    }

    /* Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .success{
    /* padding:10px 14px; */
    background-color:#f48c06;
    color:white;
   border-color:#f48c06;
   cursor:pointer;
    }
    .success:hover{
    color:#f48c06;
    background-color:white;
    border-color:#f48c06;
    }
</style>
</style>
</head>
<body>
  <div id="ViewAppliedParent">
  <jsp:include page="Navbar.jsp"></jsp:include>
  
  <div id="tableParentDiv"  style="overflow-x:auto;">
<h2 style="text-align:center;">Job Applied By You</h2>
   <table border='1' cellpadding='4' width='80%' align="center">
        <tr>
         
        <th>Company Name</th>
        <th>Role</th>
        <th>Package</th>
        <th>Job Desc</th>
        <th>Required Skills</th>
        
        <th>Status</th>
        </tr>
        <%
            ArrayList jobs = (ArrayList) session.getAttribute("viewAppliedJob");
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
                    
            <td><a href="#">
                <button onclick="checkStatus(<%=job.getJobId()%>, <%= request.getParameter("userId") %>)" class="success" id="activeBtn<%=job.getJobId() %>">Check Status</button>
            </a></td>
        <% 
            }
        %>
    </table>
    <div style="padding:15px;">
    <a href="index.jsp" style="color:red">&larr; Home</a>
    </div>
  
  
  </div>
  <div>
   <jsp:include page="Footer.jsp"></jsp:include>
   </div>
  <%--  <%AppliedJob appliedJob; %>
   <div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
         <%if(session.getAttribute("AppliedJobStatus")!= null){ 
          appliedJob=(AppliedJob) session.getAttribute("AppliedJobStatus");%>
          
          <h1><%= appliedJob.getStatus() %></h1>
        <%} %>
        
    </div> --%>
</div>

  <script src="./js/scriptMain.js"></script>
  <script>
 <%--  $(window).click(function(event) {
      if (event.target.id === "myModal") {
          $("#myModal").css("display", "none");
      }
  });
  $(".close").click(function() {
      $("#myModal").css("display", "none");
      window.location.href="ViewAppliedJob.jsp?userId="+<%= request.getParameter("userId") %>;
  }); --%>
  </script>
</body>
</html>