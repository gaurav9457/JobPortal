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


</style>
</head>
<body>
<div id="RegisterCompanyParent">
<jsp:include page="Navbar.jsp"></jsp:include>
    <div id="Register_Company">
        <div id="company_img">
            
        </div>
        <div id="Company_registerForm">
           <!--  <form action="CommonController" id="companyForm" onsubmit="return validateForm()" enctype="multipart/form-data">
             <input type="hidden" name="action" value="registerCompany">
             <input type="hidden" name="registerType" value="company">
                <div>
                    <label for="">Compnay Name : </label>
                    <input type="text" name="company_name" id="company_name" required>
                </div>
                <div>
                    <label for="">Email_ID : </label>
                    <input type="text" name="company_email" id="company_email" onkeydown="inpCheck(this)" required>
                    <span id="company_emailError" style="color:red;">&nbsp;</span>
                </div>
                <div>
                    <label for="">Password : </label>
                    <input type="text" name="company_password" id="company_password" oninput="inpCheck(this)" required>
                    <span id="company_passwordError" style="color:red;">&nbsp;</span>
                </div>
                <div>
                    <label for="">Confirm Password : </label>
                    <input type="password" name="company_password_confirm" id="company_password_confirm" required>
                </div>
                <div>
                    <label for="">Upload Company Image : </label>
                    <input type="file" name="company_image" id="company_image" accept="image/*" required>
                </div>
                <input type="submit" value="Register Company" id="submit_company">
            </form> -->
            
            <form enctype="multipart/form-data" action="CommonController" method="post">
             <input type="hidden" name="action" value="registerCompany">
             <input type="hidden" name="registerType" value="company">
                <div>
                    <label for="">Compnay Name : </label>
                    <input type="text" name="company_name" id="company_name" required>
                </div>
                <div>
                    <label for="">Email_ID : </label>
                    <input type="text" name="company_email" id="company_email" onkeydown="inpCheck(this)" required>
                    <span id="company_emailError" style="color:red;">&nbsp;</span>
                </div>
                <div>
                    <label for="">Password : </label>
                    <input type="text" name="company_password" id="company_password" oninput="inpCheck(this)" required>
                    <span id="company_passwordError" style="color:red;">&nbsp;</span>
                </div>
                <div>
                    <label for="">Confirm Password : </label>
                    <input type="password" name="company_password_confirm" id="company_password_confirm" required>
                </div>
               
               <div>
                    <label for="">Upload Company Image : </label>
                    <input type="file" name="company_image" id="company_image" accept="image/*" >
                     <input type="submit" value="Register">
                </div>
            </form>
        </div>
        <div style="clear: both;"></div>
          
    </div>
    <h1></h1>
    <div style="clear: both;"></div>
    <jsp:include page="Footer.jsp"></jsp:include>
</div>
<script src="./js/scriptMain.js"></script>
<script>
function validateForm() {
	
    var password = document.getElementById("company_password").value;
    var confirmPassword = document.getElementById("company_password_confirm").value;

    if (password != confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    return true; 
}

function inpCheck(e){
	let email= document.getElementById("company_email").value;
	let err = document.getElementById(e.id + "Error");
	if(e.id=="company_email"){
        // let emailValidREgexp=/(^[a-zA-Z]{2}[a-zA-Z0-9-.]*@[a-z]+([.][a-zA-Z]{2}))/;
        let validEmailid=/^(^[a-z0-9][a-z0-9]*([._][a-z0-9]+)*[@][a-z]+[.][a-z]{2,4}([.][a-z]{1,2})?)$/g;
       //let validEmailid=/^[a-z]{2}[a-zA-Z0-9]*([.]{1}[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z]+)+$/;

        let email_id = document.getElementById(e.id);
        
        if (event.keyCode==32) {
         event.preventDefault();

        }

        email_id.addEventListener("input",()=>{
         if(email==" "){
             err.innerHTML="Email id can not contain space";
         }
        else  if(!validEmailid.test(e.value)){
            
			   err.innerHTML="Enter correct Email id";
			}
         
			else{
			  err.innerHTML = "&nbsp;"; 
			}
        });
       email_id.addEventListener("paste", function(event) {
             
         event.preventDefault();
         alert("Error: Pasting is not allowed");
     });
         
		
		}
	else if(e.id=="company_password"){
        if (e.value.length > 15) {
            e.value = e.value.substring(0, 15); 
            err.innerHTML="Password can only contain 15 characters";
            return;
        }
        if (!e.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/)) {
            err.innerHTML="Password must contain at length 8 to 15,one capital letter,one digit,and one special character";
        }
       
        else {
            err.innerHTML="&nbsp;";
        }
        
		}
}
</script>
</body>
</html>