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
</head>
<%! public String userName(HttpServletRequest req){
	HttpSession session=req.getSession();
	
	if(session.getAttribute("loginUserName")!=null){
		return session.getAttribute("loginUserName").toString();
	}
	return "Login/Regsiter";
 } 

 public String AdminName(HttpServletRequest req){
	 HttpSession session=req.getSession();
	 
	 if(session.getAttribute("createdBY")!=null){
		     System.out.println(session.getAttribute("createdBY"));
			return "View All Users";
		}
		return "";
 }
 %>
<body>
 <div id="NavParent">
        <div id="Nav">
            <div id="logo">
                <a href="index.jsp">
                    <img src="https://content.jdmagicbox.com/comp/mumbai/j7/022pxx22.xx22.170821125442.b8j7/catalogue/naukri-com-online-placement-services-oyx4l.jpg" 
                         alt="" height="60px" width="150px">
                </a>
            </div>
    
            <div id="navJobDiv">
               <a href="AllJobs.jsp" >  <div class="navItem">Jobs</div> </a>
               <a href="GetAllCompany.jsp"> <div class="navItem">Companies</div></a>
               
               <%if(session.getAttribute("loginUser")!=null){ %>
                <div class="searchSkill"> 
                      <form action="">
                       <input type="text" placeholder="Search Skills..." name="search" id="searchSkillBar">
                       <span style="cursor:pointer;margin-left:17px;margin-bottom:10px;" onclick="searchSkill()"><img src="images/search4.png" style="margin-bottom:3px"></span>
                     </form>
                </div> 
                <%} %>
                
               <!--  <div class="navItem">Services</div> -->
                <%if(session.getAttribute("CompanyUserId")!=null){ %>
               <a href="AddJobForm.jsp" > <div class="navItem" >Add Job</div></a>
               <a href="CompanyPage.jsp" > <div class="navItem" >For Recrutier</div></a>
                <a href="./CommonController?action=getAllUserPage" > <div class="navItem" >All Users</div></a>
                <%} %>
                <%if(session.getAttribute("loginAdmin")!=null){ %>
                 <a href="./CommonController?action=getAllUser"  id="ViewRegisterUser"  style="text_decoration:none;">View Register User</a>&nbsp;&nbsp;
                 <a href="./CommonController?action=getAllCompany"  style="text_decoration:none;">View Register Company</a>&nbsp;&nbsp;
                 <a href="./CommonController?action=getAllApplication"  style="text_decoration:none;">Applicants</a>
                <%} %>
                <div class="navItem"></div>
            </div>
    
           <div id="loginBtn">
           <%if(session.getAttribute("loginUserName")==null){ %>
                <a href="RegisterCompany.jsp" id="regiRecruiter">
                    <span id="registerRecruiter" >Register As Recruiter</span>
                </a>
                
                <%} %>
                
                <%if(session.getAttribute("loginAdmin")!=null){ %>
                <a href="RegisterCompany.jsp" id="regiRecruiter">
                    <span id="registerRecruiter" >Add Recruiter</span>
                </a>
                <%} %>
                
                
                <a href="#" id="login-Btn">
                    <img src="https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg" 
                         alt="" id="profile-img">
                    <span id="loginProfile" onclick="validate.showLoginPoup()"><%=userName(request)%></span>
                </a>
                
            </div>
        </div>
    </div>
</body>
</html>