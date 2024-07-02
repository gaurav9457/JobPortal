<%@page import="com.jobPortal.beans.Company"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jobPortal.beans.AdminTable"%>
<%@page import="com.jobPortal.beans.UserRegister"%>
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
#viewUserParent{
 width:1200px;
 margin:0 auto;
 position: relative;
}

.user-detail strong {
            display: inline-block;
            width: 150px;
            font-weight: bold;
           
        }
        #logoutButton{
        padding:10px 12px;
        background-color:blue;
        color:white;
        border:none;
        margin-top:30px;
        cursor:pointer;
        box-shadow: 0 10px 10px rgba(0, 0, 0, 0.5);
        margin-left:30px;
        }
         #logoutButton:hover{
         background-color:white;
         color:blue;
         }
        .admin_btn{
         padding:10px 12px;
        background-color:#529bee;
        color:white;
        border:none;
        margin-top:30px;
        cursor:pointer;
        text-decoration:none;
        }
        .admin_btn:hover{
        background-color: #2593ee;
        color:black;
        box-shadow: 0 10px 10px rgba(0, 0, 0, 0.5);
        }
        #AppliedJobBtn{
         padding:10px 12px;
        background-color:#529bee;
        color:white;
        border:none;
        margin-top:30px;
        cursor:pointer;
        box-shadow: 0 10px 10px rgba(0, 0, 0, 0.5);
        margin-left:20px;
        }
        #AppliedJobBtn:hover{
        background-color:white;
         color:blue;
        }
         #userDetailsForm{
         width:420px;
    height:310px;
	max-height:70%;
	 background-color: white; 
    padding:20px;
    border-radius:10px;
	overflow-y:scroll;
	overflow-x:none;
    border:1px solid black;    
    margin:20px;
        }
        #editButton{
         padding:10px 12px;
        background-color:#529bee;
        color:white;
        border:none;
        margin-top:30px;
        cursor:pointer;
         box-shadow: 0 10px 10px rgba(0, 0, 0, 0.5);
         margin-left:30px;
        }
        .message{
        color:green;
        }
        #editButton:hover{
        background-color:white;
         color:blue;
        }
        #viewUserImgDiv{
            float: right;
    position: absolute;
    right: 150px;
        }
        #userDetailsForm{
         display:none; 
        }
       
</style>
</head>
<body>
 <jsp:include page="Navbar.jsp"></jsp:include>
 <div id="viewUserParent">
 <div style="margin-left:100px;">
 <h1>View Profile </h1>
  <%!UserRegister user; AdminTable admin; Company company;Long updatedMobileNo,updatedPincode; long userMobileNo; %>
   <% if (request.getParameter("status")!= null) { %>
                <div class="message" id="successMessage">
                    <%= request.getParameter("status") %>
                </div>
            <% } %>
 <div id="viewUserImgDiv">
 
 <img src="images/profile.png" height="150px" width="150px" style="margin-bottom:20px;">
</div>
   
    <%   if( session.getAttribute("loginUser")!=null) {
 
   /*  ArrayList uBeans = (ArrayList) session.getAttribute("loginUser");
    Iterator iteratorS = uBeans.iterator();
    while(iteratorS.hasNext()){ */
         user = (UserRegister)  session.getAttribute("loginUser");
         
%>
    
    <div class="user-detail">
        <strong>First Name:</strong> <span id="firstName"><%= session.getAttribute("UpdatedFirstname") != null ? session.getAttribute("UpdatedFirstname") : user.getFirstName()  %></span>
    </div>
    
    <div class="user-detail">
        <strong>Last Name:</strong> <span id="lastName"><%= session.getAttribute("UpdatedLastname") != null ? session.getAttribute("UpdatedLastname") :user.getLastName() %></span>
    </div>
    <div class="user-detail">
    <strong>Mobile No:</strong> <span id="mobileNo"><%= session.getAttribute("UpdatedMobileNo") !=  null ? session.getAttribute("UpdatedMobileNo") : Long.valueOf(user.getMobileNo()) %></span> 
    </div>
    <div class="user-detail">
        <strong>Email:</strong> <span id="email"><%=  user.getEmailId() %></span>
    </div>
    
    <div class="user-detail">
        <strong>State:</strong> <span id="address"><%= session.getAttribute("UpdatedAddress") != null ? session.getAttribute("UpdatedAddress") : user.getState() %></span>
    </div>
    <div class="user-detail">
        <strong>Skills:</strong> <span id="state"><%=  session.getAttribute("UpdatedSkills") != null ? session.getAttribute("UpdatedSkills") :user.getSkills() %></span> 
    </div>
     <a  id="AppliedJobBtn" onclick="viewAppliedJob(<%= user.getUserId()%>)">Applied Jobs</a>
      <a  id="AppliedJobBtn" onclick="viewCompanyContacted(<%= user.getUserId()%>)">Company contacted</a>
     <button  id="editButton" >Edit Profile</button>
    <button onclick="toggleResume()" id="AppliedJobBtn">View Resume</button>
    
    <%--  <div id="resumeDiv" style="display:none;">
    
    <% 
    String resumeFile = (String) session.getAttribute("updatedResume");

    if (resumeFile == null) {
        resumeFile = user.getResumeFile();
    }

    if (resumeFile != null && !resumeFile.isEmpty()) { 
%>
    <div id="resumeDiv">
        <iframe src="./staticContent/<%= resumeFile %>" class="pdf" type="application/pdf" width="50%" height="400px"></iframe>
        <p>If you cannot view the PDF, you can <a href="./staticContent/<%= resumeFile %>" target="_blank">click here to download it.</a></p>
    </div>
<% } else { %>
    <p>No resume uploaded.</p>
<% } %>
   </div> --%>
<% } %>

<% else if(session.getAttribute("loginAdmin") != null){
	       admin =(AdminTable) session.getAttribute("loginAdmin");%>
      <h2>Admin</h2>
   <div class="user-detail">
        <strong>First Name:</strong> <span id="firstName"><%= admin.getFirstName() %></span>
    </div>
    
    <div class="user-detail">
        <strong>Last Name:</strong> <span id="lastName"><%= admin.getLastName()  %></span>
    </div>
    <%-- <div class="user-detail">
    <strong>Mobile No:</strong> <span id="mobileNo"><%= admin.get %></span> 
    </div> --%>
    <div class="user-detail">
        <strong>Email:</strong> <span id="email"><%=  admin.getEmailId() %></span>
    </div>
   <a href="./CommonController?action=getAllUser"  id="ViewRegisterUser" class="admin_btn">View Register User</a>
   <a href="./CommonController?action=getAllCompany"  class="admin_btn">View Register Company</a>
   
    <%} %>
     <%else if(session.getAttribute("loginCompany")!= null){
    	company=(Company) session.getAttribute("loginCompany"); %> 
    
      <div class="user-detail">
        <strong>Company Name:</strong> <span id="firstName"><%= company.getCompanyName()!=null ? company.getCompanyName() : "No Company Found" %></span>
    </div>  
    
     
       <div class="user-detail">
        <strong>Email:</strong> <span id="email"><%=  company.getCompanyEmail()!=null ? company.getCompanyEmail() : "No Email" %></span>
    </div> 
    <div class="user-detail">
        <h1></h1>
    </div> 
      <div class="user-detail" style="margin-top:20px;">
   <h1>&nbsp;</h1>
    </div> 
      <div class="user-detail">
       <h1></h1>
    </div>
    
   <%} %> 
   <a href="./CommonController?action=logOut"><button type="button" id="logoutButton">Logout</button></a> 
   
   <%if(session.getAttribute("loginUser")!=null) {%>
     
    <%-- <form id="userDetailsForm" action="CommonController"  enctype="multipart/form-data" style="display:none;">
       
					    <input type="hidden" value="updateUser" name="action"/>
				      <input type="hidden" value="<%= user.getUserId() %>" name="userId"> 
						
						<label for="fname" class="lableColor">First Name <span class="starColor">*</span>: </label> <br>

						<input type="text" id="fname" name="firstname" placeholder="Your First name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)" autofocus 
							value="<%= session.getAttribute("UpdatedFirstname") != null ? session.getAttribute("UpdatedFirstname") : user.getFirstName()%>">
						<div id="firstnameError" class="errorDiv">&nbsp;</div>
						
						
						<label for="lname" class="lableColor">Last Name <span class="starColor">*</span> : </label> <br>

						<input type="text" id="lname" name="lastname" placeholder="Your last name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)" 
							value="<%=session.getAttribute("UpdatedLastname") != null ? session.getAttribute("UpdatedLastname") : user.getLastName() %>">
						<div id="lastnameError" class="errorDiv">&nbsp;</div>
						

						<label for="address" class="lableColor">Skills <span class="starColor">*</span>: </label><br>
						 <input type="text"name="addressArea" class="inpformat" id="addressArea" cols="53" rows=""
							style="margin:10px;width:400px;" oninput="validate.inputErrorDisplay(this)" 
							value="<%=  session.getAttribute("UpdatedSkills") != null ? session.getAttribute("UpdatedSkills"): user.getSkills() %>">
						<div id="addressAreaError" class="errorDiv"></div> 
						
						<label for="gd" class="lableColor">Upload Resume <span class="starColor">*</span>: </label> <br>
					 <input type="file" name="resume" id="gd" class="inpformat" accept="image/*"/> 
						<div id="gdError" class="errorDiv">&nbsp;</div>  

						<br>
						
						<div id="btn-div" class="">
						<input type="submit" class="btn" id="submitUpdate" value="Update">
					
						</div>
					
    </form> --%>
    
     <div id="resumeDiv" style="display:none;">
    
    <% 
    String resumeFile = (String) session.getAttribute("updatedResume");

    if (resumeFile == null) {
        resumeFile = user.getResumeFile();
    }

    if (resumeFile != null && !resumeFile.isEmpty()) { 
%>
    <div id="resumeDiv">
        <iframe src="./staticContent/<%= resumeFile %>" class="pdf" type="application/pdf" width="50%" height="400px"></iframe>
        <p>If you cannot view the PDF, you can <a href="./staticContent/<%= resumeFile %>" target="_blank">click here to download it.</a></p>
    </div>
<% } else { %>
    <p>No resume uploaded. Please Update your profile</p>
<% } %>
   </div>
    
    <form id="userDetailsForm" action="CommonController" method="POST" enctype="multipart/form-data">
    <input type="hidden" value="updateUser" name="action"/>
				      <input type="hidden" value="<%= user.getUserId() %>" name="userId"> 
						
						<label for="fname" class="lableColor">First Name <span class="starColor">*</span>: </label> <br>

						<input type="text" id="fname" name="firstname" placeholder="Your First name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)" autofocus 
							value="<%= session.getAttribute("UpdatedFirstname") != null ? session.getAttribute("UpdatedFirstname") : user.getFirstName()%>">
						<div id="firstnameError" class="errorDiv">&nbsp;</div>
						
						
						<label for="lname" class="lableColor">Last Name <span class="starColor">*</span> : </label> <br>

						<input type="text" id="lname" name="lastname" placeholder="Your last name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)" 
							value="<%=session.getAttribute("UpdatedLastname") != null ? session.getAttribute("UpdatedLastname") : user.getLastName() %>">
						<div id="lastnameError" class="errorDiv">&nbsp;</div>
						

						<label for="address" class="lableColor">Skills <span class="starColor">*</span>: </label><br>
						 <input type="text"name="addressArea" class="inpformat" id="addressArea" cols="53" rows=""
							style="margin:10px;width:400px;" oninput="validate.inputErrorDisplay(this)" 
							value="<%=  session.getAttribute("UpdatedSkills") != null ? session.getAttribute("UpdatedSkills"): user.getSkills() %>">
						<div id="addressAreaError" class="errorDiv"></div> 
						
						<label for="gd" class="lableColor">Upload Resume <span class="starColor">*</span>: </label> <br>
					 <input type="file" name="resume" id="gd" class="inpformat" accept=".pdf"/> 
						<div id="gdError" class="errorDiv">&nbsp;</div>  

						<br>
						
						<!-- <div id="btn-div" class="">
						<input type="submit" class="btn" id="submitUpdate" value="Update">
					
						</div> -->
    
    <input type="submit" class="btn" value="submit">
    </form>
    <%} %>
   
   </div>
   
   <h1></h1>
   <jsp:include page="Footer.jsp"></jsp:include>
   
 </div>
 
 <script src="./js/scriptMain.js"></script>
 <script>
 function disabledBack(){
	   window.history.forward();
 }
 
 window.onload=disabledBack();
 window.onpageshow = function(evt){
	   if(evt.persisted){
		   disabledBack();
	   }
 }
 
 var editButton = document.getElementById('editButton');
 var userDetailsForm = document.getElementById('userDetailsForm');


 editButton.addEventListener('click', function() {
    
     if (userDetailsForm.style.display === 'none') {
         userDetailsForm.style.display = 'block';
     } else {
         userDetailsForm.style.display = 'none';
     }
 });
 
 function toggleResume() {
     var resumeDiv = document.getElementById("resumeDiv");
     if (resumeDiv.style.display === "none") {
         resumeDiv.style.display = "block";
     } else {
         resumeDiv.style.display = "none";
     }
 }
 
 function validateForm() {
     var fname = document.getElementById("fname").value.trim();
     var lname = document.getElementById("lname").value.trim();
    // var mobile = document.getElementById("mobile").value.trim();
     var address = document.getElementById("addressArea").value.trim();
    // var pincode = document.getElementById("pincode").value.trim();

     
     document.getElementById("fname").style.borderColor = "";
     document.getElementById("lname").style.borderColor = "";
    // document.getElementById("mobile").style.borderColor = "";
     document.getElementById("addressArea").style.borderColor = "";
    // document.getElementById("pincode").style.borderColor = "";

     if (fname === "") {
         document.getElementById("fname").style.borderColor = "red";
     }
     if (lname === "") {
         document.getElementById("lname").style.borderColor = "red";
     }
    /*  if (mobile === "") {
         document.getElementById("mobile").style.borderColor = "red";
     } */
    /*  if (!mobile.match("^[6-9][0-9]{8}")){
  	   document.getElementById("mobileError").innerHTML="Enter correct mobile number";
     } */
     if (address === "") {
         document.getElementById("addressArea").style.borderColor = "red";
     }
     /* if (pincode === "") {
         document.getElementById("pincode").style.borderColor = "red";
         document.getElementById("pincode").style.backgroundColor = "red";
     } */

     if (fname === "" || lname === "" || address === ""  )  {
        
         return false; 
     }
     return true; 
 }
 </script>
</body>
</html>