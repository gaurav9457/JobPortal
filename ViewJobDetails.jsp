<%@page import="com.jobPortal.AjaxHandler.AjaxHandler"%>
<%@page import="com.jobPortal.ActionBean.CommonActionBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.jobPortal.beans.PostJob"%>
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
<style>
.modal {
  display: none; 
  position: fixed; 
  z-index: 1; 
  padding-top: 100px; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%;
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4); 
}


.modal-content {
  background-color: #fd5757;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 35%;
}


.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
#modal-msg{
font-size:20px;
color:white;

}
  #progressBarLogi{
    width: 500px;
    height: 5px;
    background: white;
    margin-top: 3px;
    
  }
  @keyframes progres {
    0% {
        width: 500px
    }
  
    100% {
        width: 0px
    }
  
  }
</style>
<script src="./js/jQuery.js"></script>
<script src="./js/jQueryScript.js"></script>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<%long id;

 if (request.getParameter("id") != null) {
  
  id = Long.parseLong(request.getParameter("id"));
} else {
  
  id = Long.parseLong("1");
}
  HttpSession session2 = request.getSession();
  ArrayList jobs = (ArrayList) session.getAttribute("AllJobs");
  PostJob selectedJob = null;
  
  Iterator iterator = jobs.iterator();
  while(iterator.hasNext()){
	  PostJob job = (PostJob) iterator.next();
      if(job.getJobId().longValue()==id){
    	  selectedJob = job; 
    	  break;
      }
  }
  
  %>
 <div id="ViewJobParentDiv">
        <div id="ViewJobNameDiv">
            Role:<h2 style="color:#52a8ee;"> <%= selectedJob != null ? selectedJob.getRole() : "No Job Role mentioned" %></h2>
            <h4 style="color:#00A877;">Company Name : <%= selectedJob != null ? selectedJob.getCompanyName() : "No Company name mentioned" %></h4>
            <span class="viewJobExp">Experience Required : <%= selectedJob != null ? selectedJob.getExperience().toString() : "No Experience mentioned" %> Years</span> <br>
            <span class="viewJobExp" >Location :<%= selectedJob != null ? selectedJob.getLocationState() : "No Location mentioned" %></span> <br>
            <span class="viewJobExp" >Package : <%= selectedJob != null ? selectedJob.getJobPackage().toString() : "No Package mentioned" %> Lakh</span> <br>
            <span class="viewNoOpening">No of Openings : <%= selectedJob != null ? selectedJob.getNoOfOpenings().toString() : "No openings" %></span> 
            <span class="viewNoOpening" id="postedDate">Posted Date : <%= selectedJob != null ? selectedJob.getCreatedDate() : "No Date mentioned" %></span>
            
           <%--  <%if(session.getAttribute("loginUser")!= null){ %> --%>
           <%--  <span id="applyNowSpan"> <button id="applyNow_btn" onclick="applyJob(<%= selectedJob.getJobId() %>)">Apply Now</button></span> --%>
            <%-- <%} %> --%>
            <% if (session.getAttribute("loginAdmin") != null || session.getAttribute("loginCompany") != null) { %>
    <span id="applyNowSpan" style="display: none;"> 
        <button id="applyNow_btn" style="display: none;" onclick="applyJob(<%= selectedJob.getJobId() %>)">Apply Now</button>
    </span>
<% } else { 
    if(session.getAttribute("loginUser") != null ){
    	int uId=Integer.parseInt(session.getAttribute("loginUserId").toString());
    	Long jId= selectedJob.getJobId();
    	Long uIdLong = Long.valueOf(uId);
    	
    	String status= CommonActionBean.checkJobStatus(jId, uIdLong);
    	if(status=="Applied"){
    		%>
    		<span id="applyNowSpan">
            <button id="applyNow_btn" style="background-color:#ff8800">Applied</button>
        </span>
        <%
    	}
    	else if(status == "Contacted"){
    		%>
    		<span id="applyNowSpan">
            <button id="applyNow_btn" style="background-color:green">Contacted </button>
        </span>
        <%
    	}
    	else{
    		%>
    		<span id="applyNowSpan">
            <button id="applyNow_btn" onclick="applyJob(<%= selectedJob.getJobId() %>)">Apply Now</button>
        </span>
        <%
    	}
    	
    }
    else{
%>


    <span id="applyNowSpan">
        <button id="applyNow_btn" onclick="applyJob(<%= selectedJob.getJobId() %>)">Apply Now</button>
    </span>
<% } } %>


        </div>
        <div id="jobDesc">
            <h2>Job Description</h2>
            <span id="jobDescripationDiv"><%= selectedJob != null ? selectedJob.getJobDesc() : "Lorem ipsum dolor sit amet, consectetur adipisicing elit."+ 
            		"Placeat saepe consequatur sit asperiores quia atque? Iusto, placeat"+ 
               " temporibus soluta veniam vero quos. Adipisci culpa, incidunt quod dolorum eaque unde odit" %></span> <br> <br>
            <span> <span style="font-size:large; font-weight: bold;">Required Skills :</span> <span id="skillsDiv"><%= selectedJob != null ? selectedJob.getRequiredSkills() : "No Skills Mentioned" %> </span> </span> <br> <br>
            <span style="font-size:large; font-weight: bold;">About company: </span> <br>
            <span id="companyDesc"><%= selectedJob != null ? selectedJob.getAboutCompany() : "No Company name mentioned" %></span> <br> <br>

            <span>Company Type : <%= selectedJob != null ? selectedJob.getCompanyType() : "No Company Type mentioned" %></span>
             
        </div>
        <div id="JobImgDiv">
        
       </div>

    <jsp:include page="LoginPage.jsp"></jsp:include>
  <jsp:include page="registerUser.jsp"></jsp:include>
  
   
		  
    </div>
    
    <!-- <div class="alert" id="alertBoxLogin">
			 <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
			 <strong id="msglogin"></strong>
			<div id="progressBarLogin" class="">
			
			</div>
		  </div> -->
		  
		  <div id="myModal" class="modal">

  <div class="modal-content">
    <span class="close" id="modal-close">&times;</span>
    <p id="modal-msg"></p>
    <div id="progressBarLogi" class="">
			
			</div>
  </div>

</div>
		  
    <div style="width:1200px;margin:0 auto;margin-top:30px;">
    <jsp:include page="Footer.jsp"></jsp:include>
    </div>
    
    <script src="./js/scriptMain.js"></script>
</body>
</html>