$(function () {
    $("#Email").on("input", function (event) {
        loginValidation(event.target);
    });

    $(".message").each(function () {
        var message = $(this);
        setTimeout(function () {
            message.hide();
        }, 2000);
    });

    function loginValidation(e) {
        let err = $("#" + e.name + "Error");
        let pattern = /^[a-zA-Z0-9_@.]{8,20}$/;

        if (e.id == "Password") {
            if (e.value.length > 14) {
                err.html("Please enter up to 15 characters ");
            } else if (e.value == "") {
                err.html("Please enter password");
            } else {
                err.html("&nbsp;");
            }
        }
    }
    
    $("#Username").on("input",function (event){
   	 loginValidation(event.target);
   	 });

   	 function loginValidation(e){
   		let err = $("#"+e.name + "Error");
            let pattern=/^[a-zA-Z0-9_@.]{8,20}$/;
            
   		  if(e.id=="Username"){  
               if (/[#$%&*()!^]/.test(e.value)) {
                   e.value = e.value.replace(/[#$%&*()!^]/g, ''); 
                   err.html("Error: Username contain underscores, '@', or periods only. ");
                   return;
               }
               if (!/^[a-zA-Z0-9_@.]{8,20}$/.test(e.value)) {
                   err.html("Please enter alphanumeric characters, underscores, '@', or periods only.");
                  
                  // e.preventDefault(); 
                 //  return false; 
               } else {
                   err.html("&nbsp;");
               }
   		  }
   		  else if(e.id=="Password"){

   		   if (e.value.length > 14) {
                 err.html("Please enter upto 15 characters ");
   		  }
   		  else if(e.value==""){
   		  err.html("Please enter password");
   		  }
   		 
   		  else{
   		  err.html("&nbsp;");
   		  }

   		 }
   	
   	}
    
    
   /* $("#login-Btn").click(function (event){
    	let loginProfile = $("#loginProfile").html();

        if (loginProfile == "Login/Register") {
            $("#LoginpopupDiv").css("display", "block");
        } else {
            fetchUserInfo();
            window.location.href = "jsp/ViewUser.jsp";
        }
    });*/

    $("#Loginbtn").click(function (event) {
        event.preventDefault();
        var email = $("#Username").val(); 
        var userType = $('input[name="userType"]:checked').val();
        console.log("User"+userType);
        var password = $("#Password").val();
        var action=$('input[name="action"]').val();
       
        if (email === "" || password === "" || !userType) { 
        	alertDisplayLogin("Please fill all the fields","red");
        } else {
            $.ajax({
            	url: "./CommonController",
                method: "POST",                 
                data:{
            		"action":"Login",
            		"email":email,
            		"password":password,
            		"userType":userType
            } ,
            success: function (response) {
                var responseData = JSON.parse(response);
                alertDisplayLogin(responseData.message, "green");
                setTimeout(function () {
                    window.location.href = "index.jsp";
                }, 2000);
               /* if(userType=="admin"){
                	 $("#applyNow_btn").hide();
                	 $("#applyNowSpan").hide();
                }*/
            },
            error: function (error) {
               // console.error("AJAX Error:",error);
                var errorMessage = "Unknown error occurred.";
                if (error.responseJSON && error.responseJSON.message == "Inactive user") {
                    errorMessage = error.responseJSON.message;
                } else if (error.responseText) {
                    setMessage = JSON.parse(error.responseText);
                    errorMessage=setMessage.message;
                }
                alertDisplayLogin(errorMessage, "red");
            }
            });
        }
        console.log(email,password,action);
    });
    
    $("#state").on("change", function() {
        var selectedState = $(this).val();
       
        $.ajax({
            url: './CommonController',
            type: 'POST', 
            data: {"action":"getCities", 
            	"state": selectedState 
            	},
            	
            success: function(data) {
              //  alert("City Success");
                //console.log("AJAX call successful:",data);
                let option="<option value='' selected> Select City";
	    	    let city=[];
	    	    console.log("city",data);
	    	    data=data.replace("[","").replace("]","").replace(" ","");
	    	    city=data.split(",");
	    	    city.forEach(cities => {
	    	    	option +="<option value='"+cities+"' >"+cities;
	    	    })
	    	    $("#city").html(option);
            },
            error: function(error) {
            	//alert("City Error");
                console.log("Error:");
            }
        });
    });
    
   /* function alertDisplayLogin(msg,color) {
        $("#alertBoxLogin").fadeIn();
        $("#alertBoxLogin").css("background", color);
        $("#msglogin").text(msg);
         $("#progressBarLogin").css("animation", 'progress 3s 1 ease-in-out');
        $(".closebtn").click(function () { $("#alertBoxLogin").fadeOut(); })
 			setTimeout(function () {
 				$("#alertBoxLogin").fadeOut();
 			}, 2000);
     }*/
    
    $('#NavstateSelect').change(function() {
        var selectedLocation = $(this).val();
        var innerValue = $(this).find('option:selected').text();
        $.ajax({
            type: 'POST',
            url: './CommonController',
            data: {"action":"selectState", 
            	location: selectedLocation 
            	},
            success: function(data) {
                console.log("Success");
               // $("#midBanner").toggle();
              // alert(data+" Success");
             console.log("data"+data);
               window.location.href="index.jsp?navSelect="+innerValue;
               
               
            },
            error: function(xhr, status, error) {
                console.error('Error:', status, error);
            }
        });
    });
    
    $('#expSelect').change(function() {
        var selectedLocation = $(this).val();
        var innerValue = $(this).find('option:selected').text();
        $.ajax({
            type: 'POST',
            url: './CommonController',
            data: {"action":"selectExp", 
            	location: selectedLocation 
            	},
           /* success: function(data) {
                console.log("Success");
              
             console.log("data"+data);
             window.location.href="index.jsp?selectedExp="+innerValue;
             $('#expSelect').val(selectedLocation);
            
               
            },*/
            	 success: function(data) {
                     console.log("Success");
                    // $("#midBanner").toggle();
                    //alert(data+" Success");
                  console.log("data"+data);
                  /*try {*/
               	    $('.cardBodyParent').empty(); 
               	    var filterData = JSON.parse(data);
               	    if (filterData.length > 0) {
               	        for (var i = 0; i < filterData.length; i++) {
               	            var job = filterData[i];
               	            
               	           
               	            var html = '<div class="jobCard">' +
               	                           '<div id="imgDiv">' +
               	                               '<img id="imgDiv" src="./staticContent/'+job.companyLogo+'" alt="">' +
               	                           '</div>' +
               	                           '<div class="carCardContent">' +
               	                               '<div class="carCardName" style="text-align: center;">' + job.companyName + '</div><br>' +
               	                               '<span class="carCardprice">' + job.aboutCompany + '</span><br>' +
               	                               '<span class="jobTitle">' + job.role + '</span><br>' +
               	                               '<span>Rs ' + job.jobPackage + ' Lakh</span>' +
               	                               '<form action="ViewJobDetails.jsp?id=' + job.jobId + '">' +
               	                                   '<input type="hidden" value="' + job.jobId + '" name="id"/>' +
               	                                   '<input type="submit" value="view Job" class="cardButton"/>' +
               	                               '</form>' +
               	                           '</div>' +
               	                       '</div>';
               	            
               	            $('.cardBodyParent').append(html); 
               	        }
               	    } else {
               	    	var HTML='<div ><p style="font-size:20px;color:red;">No jobs found.</p></div>';
               	        $('.cardBodyParent').append(HTML); 
               	    }
               	/*} catch (e) {
               	    console.log("Error:", e); 
               	}*/
                 
                 },
            error: function(xhr, status, error) {
                console.error('Error:', status, error);
            }
        });
    });
    
    

  
});

function inactiveUser(userId){
	console.log("inactive");
	$.ajax({
     	url: "./CommonController",
         method: "POST",                 
         data:{
     		"action":"userInactive",
     		"userId":userId,
     		
     } ,
     success: function (response) {
    	 $("#activeBtn"+userId).text("Inactivated");
    	 $("#activeBtn"+userId).attr("disabled", true);
    	 $("#activeBtn"+userId).removeClass("success");
   
          
     },
         error: function (error) {
         	console.error("AJAX Error:");
             alert("Unable to inactive");
         	//alertDisplayLogin("User Not Found check email id, password","red");
            
         }
     });
}



function inactiveJob(jobId){
	console.log("inactive");
	$.ajax({
     	url: "./CommonController",
         method: "POST",                 
         data:{
     		"action":"jobInactive",
     		"jobId":jobId,
     		
     } ,
     success: function (response) {
    	 $("#activeBtn"+jobId).text("Inactivated");
    	 $("#activeBtn"+jobId).attr("disabled", true);
    	 $("#activeBtn"+jobId).removeClass("success");
   
          
     },
         error: function (error) {
         	console.error("AJAX Error:");
             alert("Unable to inactive");
         	//alertDisplayLogin("User Not Found check email id, password","red");
            
         }
     });
}

function getPostedCars(id){
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"getPostedJob",
	      		"companyId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  window.location.href="ViewPostedJob.jsp"
	    	  
	      } ,
	      error : function (data){
	    	  //alert("Error");
	    	  window.location.href="index.jsp"
	      }
	      
	      
	 });
}

function getPostedJobByCompany(id){
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"getPostedJob",
	      		"companyId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  window.location.href="jobByCompany.jsp"
	    	  
	      } ,
	      error : function (data){
	    	  //alert("Error");
	    	  window.location.href="jobByCompany.jsp"
	      }
	      
	      
	 });
}

function viewAppliedJob(id){
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"viewAppliedJob",
	      		"userId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  window.location.href="ViewAppliedJob.jsp?userId="+id;
	    	  
	      } ,
	      error : function (data){
	    	  //alert("Error");
	    	  window.location.href="index.jsp"
	      }
	      
	      
	 });
}

function alertDisplayLogin(msg,color) {
	console.log("alert popup");
    $("#alertBoxLogin").fadeIn();
    $("#alertBoxLogin").css("background", color);
    $("#msglogin").text(msg);
     $("#progressBarLogin").css("animation", 'progress 3s 1 ease-in-out');
    $(".closebtn").click(function () { $("#alertBoxLogin").fadeOut(); })
			setTimeout(function () {
				$("#alertBoxLogin").fadeOut();
			}, 2000);
 }

function popupDisplay(msg){
	$("#myModal").show();
	$("#modal-msg").text(msg);
	 $("#progressBarLogi").css("animation", 'progres 3s 1 ease-in-out');
	$("#modal-close").click(function () { $("#myModal").fadeOut(); })
	$(".modal").click(function () { $("#myModal").fadeOut(); })
	setTimeout(function () {
		$("#myModal").fadeOut();
	}, 2000);
	
}
function applyJob(id){
	console.log("car id"+id);
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"applyJob",
	      		"companyId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  if(data=="liked"){
	    		  popupDisplay("Job Applied successfully");
		        	 $("#applyNow_btn").text("Applied");
		        	// window.location.href = "index.jsp";
		         }
		         else if(data=="unliked"){
		        	 popupDisplay("Remove job from applied");
		        	 $("#applyNow_btn").text("Apply Now");
		        	 //window.location.href = "index.jsp";
		         }
		         else if(data=="contacted"){
		        	 popupDisplay("Company Contacted you ");
		        	 $("#applyNow_btn").text("Contacted");
		         }
		         else if(data=="NotFound"){
		        	 popupDisplay("Please Login First");
			    	  //window.location.href = "index.jsp";
		         }
		         else{
		        	 alert(data);
		         }
	      } ,
	      error : function (data){
	    	  console.log(data);
	    	  //alert("Please Login First error");
	    	  let msg="Please login first";
	    	  popupDisplay(msg);
	    	 // alertDisplayLogin(msg, "red");
	    	 // window.location.href = "index.jsp";
	      }
	      
	      
	 });
}

function viewAppliedUsers(id){
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"viewAppliedUsers",
	      		"jobId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  window.location.href="ViewAppliedUsers.jsp?jobId="+id;
	    	  
	      } ,
	      error : function (data){
	    	  //alert("Error");
	    	  window.location.href="index.jsp"
	      }
	      
	      
	 });
}


function contactUser(userId,jobId){
	console.log("inactive");
	$.ajax({
     	url: "./CommonController",
         method: "POST",                 
         data:{
     		"action":"contactUser",
     		"userId":userId,
     		"jobId":jobId,
     		
     } ,
     success: function (response) {
    	 $("#activeBtn"+userId).text("Contacted");
    	 $("#activeBtn"+userId).attr("disabled", true);
    	 $("#activeBtn"+userId).removeClass("success");
   
          
     },
         error: function (error) {
         	console.error("AJAX Error:");
             alert("Unable to Contact");
         	//alertDisplayLogin("User Not Found check email id, password","red");
            
         }
     });
}

function checkStatus(jobId,userId){
	console.log("inactive");
	$.ajax({
     	url: "./CommonController",
         method: "POST",                 
         data:{
     		"action":"checkStatus",
     		"userId":userId,
     		"jobId":jobId,
     		
     } ,
     success: function (response) {
    	 /*$("#activeBtn"+userId).text("Contacted");
    	 $("#activeBtn"+userId).attr("disabled", true);
    	 $("#activeBtn"+userId).removeClass("success");*/
    	
    	 window.location.href="CheckStatusPage.jsp"; 
    	// $("#myModal").css("display", "block");
          
     },
         error: function (error) {
         	console.error("AJAX Error:");
             alert("Unable to Contact");
             alert("Unable to Check Status")
         	//alertDisplayLogin("User Not Found check email id, password","red");
            
         }
     });
}

function searchSkill(){
	  var searchSkill = $("#searchSkillBar").val();
      console.log(searchSkill);
      $.ajax({
          type: 'POST',
          url: './CommonController',
          data: {
        	  "action":"searchSkills", 
          	skills: searchSkill 
          	},
          success: function(data) {
              console.log("Success");
             // $("#midBanner").toggle();
             //alert(data+" Success");
           console.log("data"+data);
           try {
        	    $('.cardBodyParent').empty(); 
        	    var filterData = JSON.parse(data);
        	    if (filterData.length > 0) {
        	        for (var i = 0; i < filterData.length; i++) {
        	            var job = filterData[i];
        	            
        	           
        	            var html = '<div class="jobCard">' +
        	                           '<div id="imgDiv">' +
        	                               '<img id="imgDiv" src="./staticContent/'+job.companyLogo+'" alt="">' +
        	                           '</div>' +
        	                           '<div class="carCardContent">' +
        	                               '<div class="carCardName" style="text-align: center;">' + job.companyName + '</div><br>' +
        	                               '<span class="carCardprice">' + job.aboutCompany + '</span><br>' +
        	                               '<span class="jobTitle">' + job.role + '</span><br>' +
        	                               '<span>Rs ' + job.jobPackage + ' Lakh</span>' +
        	                               '<form action="ViewJobDetails.jsp?id=' + job.jobId + '">' +
        	                                   '<input type="hidden" value="' + job.jobId + '" name="id"/>' +
        	                                   '<input type="submit" value="view Job" class="cardButton"/>' +
        	                               '</form>' +
        	                           '</div>' +
        	                       '</div>';
        	            
        	            $('.cardBodyParent').append(html); 
        	        }
        	    } else {
        	        $('.cardBodyParent').html('<p style="font-size:20px;color:red;">No jobs found.</p>'); 
        	    }
        	} catch (e) {
        	    console.log("Error:", e); 
        	}
          
          },
          error: function(xhr, status, error) {
              console.error('Error:', status, error);
          }
      });
	
}


function inactiveCompany(companyId){
	console.log("inactive");
	$.ajax({
     	url: "./CommonController",
         method: "POST",                 
         data:{
     		"action":"companyInactive",
     		"companyId":companyId,
     		
     } ,
     success: function (response) {
    	 $("#activeBtn"+companyId).text("Inactivated");
    	 $("#activeBtn"+companyId).attr("disabled", true);
    	 $("#activeBtn"+companyId).removeClass("success");
   
          
     },
         error: function (error) {
         	console.error("AJAX Error:");
             alert("Unable to inactive");
         	//alertDisplayLogin("User Not Found check email id, password","red");
            
         }
     });
}



function contactUserByCompany(id){
	console.log("car id"+id);
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"contactUserByCompany",
	      		"userId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  if(data=="liked"){
	    		  
	    		 alert("Employee contacted successfully");
		        	 $("#activeBtn"+userId).text("Contacted");
		        	// window.location.href = "index.jsp";
		         }
		         else if(data=="unliked"){
		        	 alert("Remove employee from contated");
		        	 $("#activeBtn"+userId).text("Contact Now");
		        	 //window.location.href = "index.jsp";
		         }
		         else if(data=="contacted"){
		        	 alert("Company Contacted you ");
		        	 $("#activeBtn"+userId).text("Contacted");
		         }
		         else if(data=="NotFound"){
		        	 alert("Please Login First");
			    	  //window.location.href = "index.jsp";
		         }
		         else{
		        	 alert(data+" jkkkkjkk");
		         }
	      } ,
	      error : function (data){
	    	  console.log(data);
	    	  //alert("Please Login First error");
	    	  let msg="Please login first";
	    	  alert(msg);
	    	 // alertDisplayLogin(msg, "red");
	    	 // window.location.href = "index.jsp";
	      }
	      
	      
	 });
}


function viewCompanyContacted(id){
	 $.ajax({
	      	url: "./CommonController",
	          method: "POST",                 
	          data:{
	      		"action":"viewCompanyContacted",
	      		"userId":id,
	      } ,
	      success: function (data){
	    	  //alert("Success");
	    	  window.location.href="viewCompanyContacted.jsp?userId="+id;
	    	  
	      } ,
	      error : function (data){
	    	  alert("Error");
	    	  window.location.href="index.jsp"
	      }
	      
	      
	 });
}