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
 #companyPageContainer{
 width:1200px;
 margin:0 auto;
 }
 #PostedJobBtn{
 padding:10px 12px;
 border:none;
 background-color: #0056b3;
 color:white;
box-shadow: 10px 10px 5px #aaaaaa;
 cursor:pointer;
 }
 #PostedJobBtn:hover{
 background-color: white;
 color:#0056b3;
 }
</style>
</head>

<body>
 <div id="companyPageContainer">
   <jsp:include page="Navbar.jsp"></jsp:include>
   <h1 style="text-align:center;">Recruiter's Dashboard</h1>
   
    <% if(request.getAttribute("successMessage") != null) { %>
    <p  class="message" style="color: green;"><%= request.getAttribute("successMessage") %></p>
    
<% } %>
   <h3>Job Posted By You</h3>
   <div style="margin-bottom:20px">
   <%if(session.getAttribute("CompanyUserId")!=null){ %>
    <button  id="PostedJobBtn" onclick="getPostedCars(<%=session.getAttribute("CompanyUserId")%>)">Posted Jobs</button>
   <%} %>
   </div>
    <jsp:include page="Footer.jsp"></jsp:include>
 </div>
 
</body>
<script src="./js/scriptMain.js"></script>
</html>