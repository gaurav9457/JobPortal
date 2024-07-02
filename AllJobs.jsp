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
#allJobParent{
width:1200px;
margin:0 auto;
}
#MainParent{
	
	width:1200px;
	background-color: white;
	padding-top:2px;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
	}
	#head{
	height:250px;
	width:950px;
	
	
	/* margin-top:10px; */
	}

	.inhead1{
	height:160px;
	width:300px;
	/* background: linear-gradient(to right, #4ca1af, #c4e0e5); */
	/* background-color:#80d1e8; */
	background-image: linear-gradient(60deg, #64b3f4 0%, #c2e59c 100%);
	margin:10px;
	margin-left:70px;
	border-radius:10px;
	}
	.inchild1{
	height:140px;
	width:275px;
	background-color:aqua;
	margin:10px;
	
	}
	#carDetails{
	height:230px;
	width:800px;
		
	}
	#OrderedCarBtn{
	padding:10px 45px;
	border:none;
	background: linear-gradient(to right, #1d976c, #93f9b9);
	margin-top:10px;
	 border-radius: 5px;
    cursor:pointer;
    color:white;
	}
	#OrderedCarBtn:hover{
	background: linear-gradient(to right, #11998e, #38ef7d);
    border-color: #529bee;
     color:black;
	}
</style>
</head>
<body>
<div id="allJobParent">
  <jsp:include page="Navbar.jsp"></jsp:include>
  <div>
  
   <%if(session.getAttribute("AllJobs")!=null) {
                System.out.println("Job List");
          ArrayList Scars = (ArrayList) session.getAttribute("AllJobs");
          Iterator iteratorS = Scars.iterator();
          while(iteratorS.hasNext()){
              PostJob jobS = (PostJob) iteratorS.next();
      %>  
  
    <div id="MainParent">
 	      <div id="head" class="">
			    <div id="carDetails" class="inhead1">
  				  <div style="margin-left:20px">
  				  <h1 style="padding:5px;color:#003459; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Company Name : <%=jobS.getCompanyName() %></h1>
  				  <h4 style="margin-top:5px">Job Role: <%=jobS.getRole() %></h4>
  				  <div style="margin-top:7px">Package : RS <%=jobS.getJobPackage() %>  Lakh </div>
  				  <div style="margin-top:7px; color:blue">No of Openings : <%=jobS.getNoOfOpenings() %></div>
  				 <!--   <button  id="OrderedCarBtn" onclick="buyCar()">View Job</button> -->
  				    <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
                     <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
                    <input type="submit" value="View Job Details" id="OrderedCarBtn"/>
                   </form> 
  				  </div>
  			    </div>
	       </div>
	
  </div>
  <%}} %>

  </div>
  
  <jsp:include page="Footer.jsp"></jsp:include>
 
  <jsp:include page="LoginPage.jsp"></jsp:include>
  <jsp:include page="registerUser.jsp"></jsp:include>
  
</div>
<script src="./js/scriptMain.js"></script>
</body>
</html>