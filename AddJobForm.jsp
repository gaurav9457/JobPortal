<%@page import="com.jobPortal.beans.Company"%>
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
#container {
      
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .input-text,
    .input-number,
    .select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }
    input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

    #submit-button {
        padding: 10px 20px;
        background-color:#f75d34;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    #submit-button:hover {
        background-color: #0056b3;
    }
    #carFormDiv{
      width:600px;
      border:1px solid black;
      border-radius:20px;
      margin-top:20px;
      padding:20px;
      margin:0 auto;
      box-shadow: 10px 10px 5px #aaaaaa;
    }
    .invalid {
        background-color: #ffb3b3;
    }
</style>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
<h1></h1>
<div class="container">
<%Company company; %>
   <%if( session.getAttribute("loginCompany")!=null){
	   company=(Company) session.getAttribute("loginCompany");
    %>
   
<div id="carFormDiv">
    <h2 style="text-align:center">Add Job Form</h2>
    <br>
    <form id="jobForm" action="CommonController" method="post" >
    <input type="hidden" name="action" value="addJob">
    <input type="hidden" name="companyId" value=<%=session.getAttribute("CompanyUserId").toString() %>>
        <div class="form-group">
            <label for="company_name" class="label">Company Name : </label>
            <input type="text" id="company_name" class="input-text" name="company_name" value="<%= company.getCompanyName()%>">
        </div>
        <div class="form-group">
            <label for="job_role" class="label">Job Role :</label>
            <input type="text" id="job_role" class="input-text" name="job_role" >
        </div>
        <div class="form-group">
            <label for="price" class="label">Package (Lakh Per Annum) :</label>
           <input type="text" id="price" class="input-number" placeholder="Lakh"name="price" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 2);">

        </div>
        <div class="form-group">
            <label for="Job_Location" class="label">Job Location:</label>
            <select id="Job_Location" class="select" name="Job_Location" >
                <option value="Maharashtra">Maharashtra</option>
			    <option value="Gujrat">Gujrat</option>
				<option value="Goa">Goa</option>
				<option value="Rajastan">Rajastan</option>
            </select>
        </div>
        <div class="form-group">
            <label for="no_of_openings" class="label">No of Openings :</label>
            <input type="text" id="no_of_openings" class="input-number" placeholder="No of Openings" name="no_of_openings" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);">
 
        </div>
        <div class="form-group">
            <label for="education_details" class="label">Required Education : </label>
            <input type="text" id="education_details" class="input-text" name="education_details" >
        </div>
        <div class="form-group">
            <label for="keySkills" class="label">Required Key Skills:</label>
            <input type="text" id="keySkills" class="input-text" name="keySkills" >
            
        </div>
        <div class="form-group">
            <label for="experience" class="label">Experience :</label>
            <select id="experience" class="select" name="experience" >
                <option value="0">Fresher</option>
                <option value="1">1 Year</option>
                <option value="5">5 Year</option>
                 <option value="6"> 6 Year</option>
                <option value="7">7 Year</option>
            </select>
        </div>
       
        <div class="form-group">
            <label for="job_description" class="label">Job Description :</label>
            <textarea id="job_description" class="input-text" name="job_description" rows="4" placeholder="upto 100 characters"></textarea>
        </div>
        <div class="form-group">
            <label for="about_company" class="label">About Company :</label>
            <textarea id="about_company" class="input-text" name="about_company" rows="4" placeholder="upto 100 characters"></textarea>
        </div>
        <div class="form-group">
            <label for="company_type" class="label">Company Type:</label>
            <select id="company_type" class="select" name="company_type" >
                <option value="MNC">MNC</option>
                <option value="Start_up">Start Up</option>
                <option value="Mid_Scale">Mid scale</option>
                <!-- <option value="4"></option>
                <option value="5">XUV</option> -->
            </select>
        </div>
         
        <input type="submit" id="submit-button" value="Submit Details">
    </form>
    <%} %>
</div>
<h1></h1>
         <div style="width:1200px;margin:0 auto;">
          <jsp:include page="Footer.jsp"></jsp:include>
          </div>
</div>

<!-- <script src="../js/scriptI.js"></script> -->
<script type="text/javascript">

//var currentYear = new Date().getFullYear();


//document.getElementById("registerDate").max ="2024-5-31";

document.getElementById("jobForm").addEventListener('submit', function(event) {
    var form = event.target;
    var company_name = form.elements['company_name'].value.trim();
    var job_role = form.elements['job_role'].value.trim();
   
    var Job_Location = form.elements['Job_Location'].value;
    var no_of_openings = form.elements['no_of_openings'].value.trim();
    var education_details = form.elements['education_details'].value;
    var keySkills = form.elements['keySkills'].value.trim();
    var job_description = form.elements['job_description'].value.trim();
    var about_company = form.elements['about_company'].value;
    var company_type = form.elements['company_type'].value;
    var experience = form.elements['experience'].value;
   
    //console.log("Brand "+carBrand," ",job_role, registerDate);
    
    //var maxDate = new Date("2024-05-31");
    
    if (!company_name || !job_role ||  !Job_Location || !fuelType || !no_of_openings || !education_details || !keySkills || !job_description || !carType || !company_type || !experience ) {
        event.preventDefault(); 
        document.getElementById('jobForm').querySelectorAll('input, select, textarea').forEach(function(element) {
            if (!element.value.trim()) {
                element.classList.add('invalid'); 
            } else {
                element.classList.remove('invalid'); 
            }
        });
    }
});
</script>
<!-- <script src="./js/scriptMain.js"></script> -->
</body>
</html>