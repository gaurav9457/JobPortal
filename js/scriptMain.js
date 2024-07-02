let LoginpopupDiv=document.getElementById("popupDiv");
let RegisterPopup=document.getElementById("Formcontainer");
var validate = new ValidationFormMain();
window.onclick = function (e) {

    if (e.target == LoginpopupDiv || e.target == RegisterPopup ) {
    	LoginpopupDiv.style.display = "none";
    	RegisterPopup.style.display = 'none';
    	//validate.resetForm();
    	document.getElementById("Username").value="";
        document.getElementById("Password").value="";
       // tablePage.style.display = 'none';
		alertBoxLogoutParent.style.display = 'none';
		
		document.getElementById("Username").value="";
        document.getElementById("Password").value="";

    }
}
window.addEventListener("paste", function(event) {
    
    event.preventDefault();
	validate.alertDisplay("Error:Pasting is not allowed");
   
});

var submitBtn = document.getElementById("submitRegister");

submitBtn.addEventListener("click", (e) => {
	
    validate.validationForm(e);
})

function ValidationFormMain() {
    this.validationForm = validationForm;
    this.resetForm = resetForm;
    this.inputErrorDisplay = inputErrorDisplay;
    //this.loginAuth=loginAuth;
	this.alertDisplay=alertDisplay;
    this.alertDisplayLogout=alertDisplayLogout;
    this.checkPassword=checkPassword;
	this.state=state;
	this.loginValidation=loginValidation;
	//this.openPage=openPage;
	this.loginValidation=loginValidation;
	this.closeRegisterPopup=closeRegisterPopup;
	this.showRegisterPopup=showRegisterPopup;
	this.closeLoginPopup=closeLoginPopup;
	this.showLoginPoup=showLoginPoup;

    function validationForm(e) {
        let fname = document.getElementById("fname").value;
        let lname = document.getElementById("lname").value;
        console.log(fname," Nameeee");
       // let gender = document.querySelector('input[name="gender"]:checked');
        let mobile = document.getElementById("mobile").value;
       // let dob = document.getElementById("dob").value;
       // let age = document.getElementById("age").value;
		let email=document.getElementById("email").value;
		let password = document.getElementById("password").value;
		let confirmPassword = document.getElementById("confirmPassword").value;
        let city = document.getElementById("city").value;
        let addressArea = document.getElementById("addressArea").value;
        let checkboxes = document.querySelectorAll('input[name="Skills"]:checked');
		 let state = document.getElementById("state").value;

		//let pincode = document.getElementById("pincode").value;
		 //let dateValidationResult = isValidDate(dob);
        
        let pattern = /^[a-zA-Z]{2,15}$/;
        let num = /\d/;
        let count = /\d{10}$/;
        let ageCount = /\d{1,2}$/;
        let dobvalidate = /\d{1,2}\/\d{1,2}\/\d{4}/;
        let address = /^.{2,250}$/;

        if (fname == "") {
        	 e.preventDefault(); 
            firstnameError.innerHTML="Enter first name it is mandatory";
            alertDisplay("Enter first name it is mandatory");

        }
		else if (!fname.match(pattern))
		{
			 e.preventDefault(); 
			alertDisplay("First name not contain numbers");
		}
        else if (lname == "") {
        	 e.preventDefault(); 
            lastnameError.innerHTML="Enter last name it is mandatory";
            alertDisplay("Last name is mandatory");
        }
		else if (!lname.match(pattern)) {
			 e.preventDefault(); 
            alertDisplay("Last name not contain numbers");
        }

     /*   else if (!gender) {
        	 e.preventDefault(); 
            alertDisplay("Please select a gender");
        }
        else if (dob == '') {
        	 e.preventDefault(); 
            alertDisplay("Enter date of-birth");
        }
		else if (!dobvalidate.test(dob)) {
			 e.preventDefault(); 
                alertDisplay("Please enter a valid date of birth in the format dd/mm/yyyy");
        }
        else if (dateValidationResult === "invalidFormat") {
        	 e.preventDefault(); 
                alertDisplay("Please enter a valid date of birth ");
               
        }
        else if (dateValidationResult === "invalidDate") {
        	 e.preventDefault(); 
                alertDisplay("Please enter a valid date");
                
        }
        else if (dateValidationResult === "futureDate") {
        	 e.preventDefault(); 
                alertDisplay("Date of birth should be before the year 2024");
                
        }
		 else if (dateValidationResult === "minor") {
			        e.preventDefault(); 
                    err.innerHTML = "You are not able to register, your age was less than 18 years";
                    
                }*/
        else if (mobile == "") {
        	 e.preventDefault(); 
            alertDisplay("Please enter mobile number");
        }
        else if(!mobile.match("^[6-9][0-9]{8}")) {
        	 e.preventDefault(); 
            alertDisplay("Please enter proper mobile number");
        }
		else if(email==""){
			 e.preventDefault(); 
		    alertDisplay("Please enter email id");
		}
		else if(!email.match("^(^[a-z0-9][a-z0-9]*([._][a-z0-9]+)*[@][a-z]+[.][a-z]{2,4}([.][a-z]{1,2})?)$"))
		{   e.preventDefault(); 
		    alertDisplay("Please enter correct email id");
		}
		else if(password==""||confirmPassword==""){
			 e.preventDefault(); 
		   alertDisplay("Please enter password");
		}
        else if(!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/)){
        	 e.preventDefault(); 
           alertDisplay("Password must contain at least 9 characters, one capital letter, one digit, and one special character");
        }
		else if(!checkPassword()){
			 e.preventDefault(); 
		    alertDisplay("Passwords are not same, keep it same");
		}
        else if (addressArea == "") {
        	 e.preventDefault(); 
            alertDisplay("Please enter address it is mandatory");
        }
        else if (!address.test(addressArea)) {
        	 e.preventDefault(); 
            alertDisplay("address Should be less than 250 characters");
        }
        else if (!count.test(mobile)) {
        	 e.preventDefault(); 
            alertDisplay("Enter 10 digit mobile no");
        }
        else if (pattern.test(mobile)) {
        	 e.preventDefault(); 
            alertDisplay("Mobile no not contain alphabets");
        }
		/*else if(age==""){
			 e.preventDefault(); 
		    alertDisplay("Enter your age");
		}

        else if (!(age > 17 && age < 70)) {
        	 e.preventDefault(); 
            alertDisplay("Your age was not eligible for register, Age must be greater than 18 years");
        }*/
        else if (city == "") {
        	 e.preventDefault(); 
            alertDisplay("Please select city");
        }
		else if(state==""){
			 e.preventDefault(); 
		   alertDisplay("Please select state");
		}
	/*	else if(pincode==""){
			 e.preventDefault(); 
		    alertDisplay("Please enter pincode");
		}*/
		/*else if(!pincode.match("^[1-9]{1}[0-9]{2}[0-9]{3}$")){
			 e.preventDefault(); 
		    alertDisplay("Please enter correct pincode");
		}*/


        else {
			
            document.getElementById("alertBox").style.display = 'block';
            document.getElementById("alertBox").style.background = 'green';
            document.getElementById("msg").innerHTML = "Form submitted Successfully";
            document.getElementById("progressBar").style.animation = 'progress 3s 1 ease-in-out';
            setTimeout(function () {
                document.getElementById("alertBox").style.display = 'none';
            }, 3000);
            // console.log("First: ",fname," Last: ",lname," gender: ",gender," dob: ",dob," age: ",age," mob: ",mobile," Email: ",email," Password : ",password ," Confirm: ",confirmPassword ," address: ",addressArea," city: ",city," pincode: ",pincode," Techinical: ",checkboxes );
            var selectedGender=gender.value;
            var box="";
            var selectedCheckboxValues = [];
           
             
            checkboxes.forEach(function(checkbox) {
               selectedCheckboxValues.push(checkbox.value);
             });
             var box=selectedCheckboxValues.join(", ");


            let storedObj={
                fname:fname,
                lname:lname,
                selectedGender:selectedGender,
                dob:dob,
                age:age,
                mobile:mobile,
                email:email,
                confirmPassword:confirmPassword,
                addressArea:addressArea,
                city:city,
				state:state,
                pincode:pincode,
                checkboxes:box
            };

            storedArray.push(storedObj);
			
          
           setTimeout( function(){loginObj.closePopup()},2000);
         //  setTimeout( function(){loginObj.displayTable()},2500);

		   
           //generateTable();
          
           setTimeout( function(){resetForm()},2500); 
                
        }
    }

    function generateTable() {
		

        var tbody = document.getElementById("Tablebody");
        
        tbody.innerHTML = "";

        storedArray.forEach(function(obj) {
            var row = document.createElement("tr");

            Object.keys(obj).forEach(function(key) {
                var cell = document.createElement("td");
                cell.textContent = obj[key];
                row.appendChild(cell);
            });

            tbody.appendChild(row);
        });
    }

   

    function isValidDate(dateString) {

        let datePattern = /^\d{1,2}\/\d{2}\/\d{4}$/;

        if (!datePattern.test(dateString)) {
            return "invalidFormat";
        }

        let splited = dateString.split('/');
        let day = parseInt(splited[0]);
        let month = parseInt(splited[1]) - 1;
        let year = parseInt(splited[2]);

        let testDate = new Date(year, month, day);

        if (testDate.getFullYear() !== year || testDate.getMonth() !== month || testDate.getDate() !== day) {

            return "invalidDate";
        }

        if (year >= 2024) {
            return "futureDate";
        }

		let age=calculateAge(day, month, year);

       // calculateAge(day, month, year);
	   if (age < 18)
	   {
		   return "minor";
	   }
        return true;

    }


    function calculateAge(day, month, year) {
        let ageInp = document.getElementById("age");

        let currentDate = new Date();

        let currentDay = currentDate.getDate();
        let currentMonth = currentDate.getMonth() + 1;
        let currentYear = currentDate.getFullYear();

        let age = currentYear - year;

        if (currentMonth < month || (currentMonth === month && currentDay < day)) {
            age--;
        }

        ageInp.value = age;
		//ageInp.disabled=true;

         return age;
    }

    function alertDisplay(msg) {
        document.getElementById("alertBox").style.display = 'block';
        document.getElementById("alertBox").style.background = "linear-gradient(147deg, #990000 0%, #ff0000 74%)";
        document.getElementById("msg").innerHTML = msg;
        document.getElementById("progressBar").style.animation = 'progress 3s 1 ease-in-out';
        setTimeout(function () {
            document.getElementById("alertBox").style.display = 'none';
        }, 3000);

    }

    function alertDisplayLogin(msg) {
        document.getElementById("alertBoxLogin").style.display = 'block';
        document.getElementById("alertBoxLogin").style.background = "linear-gradient(147deg, #990000 0%, #ff0000 74%)";
        document.getElementById("msglogin").innerHTML = msg;
        document.getElementById("progressBarLogin").style.animation = 'progress 3s 1 ease-in-out';
        setTimeout(function () {
            document.getElementById("alertBoxLogin").style.display = 'none';
        }, 3000);

    }

    function alertDisplayLogout(msg) {
		document.getElementById("alertBoxLogoutParent").style.display = 'block';
        document.getElementById("alertBoxLogout").style.display = 'block';     
        document.getElementById("msglogout").innerHTML = "YOU WANT TO LOGOUT ?";
        document.getElementById("progressBarlogout").style.animation = 'progress 3s infinite ease-in-out';
  
    }


    function resetForm() {
			
            document.getElementById("fname").value="";
            document.getElementById("lname").value="";
          // document.getElementById("gender").value="";
           // document.getElementById("dob").value="";
           // document.getElementById("age").value="";
            document.getElementById("email").value="";
            document.getElementById("confirmPassword").value="";
            document.getElementById("password").value="";
            document.getElementById("Education").value="";
            document.getElementById("city").value="";
			document.getElementById("state").value="";
            document.getElementById("addressArea").value="";
            document.getElementById("mobile").value="";
           // document.querySelectorAll('input[name="Skills"]:checked')
		   let city=document.getElementById("city");
            city.disabled=true;
//			let ageInp = document.getElementById("age");
//			ageInp.disabled=true;

//           var checkboxes = document.querySelectorAll('input[type="checkbox"]');
//         checkboxes.forEach(function(checkbox) {
//        checkbox.checked = false;
//        });

    
//    var radioButtons = document.querySelectorAll('input[type="radio"]');
//    radioButtons.forEach(function(radioButton) {
//        radioButton.checked = false;
//    });
    var errorDiv=document.querySelectorAll(".errorDiv");

    errorDiv.forEach(function(item){
       item.innerHTML="&nbsp;";
    });
    console.log("Reset Form");
      		
    }

	
    
    function inputErrorDisplay(e) {

        let err = document.getElementById(e.name + "Error");
        let dobvalidate = /\d{1,2}\/\d{1,2}\/\d{4}/;
       // let passwardExp= /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,15}$/;
	  // let passwardExp=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/; 
        let passwardExp =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,15}$/; 

        //let pattern=/^[a-zA-Z]{1,15}$/;

		//console.log("e",keyCode);

        if (e.id == "fname") {
            if (e.value.match("[^a-zA-Z]{2,15}$")) {
                err.innerHTML = "Error: Name should not contain numbers or spaces";
                console.log("input",e.value);
            } else if (
                (event.keyCode >= 48 && event.keyCode <= 57) || 
                (event.keyCode >= 33 && event.keyCode <= 47) || 
                (event.keyCode >= 58 && event.keyCode <= 64) ||
                (event.keyCode >= 91 && event.keyCode <= 96) ||
                (event.keyCode >= 123 && event.keyCode <= 126) || 
                (event.keyCode >= 96 && event.keyCode <= 105)|| 
				event.keyCode >= 186 && event.keyCode <= 192 || event.keyCode >= 219 && event.keyCode <= 222 ||
                event.keyCode == 32 )
             {
                event.preventDefault();
                err.innerHTML = "Error: Name should not contain numbers or spaces";
            } else if (event.target.value.length > 15 && event.keyCode !== 8) {
                event.preventDefault();
                err.innerHTML = "Error: Exceeds the limit enter up to 15 characters";
            } else {
                err.innerHTML = "&nbsp;";
            }
            e.addEventListener("paste", function(event) {
                
                event.preventDefault();
                err.innerHTML = "Error: Pasting is not allowed";
            });
        }
        else if(e.id == "lname"){
            if (e.value.match("[^a-zA-Z]{2,15}$")) {
                err.innerHTML = "Error: Last Name should not contain numbers or spaces";
            } else if (
                (event.keyCode >= 48 && event.keyCode <= 57) || 
                (event.keyCode >= 33 && event.keyCode <= 47) || 
                (event.keyCode >= 58 && event.keyCode <= 64) ||
                (event.keyCode >= 91 && event.keyCode <= 96) ||
                (event.keyCode >= 123 && event.keyCode <= 126) || 
                (event.keyCode >= 96 && event.keyCode <= 105)|| 
				event.keyCode >= 186 && event.keyCode <= 192 || event.keyCode >= 219 && event.keyCode <= 222 ||
                event.keyCode == 32 )
             {
                event.preventDefault();
                err.innerHTML = "Error: Last Name should not contain numbers or spaces";
            } else if (event.target.value.length > 15 && event.keyCode !== 8) {
                event.preventDefault();
                err.innerHTML = "Error: Exceeds the limit enter up to 15 characters";
            } else {
                err.innerHTML = "&nbsp;";
            }
            e.addEventListener("paste", function(event) {
                
                event.preventDefault();
                err.innerHTML = "Error: Pasting is not allowed";
            });

        }
        
        
        else if (e.id == "dob") {
            let dateValidationResult = isValidDate(e.value);
            let dobdate=document.getElementById(e.id);
           
            
            if (/[a-zA-Z\s]/.test(e.value)) {
                e.value = e.value.replace(/[a-zA-Z\s]/g, ''); 
                err.innerHTML = "Please enter numbers only";
                return;
            }
            if (e.value.length > 10) {
                e.value = e.value.substring(0, 10); 
               // err.innerHTML = "";
                return;
            }
			         
              else  if (!dobvalidate.test(e.value)) {
                    err.innerHTML = "Please enter a valid date of birth in the format dd/mm/yyyy";
                }
                
                else if (dateValidationResult === "invalidFormat") {
                    err.innerHTML = "Please enter a valid date of birth ";
                   
                }
                else if (dateValidationResult === "invalidDate") {
                    err.innerHTML = "Please enter a valid date";
                    
                }
                else if (dateValidationResult === "futureDate") {
                    err.innerHTML = "Date of birth should be before the year 2024";
                    
                }
				 else if (dateValidationResult === "minor") {
                    err.innerHTML = "You are not able to register, your age was less than 18 years";
                    
                }
                else {
                    err.innerHTML = "&nbsp;";
                }
                e.addEventListener("paste", function(event) {
                
                    event.preventDefault();
                    err.innerHTML = "Error: Pasting is not allowed";
                });
                

        }
		else if(e.id=="mobile"){
			if((event.keyCode >=65 && event.keyCode<= 90) || (event.keyCode >= 97 && event.keyCode <=122 ) ||(event.keyCode==32)
				|| (event.keyCode > 31) && (event.keyCode < 48 || event.keyCode > 57))
				{
                 event.preventDefault();
				err.innerHTML ="Mobile number contain only numbers";
			
			}
			else if(!e.value.match("^[6-9][0-9]{8}")){
				
			    err.innerHTML ="Enter correct mobile number";
				
			}
			
			else{
			 err.innerHTML = "&nbsp;";
			}
            e.addEventListener("paste", function(event) {
                
                event.preventDefault();
                err.innerHTML = "Error: Pasting is not allowed";
            });
		
		}
		else if(e.id=="email"){
           // let emailValidREgexp=/(^[a-zA-Z]{2}[a-zA-Z0-9-.]*@[a-z]+([.][a-zA-Z]{2}))/;
           let validEmailid=/^(^[a-z0-9][a-z0-9]*([._][a-z0-9]+)*[@][a-z]+[.][a-z]{2,4}([.][a-z]{1,2})?)$/g;
          //let validEmailid=/^[a-z]{2}[a-zA-Z0-9]*([.]{1}[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z]+)+$/;

           let email_id = document.getElementById(e.id);
           if (event.keyCode==32) {
            event.preventDefault();

           }

           email_id.addEventListener("input",()=>{
            if(email==" "){
                err.innerHTML ="Email id can not contain space";
            }
           else  if(!validEmailid.test(e.value)){
               
			   err.innerHTML ="Enter correct Email id";
			}
            

			else{
			 err.innerHTML = "&nbsp;";
			}
           });
          email_id.addEventListener("paste", function(event) {
                
            event.preventDefault();
            err.innerHTML = "Error: Pasting is not allowed";
        });
            
		
		}
        else if(e.id=="age"){
            if (/[a-zA-Z]/.test(e.value)) {
                e.value = e.value.replace(/[a-zA-Z]/g, ''); 
                err.innerHTML = "Please enter numbers only";
                return;
            }
			else if(e.value <18){
			      err.innerHTML="Not able to register, Your age is less than 18";
			}

        }
		else if(e.id=="password"){
            if (e.value.length > 15) {
                e.value = e.value.substring(0, 15); 
                err.innerHTML = "Password can only contain 15 characters";
                return;
            }
            if (!e.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/)) {
                err.innerHTML = "Password must contain at length 8 to 15,one capital letter,one digit,and one special character";
            }
           
            else {
                err.innerHTML = "&nbsp;";
            }
            
		}
		else if(e.id=="confirmPassword"){
		    if(!checkPassword()){

			  err.innerHTML = "Password mismatch";
			}
			else{
			err.innerHTML = "&nbsp;";
			}
            e.addEventListener("paste", function(event) {
                
                event.preventDefault();
                err.innerHTML = "Error: Pasting is not allowed";
            });
		}
		else if(e.id=="pincode"){
			if (/[a-zA-Z\W]/.test(e.value)) {
                e.value = e.value.replace(/[a-zA-Z\W]/g, ''); 
                err.innerHTML = "Please enter numbers only";
                return;
            }
            if (e.value.length > 6) {
                e.value = e.value.substring(0, 6); 
                err.innerHTML = "Pincode can only contain 6 numbers";
                return;
            }

		  else if(!e.value.match("^[1-9]{1}[0-9]{2}[0-9]{3}$")){
		   err.innerHTML = "Enter correct pincode";
		   }
		  
		   else{
		   err.innerHTML = "&nbsp;";
		   }
           e.addEventListener("paste", function(event) {
                
            event.preventDefault();
            err.innerHTML = "Error: Pasting is not allowed";
        });
		}

    }
	
	function state(){
	let state = document.getElementById("state").value;
	if(state !=""){
	   let city = document.getElementById("city");
	   city.disabled=false;
	}
	}

	function checkPassword(){
	      let password = document.getElementById("password").value;
		 let confirmPassword = document.getElementById("confirmPassword").value;
		 if(password==confirmPassword){
		    return true;
		 }
 
	}

function showLoginPoup(){
	let loginProfile=document.getElementById("loginProfile").innerHTML;
	console.log("loginProfile ",loginProfile);
	var currentURL = window.location.href;
	var hash = window.location.hash;
	console.log("Current URL: " + currentURL + hash);
	
	if(loginProfile=="Login/Regsiter"){
		document.getElementById("popupDiv").style.display="block";
		
	}
	
	else{
		//fetchUserInfo();
		/*if(currentURL=="http://localhost:8080/FinalJspProject/index.jsp#" || currentURL=="http://localhost:8080/FinalJspProject/index.jsp"){
			console.log("inside if");
			window.location.href="./jsp/ViewUser.jsp";
		}
		else{
			console.log("inside else");
		window.location.href="../jsp/ViewUser.jsp";
		}*/
		window.location.href="ViewUser.jsp";
	}
		
}

function fetchUserInfo() {
   
    fetch('CommonController', {
        method: 'GET', 
        
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
       
        displayUserInfo(data); 
    })
    .catch(error => {
        console.error('There was a problem with your fetch :');
    });
}

function displayUserInfo(userInfo) {
    
    document.getElementById("firstName").innerText = userInfo.firstName;
    document.getElementById("lastName").innerText = userInfo.lastName;
    document.getElementById("mobileNo").innerText = userInfo.mobileNo;
    document.getElementById("email").innerText = userInfo.email;
    document.getElementById("address").innerText = userInfo.address;
    document.getElementById("state").innerText = userInfo.state;
    document.getElementById("city").innerText = userInfo.city;
}
function closeLoginPopup(){
	document.getElementById("Username").value="";
    document.getElementById("Password").value="";
    document.getElementById("popupDiv").style.display="none";
}

function showRegisterPopup(){
	LoginpopupDiv.style.display = "none";
	RegisterPopup.style.display="block";
	
	 $.ajax({
	      	url: "./CommonController",
	          type: "POST",                 
	          data:{
	      		"action":"getStateData",
	      		"locationID":"1"
	      } ,
	      success: function (data){
	    	 // alert("Success State");
	    	    let option="<option value='' selected> Select State";
	    	    let state=[];
	    	    console.log("state",data);
	    	    data=data.replace("[","").replace("]","").replace(" ","");
	    	    state=data.split(",");
	    	    state.forEach(states => {
	    	    	option +="<option value='"+states.trim()+"' >"+states.trim();
	    	    })
	    	    $("#state").html(option);
	    	
	      } ,
	      error : function (data){
	    	  console.log("error ",data)
	    	  alert("Error State");
	    	 
	      }
	      
	      
	 });
}

function closeRegisterPopup(){
	LoginpopupDiv.style.display = "none";
	RegisterPopup.style.display="none";
	validate.resetForm();
}

function loginValidation(e){
	 let err = document.getElementById(e.name + "Error");
    let pattern=/^[a-zA-Z0-9_@.]{8,20}$/;
    
	  if(e.id=="Username"){  
       if (!/^[a-zA-Z0-9_@.]{8,20}$/.test(e.value)) {
           err.innerHTML = "Please enter alphanumeric characters, underscores, '@', or periods only .";
          
           e.preventDefault(); 
           return false; 
       } else {
           err.innerHTML = "&nbsp;";
       }
	  }
	  else if(e.id=="Password"){
	   if (e.value.length > 14) {
         err.innerHTML = "Please enter upto 15 characters ";
	  }
	  else{
	  err.innerHTML = "&nbsp;";
	  }
	  }

}


}
