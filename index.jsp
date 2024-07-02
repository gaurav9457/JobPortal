

<%@page import="com.jobPortal.beans.PostJob"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jobPortal.ActionBean.CommonActionBean"%>
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
#UsedCarsContainer {
     /* border: 0.5px solid grey;  */
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

#imgDiv {
    height: 80px;
    width: 100px;
    border-radius: 1px;
    margin-left: 35px;
    margin-top: 10px;
}

.jobCard {
    display: inline-block;
    width: 255px;
    height: 330px;
    border: 1px solid grey;
    margin: 14px;
    box-shadow: 10px 10px 2px rgba(0, 0, 0, 0.1);
    color: black;
    vertical-align: top;
    font-size: 16px;
    border-radius: 10px;
}

.jobCard:hover {
    box-shadow: 2px 10px 10px rgba(98, 163, 238, 0.4);
}

.carCardContent {
    padding: 15px;
    margin-top: 10px;
}

.carCardprice {
    display: block;
    font-size: 15px;
    font-weight: bold;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 225px;
    height: 19px;
}

.carCardName {
    line-height: 40px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    background-color: rgb(218, 223, 223);
    border-radius: 5px;
    color: #3b91f5;
}

.cardButton {
    padding: 10px 15px;
    background: linear-gradient(to right, #24c6dc, #514a9d);
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    font-size: 17px;
    margin-left: 56px;
    margin-top: 15px;
}

.cardButton:hover {
    background: linear-gradient(to right, #50c9c3, #96deda);
    border-color: white;
    color: white;
}

.jobTitle {
    margin-top: 10px;
}
</style>
</head>
<body>
  <div id="mainContainer">
     <div>
     <jsp:include page="Navbar.jsp"></jsp:include>
     </div>
     <% if(request.getAttribute("successMessage") != null) { %>
    <p  class="message" style="color: green;"><%= request.getAttribute("successMessage") %></p>
    
<% } %>


<% if(request.getAttribute("errorMessage") != null) { %>
    <p  class="message"  style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<% if(request.getAttribute("EmailError") != null) { %>
    <p  class="message"  style="color: red;"><%= request.getAttribute("EmailError") %></p>
<% } %>
<% if(request.getAttribute("isPasswordChanged") != null) { %>
    <p  class="message"  style="color: Blue;"><%= request.getAttribute("isPasswordChanged") %></p>
<% } %>
    <% /* CommonActionBean cBean=new CommonActionBean(); */
   CommonActionBean.getAllJobs(request, response);%>    
   
      <div id="midBanner">
        <div id="midBannerHeading">
        <h1 id="midBannerHeading1"> Find Your dream job now</h1>
        <h4 id="midBannerheading2">5 lakh+ jobs for you</h4>
        </div>

       
            <div class="search-container">
                <div class="search">
                    <div>
                        <input id="searchBarTop" title="start typing company name"
                            placeholder="Search Company" type="text" >
                             <div class="custom-dropdown-content" id="dropdown">

                               </div>
                    </div>
                    
                   
                </div>
                <div id="stateSelect">
                    <select title="state" name="category" id="NavstateSelect">
                        <option value="" selected><%=request.getParameter("navSelect")!=null ? request.getParameter("navSelect") : "Select State"%></option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Gujrat">Gujrat</option>
                        <option value="Goa">Goa</option>
                        <option value="Rajastan">Rajastan</option>
                    </select>
                </div>
                <div id="expDivSelect">
                    <select title="state" name="category" id="expSelect">
                        <option value="" selected><%=request.getParameter("selectedExp")!=null ? request.getParameter("selectedExp") : "Select Expreience"%></option>
                        <option value="0">Fresher</option>
                        <option value="1">1-2 Years</option>
                        <option value="5">3-5 Years</option>
                        <option value="7">7-9 Years</option>
                    </select>
                </div>
            </div>
     
      </div>
      
    <div>
    
     <div id="UsedCarsContainer">
               <div class="cardBodyParent" class="">
               
               </div>
              
               <div style="clear: both;"></div>
               </div>
               
        <div id="UsedCars">
           <h1 style="color:#52a8ee;font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Available Job's</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("AllJobs")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("AllJobs");
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
      <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form> 
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
              
             
              
              
               <div id="UsedCars">
           <h1 style="color:#529bee;">Job By State</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("searchedJobState")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("searchedJobState");
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
      <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form> 
      </div>
    </div>

    <%
      }
          }
            else {
              %>
              <p>No Searched Job found .</p>
          <% } %>  
    
              </div>
              <div style="clear: both;"></div>
              </div>   
              
              <div id="UsedCars">
           <h1 >Job By Company Name</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("searchedJobByName")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("searchedJobByName");
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
      <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form> 
      </div>
    </div>

    <%
      }
          }
            else {
              %>
              <p>No Searched Job found .</p>
          <% } %>  
    
              </div>
              <div style="clear: both;"></div>
              </div> 
              
              <%-- <div id="UsedCars">
           <h1 style="color:#529bee;">Job By Experience</h1>
            <div id="cardBodyParent" class="">
              <%if(session.getAttribute("searchedJobByExp")!=null) {
                System.out.println("Car By Price");
          ArrayList Scars = (ArrayList) session.getAttribute("searchedJobByExp");
          Iterator iteratorS = Scars.iterator();
          while(iteratorS.hasNext()){
              PostJob jobS = (PostJob) iteratorS.next();
              int randomImageIndex = (int) (Math.random() * 4) + 1;
              String imageName = "company" + randomImageIndex + ".jpg";
              String imagePath = "images/" + imageName;
      %>  
                  <div id="cardBody" class="">
    <div id="imgDiv">
      <img id="imgDiv" src="<%=imagePath%>" alt="">
    </div>
    <div id="carCardContent">
       <div id="carCardName" style="text-align: center;"><%=jobS.getCompanyName() %></div> <br>
     <span id="carCardprice"><%=jobS.getAboutCompany() %></span> <br> 
     <span id="jobTitle"><%=jobS.getRole() %></span> <br> 
     <span>Rs <%=jobS.getJobPackage() %> Lakh</span>
      <form action="ViewJobDetails.jsp?id=<%=jobS.getJobId() %>">
          <input type="hidden" value="<%=jobS.getJobId() %>" name="id"/>
          <input type="submit" value="view Job" id="cardButton"/>
        </form> 
      </div>
    </div>

    <%
      }
          }
            else {
              %>
              <p>No Searched Job found .</p>
          <% } %>  
    
              </div>
              <div style="clear: both;"></div>
              </div>  --%>  
    </div>
      <h1></h1>
      <jsp:include page="Slider.jsp"></jsp:include>
      <h1></h1>
       <jsp:include page="Footer.jsp"></jsp:include>
 
  <jsp:include page="LoginPage.jsp"></jsp:include>
  <jsp:include page="registerUser.jsp"></jsp:include>
 
  
   </div>
  
  
</body>
<script src="./js/scriptMain.js"></script>
<script>
var carBrands = ["Naaptol", "Tcs", "Infosys", "Tech-Mahindra"];


document.getElementById("searchBarTop").addEventListener("click", function() {
    var dropdown = document.getElementById("dropdown");
    dropdown.innerHTML = ''; 
    carBrands.forEach(function(brand) {
        var a = document.createElement("a");
        a.textContent = brand;
        a.href = "./CommonController?action=searchJobByName&brand="+brand; 
        dropdown.appendChild(a);
    });
    dropdown.style.display = "block"; 
});


window.addEventListener("click", function(event) {
    if (!event.target.matches("#searchBarTop")) {
        var dropdowns = document.getElementsByClassName("custom-dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var dropdown = dropdowns[i];
            if (dropdown.style.display === "block") {
                dropdown.style.display = "none";
            }
        }
    }
});
</script>
</html>