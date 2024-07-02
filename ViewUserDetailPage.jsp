<%@page import="java.util.Iterator"%>
<%@page import="com.jobPortal.beans.UserRegister"%>
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
<style>
.profile-page {
    width: 800px;
    margin: 20px auto;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.profile-page h1 {
    font-size: 2.5rem;
    color: #333333;
    margin-top: 0;
    margin-bottom: 10px;
}

.profile-page p {
    font-size: 1.2rem;
    color: #666666;
    margin: 5px 0;
}

.profile-header {
    overflow: hidden; 
    margin-bottom: 20px;
}

.profile-avatar {
    float: left;
    width: 150px;
    height: 150px;
    overflow: hidden;
    border-radius: 50%;
    background-color: #cccccc;
    text-align: center;
    line-height: 150px; 
    margin-right: 20px;
}

.profile-avatar img {
    max-width: 100%;
    height: 150px;
    border-radius: 50%;
}

.profile-info {
    overflow: hidden; 
}

.profile-details {
    clear: both; 
}

.detail-item {
    margin-bottom: 15px;
}
.detail-label {
    font-weight: bold;
    color: #333333;
    width: 150px; 
    display: inline-block;
    text-align: left;
    margin-right: 10px;
    
}

.detail-value {
    color: #666666;
    display: inline-block;
    width: 150px 
    margin-left: 10px; 
    
}
.update-profile-button{
padding:10px,12px;
border:none;
background-color:blue;
color:white;
cursor:pointer;
 box-shadow: 5px 7px 5px rgba(0, 0, 0, 0.5);

}
</style>
</head>
<body>
<%long id;

 if (request.getParameter("id") != null) {
  
  id = Long.parseLong(request.getParameter("id"));
} else {
  
  id = Long.parseLong("1");
}
  HttpSession session2 = request.getSession();
  ArrayList jobs = (ArrayList) session.getAttribute("AllRegisterUserPage");
  UserRegister selectedUser = null;
  
  Iterator iterator = jobs.iterator();
  while(iterator.hasNext()){
	  UserRegister user = (UserRegister) iterator.next();
      if(user.getUserId().longValue()==id){
    	  selectedUser = user; 
    	  break;
      }
  }
  
  %>
 <div>
 <jsp:include page="Navbar.jsp"></jsp:include>
    <div class="profile-page">
        <div class="profile-header">
            <div class="profile-avatar">
                <img src="https://cdn-icons-png.freepik.com/512/6915/6915987.png">
            </div>
            <div class="profile-info">
                <h1><%=selectedUser.getFirstName() %></h1>
                <p></p>
                <p>Phone: <%=selectedUser.getMobileNo() %></p>
            </div>
        </div>
        <div class="profile-details">
            <h2>Profile Details</h2>
            
            <div class="detail-item">
                <span class="detail-label">User Id :</span>
                <span class="detail-value"><%=selectedUser.getUserId() %></span>
            </div>
            
            <div class="detail-item">
                <span class="detail-label">Name :</span>
                <span class="detail-value"><%=selectedUser.getFirstName() %>&nbsp; <%=selectedUser.getLastName() %></span>
            </div>
            
            <div class="detail-item">
                <span class="detail-label">Mobile No : </span>
                <span class="detail-value"><%=selectedUser.getMobileNo() %></span>
            
            </div>
            
             <div class="detail-item">
                <span class="detail-label">Email id:</span>
                <span class="detail-value"><%= selectedUser.getEmailId() %></span>
            
            </div> 
            
            
            <div class="detail-item">
                <span class="detail-label">State :</span>
                <span class="detail-value"><%=selectedUser.getState() %></span>
            </div>
            
            <div class="detail-item">
                <span class="detail-label">City :</span>
                <span class="detail-value"><%=selectedUser.getCity() %></span>
            </div>
            
             <div class="detail-item">
                <span class="detail-label">Education :</span>
                <span class="detail-value"><%=selectedUser.getEducation() %></span>
            </div> 
            
            <div class="detail-item">
                <span class="detail-label">Skills :</span>
                <span class="detail-value"><%=selectedUser.getSkills() %></span>
            </div> 
            
        </div>
          <button class="update-profile-button" onclick="contactUserByCompany(<%=selectedUser.getUserId()%>)" id="activeBtn<%= selectedUser.getUserId() %>">Contact User</button>
    </div>
    
 </div>
 <div style="width:1200px;margin:0 auto;">
  <jsp:include page="Footer.jsp"></jsp:include>
 </div>
 <script src="./js/scriptMain.js"></script>
</body>
</html>