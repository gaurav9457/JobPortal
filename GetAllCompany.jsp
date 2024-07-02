<%@page import="com.jobPortal.ActionBean.CommonActionBean"%>
<%@page import="com.jobPortal.AjaxHandler.AjaxHandler"%>
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
<link rel="stylesheet" href="css/loginRegister.css">
<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
<style>
#viewJobPosted{
padding:10px 34px;
background: linear-gradient(to right, #36d1dc, #5b86e5);
color:white;
border:none;
cursor:pointer;
margin-left:40px;
}
#viewJobPosted:hover{
background: linear-gradient(to right, #06beb6, #48b1bf); 
color:white;

}
</style>
</head>
<body>
  <div style="width:1200px;margin:0 auto;">
        <div>
     <jsp:include page="Navbar.jsp"></jsp:include>
     </div>
     <% CommonActionBean.getAllCompanyView(request, response); %>  
      <div id="UsedCars">
           <h1 style="color:#529bee;">All Companies</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("AllRegisterCompanyView")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("AllRegisterCompanyView");
          Iterator iteratorS = Scars.iterator();
          while(iteratorS.hasNext()){
             Company jobS = (Company) iteratorS.next();
              int randomImageIndex = (int) (Math.random() * 4) + 1;
              String imageName = "company" + randomImageIndex + ".jpg";
              String imagePath = "images/" + imageName;
      %>  
                  <div id="cardBody" class="" style="height:280px;">
    <div id="imgDiv">
      <img id="imgDiv" src="./staticContent/<%=jobS.getCompanyLogo()%>" alt="">
    </div>
    <div id="carCardContent">
       <div id="carCardName" style="text-align: center;"><%=jobS.getCompanyName() %></div> <br>
     <span id="carCardprice"><%=jobS.getCompanyEmail() %></span> <br> 
    <%--  <span id="jobTitle"><%=jobS.getRole() %></span> <br> 
     <span>Rs <%=jobS.getJobPackage() %> Lakh</span> --%>
      <%-- <form action="ViewJobDetails.jsp?id=<%=jobS.getCompanyId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form>   --%>
        <button id="viewJobPosted" onclick="getPostedJobByCompany(<%=jobS.getCompanyId()%>)">View Jobs</button>
      </div>
    </div>

    <%
      }
          }
            else {
              %>
              <p>No Company found .</p>
          <% } %>  
     
     
  </div>
  </div>
  <h1></h1>
  
   <jsp:include page="LoginPage.jsp"></jsp:include>
  <jsp:include page="registerUser.jsp"></jsp:include>
   <div style="width:1200px;margin:0 auto;">
  <jsp:include page="Footer.jsp"></jsp:include>
  </div>
  </div>
</body>
<script src="./js/scriptMain.js"></script>
</html>