<%@page import="com.jobPortal.beans.UserRegister"%>
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
<style>
#viewAllUserContainer{
width:1200px;
margin:0 auto;
}
#UsedCarsContainer {
     /* border: 0.5px solid grey;  */
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

#imgDiv {
    height: 100px;
    width: 100px;
    border-radius: 1px;
    margin-left: 35px;
    margin-top: 10px;
}

.jobCard {
    display: inline-block;
    width: 255px;
    height: 330px;
    border: 1px solid grey;
    margin: 14px;
    box-shadow: 10px 10px 2px rgba(0, 0, 0, 0.1);
    color: black;
    vertical-align: top;
    font-size: 16px;
    border-radius: 10px;
}

.jobCard:hover {
    box-shadow: 2px 10px 10px rgba(98, 163, 238, 0.4);
}

.carCardContent {
    padding: 15px;
    margin-top: 10px;
}

.carCardprice {
    display: block;
    font-size: 15px;
    font-weight: bold;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 225px;
    height: 19px;
}

.carCardName {
    line-height: 40px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
   /*  background-color: rgb(218, 223, 223); */
    border-radius: 5px;
    color: #3b91f5;
}

.cardButton {
    padding: 10px 15px;
    background: linear-gradient(to right, #24c6dc, #514a9d);
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    font-size: 17px;
    margin-left: 56px;
    margin-top: 15px;
}

.cardButton:hover {
    background: linear-gradient(to right, #50c9c3, #96deda);
    border-color: white;
    color: white;
}

.jobTitle {
    margin-top: 10px;
}
</style>
<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
</head>
<body>
<div id="viewAllUserContainer">
 <jsp:include page="Navbar.jsp"></jsp:include>
 
 <div id="UsedCarsContainer">
               <div class="cardBodyParent" class="">
                <% 
            ArrayList users = (ArrayList) session.getAttribute("AllRegisterUserPage");
            Iterator iterator = users.iterator();
            while(iterator.hasNext()){
                UserRegister user = (UserRegister) iterator.next();
        %>
               <div class="jobCard">
        	                           <div id="imgDiv">
        	                               <img id="imgDiv"src="images/profile.png" alt="">
        	                           </div>
        	                           <div class="carCardContent">
        	                               <div class="carCardName" style="text-align: center;"><%=user.getFirstName() %> &nbsp; <%=user.getLastName() %></div><br>
        	                               <span class="carCardprice"><%=user.getMobileNo()%></span><br>
        	                               <span class="jobTitle"><%=user.getEmailId() %></span><br>
        	                               <span>Skills :- <%=user.getSkills() %></span>
        	                               <form action="ViewUserDetailPage.jsp?id=<%=user.getUserId()%>">
        	                                   <input type="hidden" value="<%=user.getUserId()%>" name="id"/>
        	                                   <input type="submit" value="View User" class="cardButton"/>
        	                               </form>
        	                           </div>
        	                       </div>
        	                       <%} %>
               
               </div>
              
               <div style="clear: both;"></div>
               </div>
               
 <jsp:include page="Footer.jsp"></jsp:include>
</div>
<script src="./js/scriptMain.js"></script>
</body>
</html>