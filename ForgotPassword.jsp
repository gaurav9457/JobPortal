<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Naukri</title>
<script src="./js/jQuery.js"></script>
<style>

input[type=text], input[type=password] {
  width: 94%;
  padding: 15px;
  margin: 5px 0 15px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}


input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}


button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}


.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}


.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}


.container {
  padding: 16px;
  width:600px;
}


.modal {
  display: block; 
  position: fixed; 
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: #474e5d;
  padding-top: 50px;
}


.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto;
  border: 1px solid #888;
  width: 40%; 
}


hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 

.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}
.errDiv{
color:red;
font-size:12px;
padding:0px;
}
</style>
</head>
<body>
  <div id="mainParent">
    <div id="id01" class="modal">
  <span onclick="window.location.href='index.jsp'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" action="CommonController">
    <div class="container">
      <h1>Reset Your Password</h1>
     
      <hr>
      
         <input type="hidden" value="forgotPassword" name="action"/>
         
         <input type="radio" id="userTypeUser" name="userType" value="UserRegister" checked/>
                               <label for="userTypeUser">User</label>
                             
                              <input type="radio" id="userTypeRecruiter" name="userType" value="Company">
                              <label for="userTypeRecruiter">Recruiter</label><br>
      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" id="emailId" required>
      <div id="emailError" class="errDiv"></div>
      <label for="psw"><b>Password</b></label>
      <input type="text" placeholder="Enter Password" name="psw" id="password" required>
      <div id="pswError"  class="errDiv"></div>
      <label for="psw-repeat"><b>Confirm Password</b></label>
      <input type="password" placeholder="Repeat Password" name="password" id="confirmPassword" required>
      <div id="passwordError"  class="errDiv"></div>

      <div class="clearfix">
        <button type="submit" class="signupbtn" >Change Password</button>
      </div>
    </div>
  </form>
</div>
  </div>
</body>
<script>
var email_id = document.getElementById('emailId').value;
var err= document.getElementById('errDivEmail');
$(document).on("input",function(event){
	let elt=event.target;
	
	inputErrorDisplay(elt);
});

function inputErrorDisplay(e){
	 let err = $("#"+e.name + "Error");
	 let passwardExp=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
	 
	 if(e.id=="emailId"){
         
         let validEmailid=/^(^[a-z0-9][a-z0-9]*([._][a-z0-9]+)*[@][a-z]+[.][a-z]{2,4}([.][a-z]{1,2})?)$/g;
       
        
         if (/[\s]/.test(e.value)) {
              e.value = e.value.replace(/\s/g, ''); 
              err.html("Email id not contain space");
              return;
          }
   
          /* if(email==" "){
              err.html("Email id can not contain space");
              
          } */
         else  if(!validEmailid.test(e.value)){
             
			   err.html("Enter correct Email id");
			   
			}
          
			else{
			 err.html("&nbsp;");
			}
         
        e.addEventListener("paste", function(event) {
              
          event.preventDefault();
          err.html("Error: Pasting is not allowed");
      });
               
}
	 if(e.id=="password"){
         if (e.value.length > 15) {
             e.value = e.value.substring(0, 15); 
             err.html("Password can only contain 15 characters");
             return;
         }
         if (!e.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/)) {
             err.html("Password must contain at length 8 to 15,one capital letter,one digit,and one special character");
         }
        
         else {
             err.html("&nbsp;");
         }
         
		}
		else if(e.id=="confirmPassword"){
		    if(!checkPassword()){

			  err.html("Password mismatch");
			}
			else{
			err.html("&nbsp;");
			}
         e.addEventListener("paste", function(event) {
             
             event.preventDefault();
             err.html("Error: Pasting is not allowed");
         });
		}
}

function checkPassword(){
    let password = $("#password").val();
	 let confirmPassword = $("#confirmPassword").val();
	 if(password==confirmPassword){
	    return true;
	 }

}
</script>
</html>