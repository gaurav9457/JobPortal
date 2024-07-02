<%@page import="com.jobPortal.beans.Company"%>
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
#getUserParent{
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
a{
text-decoration: none;
color:black;
padding: 0px;
}
</style>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<div id="getUserParent">
    <h2 style="text-align=center">All Registered Company</h2>
    <table border='1' cellpadding='4' width='80%' align="center">
        <tr>
            <th>Company Name</th>
            <th>Company Email</th>
            <th>Inactive</th>
            <!-- <th>Mobile No</th>
            <th>Email</th>
            <th>Education</th>
            <th>State</th>
            <th>City</th> -->
           
           <!--  <th>In Active User</th> -->
        </tr>
        <% 
            ArrayList users = (ArrayList) session.getAttribute("AllRegisterCompany");
            Iterator iterator = users.iterator();
            while(iterator.hasNext()){
                Company user = (Company) iterator.next();
        %>
        <tr>
            <td><%= user.getCompanyName() %></td>
            <td><%= user.getCompanyEmail() %></td>
             <% if (user.getIsActive().equals("Y")) { %>
           <td> <a href="#">
                <button onclick="inactiveCompany(<%=user.getCompanyId() %>)" class="success" id="activeBtn<%=user.getCompanyId() %>">Inactive Company</button>
            </a></td>
        <% } else { %>
      <td>  <a href="#">
            <button disabled class="" id="inactiveBtn<%=user.getCompanyId() %>">Inactivated</button>
            </a></td>
        <% } %>
            <%-- <td><%= user.getMobileNo() %></td>
            <td><%= user.getEmailId() %></td>
            <td><%= user.getEducation() %></td>
            <td><%= user.getState() %></td>
            <td><%= user.getCity() %></td> --%>
          <%-- <% if (user.getIsActive().equals("Y")) { %>
           <td> <a href="#">
                <button onclick="inactiveUser(<%=user.getUserId() %>)" class="success" id="activeBtn<%=user.getUserId() %>">Inactive user</button>
            </a></td>
        <% } else { %>
      <td>  <a href="#">
            <button disabled class="" id="inactiveBtn<%=user.getUserId() %>">Inactivated</button>
            </a></td>
        <% } %> --%>
           <%--  <td><a href="#"><button  onclick="inactiveUser(<%=user.getId() %>)" class="success" id="activeBtn<%=user.getId() %>">Inactive user</button></a></td> --%>
        </tr>
        <% 
            }
        %>
    </table>
    <br>
    <div>
      <a href="index.jsp" style="color:red">&larr; Home</a>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>