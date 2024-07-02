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
</head>
<body>
<div style="width:1200px;margin:0 auto;">
<jsp:include page="Navbar.jsp"></jsp:include>

<div id="UsedCars">
           <h1 style="color:#52a8ee;font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Available Job's</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("AllJobs")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("getPostedJobs");
          Iterator iteratorS = Scars.iterator();
          while(iteratorS.hasNext()){
              PostJob jobS = (PostJob) iteratorS.next();
              int randomImageIndex = (int) (Math.random() * 4) + 1;
              String imageName = "company" + randomImageIndex + ".jpg";
              String imagePath = "images/" + imageName;
      %>  
                  <div id="cardBody" class="">
    <div id="imgDiv">
      <img id="imgDiv" src="./staticContent/<%=jobS.getCompany().getCompanyLogo()%>" alt="">
    </div>
    <div id="carCardContent">
       <div id="carCardName" style="text-align: center;"><%=jobS.getCompanyName() %></div> <br>
     <span id="carCardprice"><%=jobS.getAboutCompany() %></span> <br> 
     <span id="jobTitle"><%=jobS.getRole() %></span> <br> 
     <span>Rs <%=jobS.getJobPackage() %> Lakh</span>
     <% if (jobS.getIsActive().equals("Y")) { %>
      <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form> 
        <% } else { %>
                <button id="" disabled>Inactive</button>
            <% } %>
      </div>
    </div>

    <%
      }
          }
            else {
              %>
              <p>No Job Available .</p>
          <% } %>  
    
              </div>
              <div style="clear: both;"></div>
              </div> 
<div>
<jsp:include page="Footer.jsp"></jsp:include>
</div>

</div>
</body>
</html>