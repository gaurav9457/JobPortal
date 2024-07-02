<%@page import="com.jobPortal.beans.Company"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/NavStyle.css">

<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
<style type="text/css">
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 50%;
  border: 1px solid #fff9f9;
 
}

th, td {
  text-align: center;
  padding: 12px;
  border: 1px solid #ddd;
   
}
th{
background-color:#b8daff;
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
padding:10px 8px;
border:none;
  border-color: #ff9800;
  color: white;
   background: #ff9800;
   cursor:pointer;
}

</style>
</head>
<body>
<div>
     <jsp:include page="Navbar.jsp"></jsp:include>
     <h1 style="text-align:center;">Company Contacted You</h1>
      <table border='1' cellpadding='4' width='80%' align="center">
        <tr>
            <th>Company Name</th>
            <th>Company Email</th>
           
        </tr>
        <% 
            ArrayList users = (ArrayList) session.getAttribute("viewCompanyContacted");
            Iterator iterator = users.iterator();
            while(iterator.hasNext()){
                Company user = (Company) iterator.next();
        %>
        <tr>
            <td><%= user.getCompanyName() %></td>
            <td><%= user.getCompanyEmail() %></td>
            
        </tr>
        <% 
            }
        %>
    </table>
     <div style="padding:15px;margin-left:200px;">
    <a href="ViewUser.jsp" style="color:red">&larr; Home</a>
    </div>
     
</div>
<h1></h1>
<div style="width:1200px;margin:0 auto;">
  <jsp:include page="Footer.jsp"></jsp:include>
 </div>
 <sctipt src="scriptMain.js"></sctipt>
</body>
</html>